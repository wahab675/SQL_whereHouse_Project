
/*
 DDl  script create bronze table
 **************************************
 script purpose
              this script  breate table in  the  'bronze' schema dropping exisiting tables
              if they already exist
              run this script to redfeine the ddl Structure of 'bronze' tables
*/

    exec bronze.load_bronze;
    use bronze;
    go
    create or alter procedure bronze.load_bronze as
    Begin  
             declare @start_time datetime, @end_time Datetime, @btach_start_time datetime, @batch_end_time datetime ;

             set @btach_start_time= GETDATE();
             print '==================================================';
             print 'loading bronze layer';

             print'---------------------------';
          -- RAISERROR('Loading bronze.crm_cust_info...', 0, 1) WITH NOWAIT;

          set @start_time = GETDATE();
            TRUNCATE TABLE bronze.crm_cust_info;
            BULK INSERT bronze.crm_cust_info
            FROM 'Q:\Data Engineer\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
            WITH (
                FIELDTERMINATOR = ',',
   
                FIRSTROW = 2,
                TABLOCK
            );
            set @end_time = GETDATE();

            print '.. load Duration'+ cast(Datediff(second,@start_time, @end_time) as NVarchar)+'seconds';
            print'----------------';

             set @start_time = GETDATE();

            -- Truncate and load Product Info
            TRUNCATE TABLE bronze.prd_info;
            print'Inserting data into bronze.prd_info ';
            BULK INSERT bronze.prd_info
            FROM 'Q:\Data Engineer\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
            WITH (
                FIELDTERMINATOR = ',',
   
                FIRSTROW = 2,
                TABLOCK
            );
             set @end_time = GETDATE();
                print '.. load Duration'+ cast(Datediff(second,@start_time, @end_time) as NVarchar)+'seconds';
                print'----------------';


             set @start_time = GETDATE();
            -- Truncate and load Sales Details
            TRUNCATE TABLE bronze.sales_details;
             print'Inserting data into bronze.sales_details ';
            BULK INSERT bronze.sales_details
            FROM 'Q:\Data Engineer\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
            WITH (
                FIELDTERMINATOR = ',',
   
                FIRSTROW = 2,
                TABLOCK
            );

             set @end_time = GETDATE();
              print '.. load Duration'+ cast(Datediff(second,@start_time, @end_time) as NVarchar)+'seconds';
                print'----------------';

             set @start_time = GETDATE();
            -- Truncate and load ERP Customer Data
            TRUNCATE TABLE bronze.cust_az12;
              print'Inserting data into bronze.cust_az12 ';
            BULK INSERT bronze.cust_az12
            FROM 'Q:\Data Engineer\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
            WITH (
                FIELDTERMINATOR = ',',
   
                FIRSTROW = 2,
                TABLOCK
            );

             set @end_time = GETDATE();
              print '.. load Duration'+ cast(Datediff(second,@start_time, @end_time) as NVarchar)+'seconds';
                print'----------------';

             set @start_time = GETDATE();
             print'---------------------------';
             print 'loading ERP Tables';
            -- Truncate and load ERP Location Data
            TRUNCATE TABLE bronze.loc_a101;

            print'Inserting data into bronze.loc_a101 ';
            BULK INSERT bronze.loc_a101
            FROM 'Q:\Data Engineer\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
            WITH (
                FIELDTERMINATOR = ',',
    
                FIRSTROW = 2,
                TABLOCK
            );

             set @end_time = GETDATE();
              print '.. load Duration'+ cast(Datediff(second,@start_time, @end_time) as NVarchar)+'seconds';
                print'----------------';

             set @start_time = GETDATE();
            -- Truncate and load PX Category Data
            TRUNCATE TABLE bronze.px_cat_g1v2;

            print'Inserting data into bronze.px_cat_g1v2 ';
            BULK INSERT bronze.px_cat_g1v2
            FROM 'Q:\Data Engineer\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
            WITH (
                FIELDTERMINATOR = ',',
   
                FIRSTROW = 2,
                TABLOCK
            );
             set @end_time = GETDATE();
             print '.. load Duration'+ cast(Datediff(second,@start_time, @end_time) as NVarchar)+'seconds';
             print'----------------';


             set @batch_end_time = GETDATE();

             print '..Total load Duration'+ cast(Datediff(second,@batch_end_time, @batch_end_time) as NVarchar)+'seconds';

    end

