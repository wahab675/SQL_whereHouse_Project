/*
created database and tables 
This procedure loads data into the bronze schema from external csv file.

It performs the following actions:
-truncates the bronze table before loading data.
uses the  bulk 'Bulk insert' command to load data from csv files to bronze tables
*/

IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL DROP TABLE bronze.crm_cust_info;
IF OBJECT_ID('bronze.prd_info', 'U') IS NOT NULL DROP TABLE bronze.prd_info;
IF OBJECT_ID('bronze.sales_details', 'U') IS NOT NULL DROP TABLE bronze.sales_details;
IF OBJECT_ID('bronze.cust_az12', 'U') IS NOT NULL DROP TABLE bronze.cust_az12;
IF OBJECT_ID('bronze.loc_a101', 'U') IS NOT NULL DROP TABLE bronze.loc_a101;
IF OBJECT_ID('bronze.px_cat_g1v2', 'U') IS NOT NULL DROP TABLE bronze.px_cat_g1v2;

-- Step 2: create the table inside that database
CREATE TABLE bronze.crm_cust_info (
  cst_id INT,
  cst_key VARCHAR(50),
  cst_firstname VARCHAR(50),
  cst_lastname VARCHAR(50),
  cst_marital_status VARCHAR(50),
  cst_gndr VARCHAR(50),
  cst_create_date DATE
);


create table bronze.Prd_info(
prd_id INT,
prd_key varchar(50),
prd_nm Varchar(50),
prd_cost int,
prd_line Varchar(50),
prd_start_dt datetime,
prd_end_dt datetime
);

create table bronze.sales_details(
sls_ord_num varchar(50),
sls_prd_key VARCHAR(40),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);
create table bronze.CUST_AZ12(
CID varchar(50),
bdate date,
gen varchar(50)
);

create table bronze.LOC_A101(
cid VARChar(50),
cntry Varchar(50)
);

create table bronze.PX_CAT_G1V2(
id varchar(50),
cat varchar(50),
subacat varchar(50),
maintenance nvarchar(50)
);





 

