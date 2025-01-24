-- Yanick Egli, Gaëtan Allemann (copied mostly from AngProj sql files)
\echo \conninfo
\echo
\echo -n 'current client encoding: '\encoding
\echo

SET client_min_messages = ERROR;
\set user root
\set password '\'root\''
\set database dnd
\set promptvar ''

\prompt 'DROP ROLE [':user'] and DROP DATABASE [':database'] if existing (\\q or Ctrl-C to abort)?' promptvar
:promptvar

DROP DATABASE if exists :database (FORCE);
DROP ROLE if exists :user;

\echo -------------------------------------
\echo password for user :user = :password
\echo -------------------------------------
\echo

\prompt 'CREATE ROLE [':user'] and DATABASE [':database'] (\\q or Ctrl-C to abort)?' promptvar
:promptvar

CREATE ROLE :user WITH LOGIN PASSWORD :password;
CREATE DATABASE :database WITH OWNER=:user ENCODING='UTF8';

-- specify encoding to match your files encoding, usually UTF8
-- valid values are: 'UTF8', 'LATIN1', 'WIN1252'
\encoding 'UTF8'

-- connect to DB as superuser
--\c -reuse-previous=on :database postgres

-- connect to DB as owner
\c -reuse-previous=on :database :user

-- create schema
\ir dnd_db.sql



\echo
\prompt 'Execute Queries (\\q or Ctrl-C to abort)?' promptvar
:promptvar

\encoding 'auto'

\set ECHO queries
-- query the database
\ir dnd_queries.sql

\unset ECHO

