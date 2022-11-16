FROM confluentinc/cp-kafka-connect-base:6.2.7
RUN   confluent-hub install --no-prompt debezium/debezium-connector-postgresql:1.9.7 \
   && confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.9.7\
   && confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:1.9.7\
   && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.6.0\
   && confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:14.0.2\
   && confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.2.3