-- unstructured/ai-summarize-articles/setup.sql
-- Creates a table with Wikipedia-style article text for AI_SUMMARIZE demo
-- Text is inserted inline — no external download needed

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE wiki_articles (
    article_id  NUMBER AUTOINCREMENT PRIMARY KEY,
    title       VARCHAR(200),
    category    VARCHAR(50),
    word_count  NUMBER,
    body        VARCHAR(16000)
);

INSERT INTO wiki_articles (title, category, word_count, body) VALUES
('Snowflake (company)',
 'Technology',
 420,
 'Snowflake Inc. is a cloud computing-based data storage and analytics company. It was founded in 2012 and is headquartered in Bozeman, Montana. The company offers a cloud-based data warehousing platform that allows businesses to store, process, and analyze large amounts of data. Snowflake operates on Amazon Web Services, Microsoft Azure, and Google Cloud Platform. Its architecture separates storage and compute, allowing customers to scale each independently. The platform supports SQL queries, and also offers support for semi-structured data like JSON, Avro, and Parquet. Snowflake went public on the New York Stock Exchange in September 2020 in what was the largest software IPO in history at the time, raising approximately $3.4 billion. The company serves customers across industries including financial services, healthcare, retail, and media. Key features include data sharing capabilities that allow organizations to share live data without copying it, a data marketplace where third-party datasets can be accessed, and support for machine learning workloads through Snowpark. The Snowflake Data Cloud concept refers to the ecosystem of customers, partners, and datasets connected through the platform. The company has expanded its capabilities to include Cortex AI, which provides built-in machine learning and large language model functions accessible through standard SQL. Snowflake competes with companies such as Databricks, Google BigQuery, Amazon Redshift, and Microsoft Synapse Analytics.'),

('Large language model',
 'Artificial Intelligence',
 380,
 'A large language model (LLM) is a type of artificial intelligence algorithm that uses deep learning techniques and massively large data sets to understand, summarize, generate, and predict new content. The term "large" refers to the number of parameters the model contains, often in the billions or trillions. LLMs are transformer-based neural networks trained on vast corpora of text data scraped from the internet, books, code repositories, and other sources. Notable examples include OpenAI''s GPT series, Anthropic''s Claude, Google''s Gemini, and Meta''s LLaMA. These models can perform a wide variety of natural language tasks including question answering, summarization, translation, classification, and code generation. They learn statistical patterns from training data and generate responses by predicting the most likely next token given a context window. Prompt engineering is the practice of crafting input text to guide LLM outputs toward desired results. Retrieval-augmented generation (RAG) combines LLMs with external knowledge bases to ground responses in specific, up-to-date information. LLMs have shown emergent capabilities — abilities not explicitly trained for but that appear at scale. They are widely used in chatbots, coding assistants, document processing, and search applications. Concerns about LLMs include hallucination (generating plausible but incorrect information), bias inherited from training data, environmental impact of training, and potential for misuse in generating disinformation.'),

('Data warehouse',
 'Technology',
 350,
 'A data warehouse is a centralized repository that stores large amounts of structured data from multiple sources, optimized for analytical queries and business intelligence reporting. Unlike transactional databases optimized for insert/update/delete operations, data warehouses are designed for read-heavy workloads involving complex aggregations across historical data. The concept was formalized by Bill Inmon in the 1990s, who defined it as a subject-oriented, integrated, non-volatile, and time-variant collection of data. Data is typically loaded through an ETL (extract, transform, load) process from operational systems. Modern data warehouses use columnar storage, which enables efficient compression and fast scans of specific columns without reading entire rows. Partitioning and clustering further accelerate queries on large datasets. Major data warehouse platforms include Snowflake, Google BigQuery, Amazon Redshift, Microsoft Azure Synapse, and Databricks. The "lakehouse" architecture is an evolution that combines the structured querying capabilities of warehouses with the flexible storage of data lakes. Data warehouses support OLAP (online analytical processing) workloads and are the foundation for business intelligence tools like Tableau, Power BI, and Looker.'),

('Vector database',
 'Artificial Intelligence',
 290,
 'A vector database is a type of database that stores data as high-dimensional numerical vectors and enables similarity search — finding the most similar vectors to a given query vector. It is foundational to modern AI applications including semantic search, recommendation systems, and retrieval-augmented generation (RAG). Traditional relational databases store structured rows and columns and support exact-match lookups. Vector databases instead support approximate nearest neighbor (ANN) search, returning vectors that are close to a query in embedding space. Embeddings are generated by machine learning models and capture semantic meaning — for example, the embedding for "car" is numerically close to "automobile". Popular vector databases include Pinecone, Weaviate, Qdrant, Chroma, and Milvus. Many general-purpose databases have added native vector support, including PostgreSQL (via pgvector), MongoDB, Redis, and Snowflake (via VECTOR data type). Key algorithms for ANN search include HNSW (Hierarchical Navigable Small World), IVF (Inverted File Index), and FAISS. Vector databases are a critical component of RAG pipelines where a user query is embedded, similar documents are retrieved from the vector store, and the retrieved context is passed to an LLM to generate a grounded response.'),

('Machine learning pipeline',
 'Artificial Intelligence',
 310,
 'A machine learning pipeline is a sequence of data processing and model training steps that transforms raw data into a deployed predictive model. Pipelines ensure reproducibility, enable automation, and standardize the workflow from data collection through model serving. A typical ML pipeline consists of several stages: data ingestion, data validation, feature engineering, model training, model evaluation, and model deployment. Data ingestion collects raw data from source systems such as databases, APIs, or files. Feature engineering transforms raw data into numeric representations that algorithms can process. Model training fits a mathematical function to the training data. Evaluation measures performance on held-out test data using metrics such as accuracy, precision, recall, F1 score, and AUC-ROC. Model deployment makes the trained model available for inference, typically via an API endpoint or embedded into a batch scoring job. MLOps (Machine Learning Operations) extends DevOps principles to ML, adding versioning for data, models, and experiments, continuous training pipelines, and monitoring for data drift and model degradation. Popular frameworks for building ML pipelines include Apache Airflow, Kubeflow Pipelines, MLflow, and cloud-native services such as Snowflake ML, Amazon SageMaker Pipelines, and Vertex AI Pipelines.');

SELECT title, category, word_count FROM wiki_articles ORDER BY article_id;
