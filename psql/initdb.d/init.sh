set -e
psql -U admin compost << EOSQL
CREATE TABLE iot_data(
    sensor_id       BIGINT,
    timestamp       TIMESTAMP WITH TIME ZONE,
    rssi            REAL,
    weight          REAL,
    temperature     REAL,
    amount_of_water REAL,
    odor_intensity  SMALLINT
);

INSERT INTO iot_data
    (sensor_id,timestamp,rssi,weight,temperature,amount_of_water,odor_intensity)
VALUES 
    (0, '2022-10-16 00:00:00+02', 100.0, 10000.0, 20.0, 1000, 3);

INSERT INTO iot_data
    (sensor_id,timestamp,rssi,weight,temperature,amount_of_water,odor_intensity)
VALUES 
    (0, '2022-10-16 03:30:33+02', 99.0, 9990.0, 30.0, 800, 3);

INSERT INTO iot_data
    (sensor_id,timestamp,rssi,weight,temperature,amount_of_water,odor_intensity)
VALUES 
    (0, '2022-10-17 10:04:00+02', 100.0, 9997.0, 22.0, 1000, 5);

INSERT INTO iot_data
VALUES 
    (0, '2022-10-17 20:00:00+02', 100.0, 10000.0, 20.0, 1000, 3);
EOSQL
