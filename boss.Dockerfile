# Use your prebuilt base image
FROM p5-base:latest

# Expose key ports for Spark master, NameNode, and Jupyter
EXPOSE 7077 8080

# Set Spark and Hadoop environment variable
ENV SPARK_HOME=/spark-3.5.7-bin-hadoop3
ENV HADOOP_HOME=/hadoop-3.4.1
ENV PATH="${PATH}:${SPARK_HOME}/bin:${HADOOP_HOME}/bin"

# Spark master configs
ENV SPARK_MASTER_HOST=localhost
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8080

# HDFS configs
ENV HDFS_NAMENODE_PORT=9000
ENV HDFS_WEBUI_PORT=9870

WORKDIR /workspace
COPY . /workspace

# Optional: You can copy a startup script here if you want automatic daemon start
# COPY start-boss.sh /usr/local/bin/start-boss.sh
# CMD ["bash", "/usr/local/bin/start-boss.sh"]

CMD ["bash", "-lc", "$SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master --host boss --port 7077 --webui-port 8080"]

