# SQL-Server_to_Snowflake_with_DBT
ETL (Extract, Transform, Load) workflow in which data is moved from SQL Server, a traditional on-premises database, to Snowflake, a cloud-based data warehousing platform. This process is facilitated by DBT (Data Build Tool), which helps automate and manage the data transformation
## Tools
`SQL`
`Snowflake`
`DBT`
`ADF`

## ELT
### 1. Extracting Data from On-Premise SQL Server
**Goal**: Retrieve data from an on-premise SQL Server to make it available in the cloud for transformations and analysis <br>
**Method**: Use Azure Data Factory (ADF), Microsoft's data integration service, to connect to the on-premise SQL Server, retrieve the data, and load it into Snowflake<br>
**Connection Setup**:
-  Self-hosted Integration Runtime (SHIR): To securely access data on an on-premise SQL Server, a Self-hosted Integration Runtime is required. This acts as a bridge between the on-premise SQL Server and Azure Data Factory, allowing ADF to read data from the local SQL Server.
-  Linked Service in ADF: Create a linked service in Azure Data Factory to connect to the SQL Server, specifying details such as the server name, database, and credentials.
-  Data Extraction Process:
Copy Activity: In ADF, a Copy Activity is configured to read data from the on-premise SQL Server tables and stage it in a temporary location  into Snowflake.
### 2. Loading Data into Snowflake
**Goal**: Transfer data from ADF to Snowflake, a cloud data warehouse, where it will be stored for transformation and querying<br>
**Connection to Snowflake**: ADF also needs a linked service for Snowflake, specifying details such as account name, warehouse, database, schema, user credentials, and connection settings<br>
**Data Transfer**: ADF can directly load data into Snowflake tables by specifying the destination as Snowflake in the Copy Activity.
Alternatively, ADF can load data to an intermediate staging area, like Azure Blob Storage, and then Snowflake can load data from Blob Storage using its COPY INTO command.
File Format: Data may be formatted as CSV, Parquet, or other columnar formats for efficiency in transfer and storage<br>
**Scheduling and Monitoring**:
ADF pipelines can be scheduled to run at specific intervals, such as daily or hourly, to ensure the Snowflake data is updated.
**Pipeline Monitoring** in ADF provides real-time insights into pipeline performance, errors, and execution history, making it easier to manage data flows.

### 3. Transforming Data Using dbt (Data Build Tool)
**Goal**: Use dbt to transform the raw data in Snowflake into clean, modeled, and business-ready datasets<br>
**Setting Up dbt**:
-  dbt connects to Snowflake using credentials stored in a profiles.yml file. Connection details include account name, warehouse, database, and authentication information (e.g., username and password or key-based).dbt requires the data to be already available in Snowflake, making it ideal for transforming data that has been pre-loaded via ADF<br>
-  **Transformation Process**:`Models: dbt organizes transformations into models, which are SQL files containing transformation logic. Models can represent tables, views, or other structures that organize and clean data for analysis<br>
-  **testing and Documentation**:
dbt supports automated tests (e.g., checking for null values, uniqueness, foreign key integrity) to ensure data quality.
dbt also generates documentation that includes descriptions of tables, columns, and relationships, making it easier for data consumers to understand the data's structure and quality.








