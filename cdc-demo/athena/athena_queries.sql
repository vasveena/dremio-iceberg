-- Create database for the demo
CREATE DATABASE iceberg_demo;

-- Create external table in input CSV files. Replace the S3 path with your bucket name
CREATE EXTERNAL TABLE iceberg_demo.raw_csv_input(
  op string, 
  product_id bigint, 
  category string, 
  product_name string, 
  quantity_available bigint, 
  last_update_time string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://glue-iceberg-demo-620614497509-us-east-1/raw-csv-input/'
TBLPROPERTIES (
  'areColumnsQuoted'='false', 
  'classification'='csv', 
  'columnsOrdered'='true', 
  'compressionType'='none', 
  'delimiter'=',', 
  'typeOfData'='file');
  
-- Create output Iceberg table with partitioning. Replace the S3 bucket name with your bucket name
CREATE TABLE iceberg_demo.iceberg_table (
  product_id bigint,
  category string,
  product_name string,
  quantity_available bigint,
  last_update_time timestamp) 
PARTITIONED BY (category, bucket(16,product_id)) 
LOCATION 's3://glue-iceberg-demo-620614497509-us-east-1/iceberg-output/' 
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_target_data_file_size_bytes'='536870912' 
)

-- Validate the input data
SELECT * FROM iceberg_demo.raw_csv_input;

-- After the first Glue job run, check the Iceberg table
SELECT * FROM iceberg_demo.iceberg_table limit 10;

-- After the second Glue job run, rerun the query and notice the changes made
SELECT * FROM iceberg_demo.iceberg_table limit 10;
