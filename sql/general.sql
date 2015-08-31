
-- CRIANDO SEQUENCE DE PAISES 
CREATE SEQUENCE country_sequence INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 999 CACHE 1 NO CYCLE;
COMMENT ON SEQUENCE country_sequence  IS 'Sequencia dos Países';

-- CRIANDO TABELAS DE PAISES
CREATE TABLE country(
	code VARCHAR(3) NOT NULL PRIMARY KEY UNIQUE DEFAULT lpad(nextval('country_sequence')::VARCHAR(3),3,'0'),
	name VARCHAR(255) NOT NULL UNIQUE,
	codeI18n VARCHAR(3) NOT NULL UNIQUE,
	acronym VARCHAR(3) NOT NULL, 
	trash BOOLEAN NOT NULL DEFAULT 'FALSE',
	CHECK( code >= '0')
);
COMMENT ON TABLE country  IS 'Tabela dos países';

-- CRIANDO SEQUENCE DE ESTADOS
CREATE SEQUENCE state_sequence INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 99 CACHE 1 NO CYCLE;
COMMENT ON SEQUENCE state_sequence  IS 'Sequencia dos Estados';

-- CRIANDO TABELA DE ESTADOS
CREATE TABLE state (
	code VARCHAR(2) NOT NULL PRIMARY KEY UNIQUE DEFAULT lpad(nextval('state_sequence')::VARCHAR(2),2,'0'),
	name VARCHAR(255) NOT NULL UNIQUE,
	acronym VARCHAR(2) NOT NULL, 
	country VARCHAR (3) NOT NULL,
	trash BOOLEAN NOT NULL DEFAULT 'FALSE',	
	CONSTRAINT state_x_country FOREIGN KEY (country) REFERENCES country (code),	
	CHECK( code >= '0')
);
COMMENT ON TABLE state  IS 'Tabela dos Estados';

-- CRIANDO SEQUENCE DE CIDADES
CREATE SEQUENCE city_sequence INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 99999999 CACHE 1 NO CYCLE;
COMMENT ON SEQUENCE city_sequence  IS 'Sequencia das Cidades';

-- CRIANDO TABELA DE CIDADES
CREATE TABLE city (
	code VARCHAR(8) NOT NULL PRIMARY KEY UNIQUE DEFAULT lpad(nextval('city_sequence')::VARCHAR(8),8,'0'),
	name VARCHAR(255) NOT NULL,
	ibge NUMERIC(8) NOT NULL,
	state VARCHAR(2) NOT NULL,
	trash BOOLEAN NOT NULL DEFAULT 'FALSE',
	CHECK ( code >= '0'),
	CONSTRAINT city_x_state FOREIGN KEY (state) REFERENCES state (code)	
);
COMMENT ON TABLE city  IS 'Tabela dos Cidades';

