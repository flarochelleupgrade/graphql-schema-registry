CREATE TABLE IF NOT EXISTS clients (
										 id serial,
										 name varchar(50) NOT NULL DEFAULT '',
										 version varchar(50) DEFAULT '',
										 calls bigint DEFAULT NULL,
										 updated_time timestamp DEFAULT CURRENT_TIMESTAMP,
										 added_time timestamp  NOT NULL  DEFAULT CURRENT_TIMESTAMP,
										 PRIMARY KEY (id),
  										 CONSTRAINT name_version UNIQUE(name,version)
);

CREATE TABLE IF NOT EXISTS clients_persisted_queries_rel (
															   version_id int NOT NULL,
															   pq_key varchar(100) NOT NULL DEFAULT '',
															   CONSTRAINT version_id_2 UNIQUE (version_id,pq_key)
);
CREATE INDEX IF NOT EXISTS version_id ON clients_persisted_queries_rel(version_id);
CREATE INDEX IF NOT EXISTS pq_key ON clients_persisted_queries_rel(pq_key);


CREATE TABLE IF NOT EXISTS schema_hit
		(
			client_id    int                                                           DEFAULT NULL,
			entity       varchar(150)  NOT NULL DEFAULT '',
			property     varchar(150)  NOT NULL DEFAULT '',
			day          date                                                          NOT NULL,
			hits         bigint                                                        DEFAULT NULL,
			updated_time BIGINT NULL DEFAULT NULL,
			CONSTRAINT client_id UNIQUE(client_id,entity,property,day)
		) ;
CREATE INDEX IF NOT EXISTS entity ON schema_hit(entity,property);
