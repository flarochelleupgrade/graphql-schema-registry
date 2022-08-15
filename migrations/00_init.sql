CREATE TABLE IF NOT EXISTS persisted_queries
(
    key          varchar(100) NOT NULL,
    query        text         NOT NULL,
    is_active    smallint          NOT NULL DEFAULT '1',
    updated_time timestamp              DEFAULT NULL,
    added_time   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (key)
) ;

CREATE TABLE IF NOT EXISTS services
(
    id           bigserial,
    name         varchar(255) NOT NULL DEFAULT '' UNIQUE,
    is_active    smallint          NOT NULL DEFAULT '1',
    updated_time timestamp              DEFAULT NULL,
    added_time   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ;

CREATE TABLE IF NOT EXISTS schema
(
    id           bigserial,
    service_id   bigint          DEFAULT NULL,
    is_active    smallint        DEFAULT '1',
    type_defs    text ,
    added_time   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT schema_ibfk_1 FOREIGN KEY (service_id) REFERENCES services (id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE IF NOT EXISTS container_schema
(
    id         bigserial,
    service_id bigint NOT NULL,
    schema_id  bigint NOT NULL,
    version    varchar(100) NOT NULL DEFAULT '',
    added_time timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT container_schema_ibfk_1 FOREIGN KEY (service_id) REFERENCES services (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT container_schema_ibfk_2 FOREIGN KEY (schema_id) REFERENCES schema (id) ON DELETE CASCADE ON UPDATE CASCADE
);
