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

tb_alunos = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db",
    table_name="aws_university_etl_db_public_tb_aluno"
)

tb_aluno_disciplina = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db",
    table_name="aws_university_etl_db_public_tb_aluno_disciplina"
)

joined_data = Join.apply(
    frame1=tb_aluno_disciplina,
    frame2=tb_alunos,
    keys1=["matricula_aluno"],
    keys2=["matricula"]
)

mapped_data = ApplyMapping.apply(
    frame=joined_data,
    mappings=[
        ("nome_aluno", "string", "nome_aluno", "string"),
        ("cpf", "string", "cpf", "string"),
        ("matricula", "long", "matricula", "long"),
        ("email", "string", "email", "string"),
        ("nome_curso", "string", "nome_curso", "string"),
        ("ano", "int", "ano", "int"),
        ("semestre", "int", "semestre", "int"),
        ("nome_disciplina", "string", "nome_disciplina", "string"),
        ("nota1", "decimal", "nota1", "decimal"),
        ("nota2", "decimal", "nota2", "decimal"),
        ("nota_final", "decimal", "nota_final", "decimal"),
        ("media_global", "decimal", "media_global", "decimal"),
        ("status", "string", "status", "string"),
        ("status_disciplina", "string", "status_disciplina", "string")
    ]
)

ordered_data = mapped_data.toDF().select(
    "nome_aluno", "cpf", "matricula", "email", "nome_curso", 
    "ano", "semestre", "nome_disciplina", 
    "nota1", "nota2", "nota_final", 
    "media_global", "status", "status_disciplina"
)

single_file_output = ordered_data.coalesce(1)

single_file_output.write.mode("overwrite").csv(
    "s3://manubuckets3/tb_aluno_disciplina_csv/",
    header=True
)

job.commit()
