import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

tb_professor = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db",
    table_name="aws_university_etl_db_public_tb_professor"
)

tb_professor_disciplina = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db",
    table_name="aws_university_etl_db_public_tb_professor_disciplina"
)

tb_departamento = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db",
    table_name="aws_university_etl_db_public_tb_departamento"
)

tb_disciplina = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db",
    table_name="aws_university_etl_db_public_tb_disciplina"
)

professor_disciplina_joined = Join.apply(
    frame1=tb_professor,
    frame2=tb_professor_disciplina,
    keys1=["matricula"],
    keys2=["matricula_professor"]
)

professor_departamento_joined = Join.apply(
    frame1=tb_departamento,
    frame2=professor_disciplina_joined,
    keys1=["id"],
    keys2=["id_departamento"]
)

professor_mapped = ApplyMapping.apply(
    frame=professor_departamento_joined,
    mappings=[
        ("nome", "string", "nome_departamento", "string"),
        ("nome_professor", "string", "nome_professor", "string"),
        ("email_professor", "string", "email_professor", "string"),
        ("telefone", "string", "telefone", "string"),
        ("endereco", "string", "endereco", "string"),
        ("cpf", "string", "cpf", "string"),
        ("matricula", "long", "matricula", "long"),
        ("semestre", "int", "semestre", "int"),
        ("id_disciplina", "long", "id_disciplina", "long")
    ]
)

final_joined_data = Join.apply(
    frame1=professor_mapped,
    frame2=tb_disciplina,
    keys1=["id_disciplina"],
    keys2=["id"]
)

final_mapped = ApplyMapping.apply(
    frame=final_joined_data,
    mappings=[
        ("nome_professor", "string", "nome_professor", "string"),
        ("cpf", "string", "cpf", "string"),
        ("email_professor", "string", "email_professor", "string"),
        ("telefone", "string", "telefone", "string"),
        ("endereco", "string", "endereco", "string"),
        ("matricula", "long", "matricula", "long"),
        ("nome_departamento", "string", "nome_departamento", "string"),
        ("nome_disciplina", "string", "nome_disciplina", "string"),
        ("semestre", "int", "semestre", "int")
    ]
)

final_df = final_mapped.toDF()

ordered_df = final_df.select(
    "nome_professor", "cpf", "email_professor", "telefone", "endereco",
    "matricula", "nome_departamento", "nome_disciplina", "semestre"
)

single_file_df = ordered_df.coalesce(1)

output_path = "s3://manubuckets3/tb_professor_disciplina_csv/"
single_file_df.write.mode("overwrite").csv(output_path, header=True)

job.commit()
