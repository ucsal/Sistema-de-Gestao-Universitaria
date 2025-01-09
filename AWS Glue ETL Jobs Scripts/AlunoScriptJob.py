import sys
from awsglue.transforms import Join, ApplyMapping
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.dynamicframe import DynamicFrame

def load_table(glue_context, database, table_name, ctx):
    return glue_context.create_dynamic_frame.from_catalog(
        database=database, table_name=table_name, transformation_ctx=ctx
    )

args = getResolvedOptions(sys.argv, ["JOB_NAME"])
sc = SparkContext()
glue_context = GlueContext(sc)
spark = glue_context.spark_session
job = Job(glue_context)
job.init(args["JOB_NAME"], args)

DATABASE_NAME = "aws-university-etl-glue-db"
tb_aluno = load_table(glue_context, DATABASE_NAME, "aws_university_etl_db_public_tb_aluno", "tb_aluno")
tb_desconto = load_table(glue_context, DATABASE_NAME, "aws_university_etl_db_public_tb_desconto", "tb_desconto")
tb_curso = load_table(glue_context, DATABASE_NAME, "aws_university_etl_db_public_tb_curso", "tb_curso")
tb_departamento = load_table(glue_context, DATABASE_NAME, "aws_university_etl_db_public_tb_departamento", "tb_departamento")

joined_aluno_desconto = Join.apply(
    frame1=tb_aluno, 
    frame2=tb_desconto, 
    keys1=["matricula"], 
    keys2=["matricula_aluno"]
)

mapped_aluno_desconto = ApplyMapping.apply(
    frame=joined_aluno_desconto, 
    mappings=[
        ("matricula", "long", "matricula", "int"),
        ("nome_aluno", "string", "nome_aluno", "string"),
        ("media_global", "decimal", "media_global", "double"),
        ("cpf", "string", "cpf", "string"),
        ("email", "string", "email", "string"),
        ("status", "string", "status", "string"),
        ("tipo_desconto", "string", "tipo_desconto", "string"),
        ("valor_desconto", "decimal", "valor_desconto", "decimal"),
        ("id_curso", "long", "id_curso", "int")
    ]
)

joined_curso = Join.apply(
    frame1=tb_curso, 
    frame2=mapped_aluno_desconto, 
    keys1=["id"], 
    keys2=["id_curso"]
)

joined_curso_departamento = Join.apply(
    frame1=joined_curso, 
    frame2=tb_departamento, 
    keys1=["id_departamento"], 
    keys2=["id"]
)

final_frame = ApplyMapping.apply(
    frame=joined_curso_departamento, 
    mappings=[
        ("nome_curso", "string", "nome_curso", "string"),
        ("nome_aluno", "string", "nome_aluno", "string"),
        ("media_global", "double", "media_global", "double"),
        ("matricula", "int", "matricula", "int"),
        ("cpf", "string", "cpf", "string"),
        ("email", "string", "email", "string"),
        ("status", "string", "status", "string"),
        ("tipo_desconto", "string", "tipo_desconto", "string"),
        ("valor_desconto", "decimal", "valor_desconto", "decimal"),
        ("nome", "string", "nome_departamento", "string")
    ]
)

final_df = final_frame.toDF().coalesce(1)

OUTPUT_PATH = "s3://manubuckets3/tb_aluno_csv/"
final_df.write.mode("overwrite").csv(OUTPUT_PATH, header=True)

job.commit()
