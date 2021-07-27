--liquibase formatted sql

--changeset shamil:001

--drop table if exists pilots cascade;
--drop table if exists crews cascade;
--drop table if exists flights cascade;
--drop schema if exists air_base;

CREATE SCHEMA IF NOT EXISTS air_base;

create table if not exists air_base.crews(
    crew_id         BIGSERIAL primary key,
    crews_number    BIGINT NOT NULL
);
create table if not exists air_base.pilots(
    pilot_id        BIGSERIAL primary key,
    first_name      VARCHAR,
    second_name     VARCHAR,
    crew_id         BIGINT NOT NULL references air_base.crews (crew_id)
);
create table if not exists air_base.flights(
    flight_id       BIGSERIAL primary key,
    flight_start    TIMESTAMP,
    flight_ending   TIMESTAMP,
    flight_number   BIGINT,
    crew_id         BIGINT NOT NULL references air_base.crews (crew_id)
);