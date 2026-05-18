# Spark Competitive Programming Analytics Platform – Distributed Data & ML Project

A distributed Spark-based analytics platform for analyzing competitive programming problems and solutions using Hive, Spark SQL, machine learning, and generative AI.

---

## Project Overview

This project uses:
- Apache Spark
- Hive
- HDFS
- PySpark ML
- Gemini API
- Dockerized distributed infrastructure

to analyze large-scale competitive programming datasets from DeepMind CodeContests.

The platform supports:
- Distributed querying
- Spark optimization techniques
- Natural-language-to-SQL generation
- Machine learning prediction pipelines
- Performance analysis with caching and bucketing

---

## Features

- Loaded JSONL datasets into Spark DataFrames
- Persisted datasets into Hive tables
- Used all three Spark programming models:
  - RDD API
  - DataFrame API
  - Spark SQL
- Optimized queries using:
  - Bucketing
  - Caching
- Built a natural language SQL interface using Gemini API
- Trained decision tree regression models with PySpark ML
- Evaluated overfitting using varying tree depths
- Created distributed Spark cluster using Docker

---

## Technologies Used

- Apache Spark
- PySpark
- Hive
- HDFS
- Docker
- Docker Compose
- Gemini API
- PySpark MLlib
- Pandas
- Matplotlib

---

# Distributed Cluster Architecture

The deployment includes:
- Spark Boss node
- Spark Worker nodes
- HDFS NameNode
- HDFS DataNode
- Jupyter Notebook container

All services communicate through Docker Compose networking.

---

# Dataset Processing

Datasets used:
- `problems.jsonl`
- `solutions.jsonl`

Additional CSV metadata:
- `languages`
- `problem_tests`
- `sources`
- `tags`

The data was:
- Uploaded to HDFS
- Loaded into Hive tables
- Queried using Spark SQL

---

# Spark Programming Models

Implemented analytics using:
- RDD transformations/actions
- DataFrame operations
- Spark SQL queries

### Example Tasks
- Difficulty filtering
- Source joins
- Solution aggregation
- Competitive programming analytics

---

# Hive Tables & Views

Created permanent Hive tables:
- `problems`
- `solutions`

Created temporary Spark views:
- `languages`
- `problem_tests`
- `sources`
- `tags`

---

# Query Optimization

## Bucketing

Bucketed `solutions` table by:
- `language`
- 4 buckets

Used to analyze:
- Shuffle reduction
- Exchange optimization
- GROUP BY performance

---

## Caching Analysis

Benchmarked:
- Cached vs uncached query execution
- Average computation performance

Measured:
- Execution times
- Spark cache reuse benefits

---

# Natural Language SQL Interface

Implemented `human_query()` using:
- Gemini 2.5 Flash API
- Programmatic prompt construction
- Automatic Spark SQL generation

### Features
- Injected schema context into prompts
- Generated executable SQL queries
- Executed generated queries automatically
- Returned deterministic numeric answers

### Example Questions
- "How many JAVA solutions are there?"
- "What is the maximum memory limit in bytes?"

---

# Machine Learning Pipeline

Built a Spark ML pipeline using:
- `VectorAssembler`
- `DecisionTreeRegressor`

### Features Used
- `difficulty`
- `time_limit`
- `memory_limit_bytes`

### Goal
Predict missing `cf_rating` values for Codeforces problems.

---

# Model Evaluation

Trained models with varying tree depths:
- 1
- 2
- 3
- 5
- 7
- 10
- 15
- 20
- 25
- 30

Measured:
- Training R²
- Testing R²

Generated:
- Performance plots
- JSON-formatted experiment results

---

# Project Structure

```text id="67i9xz"
.
├── boss.Dockerfile
├── worker.Dockerfile
├── p5-base.Dockerfile
├── notebook.Dockerfile
├── namenode.Dockerfile
├── datanode.Dockerfile
├── docker-compose.yml
├── build.sh
├── get_data.py
├── ai.md
│
└── nb/
    ├── p5.ipynb
    └── data/
