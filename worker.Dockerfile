FROM p5-base:latest

# Expose worker-specific ports
EXPOSE 8081 

# Set Spark and Hadoop environment variables
ENV SPARK_HOME=/spark-3.5.7-bin-hadoop3
ENV HADOOP_HOME=/hadoop-3.4.1
ENV PATH="${PATH}:${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${HADOOP_HOME}/bin"
CMD ["bash", "-lc", "start-worker.sh spark://boss:7077"]


# Spark worker configs
ENV SPARK_WORKER_CORES=2
ENV SPARK_WORKER_MEMORY=2G
ENV SPARK_WORKER_PORT=7078
ENV SPARK_WORKER_WEBUI_PORT=8081

WORKDIR /workspace
COPY . /workspace

# Optional startup script
# COPY start-worker.sh /usr/local/bin/start-worker.sh
# CMD ["bash", "/usr/local/bin/start-worker.sh"]

CMD ["bash", "-lc", "$SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker spark://boss:7077 --webui-port 8081"]

