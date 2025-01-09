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

tb_curso_node1731725547008 = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db", 
    table_name="aws_university_etl_db_public_tb_curso", 
    transformation_ctx="tb_curso_node1731725547008"
)

tb_curso_disciplina_node1731725749779 = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db", 
    table_name="aws_university_etl_db_public_tb_curso_disciplina", 
    transformation_ctx="tb_curso_disciplina_node1731725749779"
)

tb_disciplina_node1731726121115 = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db", 
    table_name="aws_university_etl_db_public_tb_disciplina", 
    transformation_ctx="tb_disciplina_node1731726121115"
)

tb_departamento_node1731726247112 = glueContext.create_dynamic_frame.from_catalog(
    database="aws-university-etl-glue-db", 
    table_name="aws_university_etl_db_public_tb_departamento", 
    transformation_ctx="tb_departamento_node1731726247112"
)

Join_node1731725791855 = Join.apply(
    frame1=tb_curso_disciplina_node1731725749779, 
    frame2=tb_curso_node1731725547008, 
    keys1=["id_curso"], 
    keys2=["id"], 
    transformation_ctx="Join_node1731725791855"
)

ChangeSchema_node1731725826304 = ApplyMapping.apply(
    frame=Join_node1731725791855, 
    mappings=[
        ("id_disciplina", "long", "id_disciplina", "long"),
        ("id_departamento", "long", "id_departamento", "long"),
        ("nome", "string", "nome_curso", "string"),
        ("duracao", "int", "duracao", "int")
    ], 
    transformation_ctx="ChangeSchema_node1731725826304"
)

Join_node1731726106080 = Join.apply(
    frame1=ChangeSchema_node1731725826304, 
    frame2=tb_disciplina_node1731726121115, 
    keys1=["id_disciplina"], 
    keys2=["id"], 
    transformation_ctx="Join_node1731726106080"
)

ChangeSchema_node1731726188043 = ApplyMapping.apply(
    frame=Join_node1731726106080, 
    mappings=[
        ("id_departamento", "long", "id_departamento", "long"),
        ("nome_curso", "string", "nome_curso", "string"),
        ("duracao", "int", "duracao", "int"),
        ("nome", "string", "nome_disciplina", "string"),
        ("creditos", "int", "creditos", "int")
    ], 
    transformation_ctx="ChangeSchema_node1731726188043"
)
Join_node1731726244372 = Join.apply(
    frame1=ChangeSchema_node1731726188043, 
    frame2=tb_departamento_node1731726247112, 
    keys1=["id_departamento"], 
    keys2=["id"], 
    transformation_ctx="Join_node1731726244372"
)
ChangeSchema_node1731726307927 = ApplyMapping.apply(
    frame=Join_node1731726244372, 
    mappings=[
        ("nome_curso", "string", "nome_curso", "string"),
        ("duracao", "int", "duracao", "int"),
        ("nome_disciplina", "string", "nome_disciplina", "string"),
        ("creditos", "int", "creditos", "int"),
        ("nome", "string", "nome_departamento", "string")
    ], 
    transformation_ctx="ChangeSchema_node1731726307927"
)

df = ChangeSchema_node1731726307927.toDF()
ordered_df = df.select(
    "nome_curso", "duracao", "nome_disciplina", "creditos", "nome_departamento"
)
output_path = "s3://manubuckets3/tb_curso_disciplina_csv/"
single_file_df.write.mode("overwrite").csv(output_path, header=True)
job.commit()
