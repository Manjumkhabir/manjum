-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-09-15 22:46:11 AEST
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c

--student id:28887069
--student name:Manjum Khabir
--capture run of script in file rentual_system_schema_output.txt
set echo on  
SPOOL  rentual_system_schema_output.txt

DROP TABLE damage CASCADE CONSTRAINTS;

DROP TABLE owner CASCADE CONSTRAINTS;

DROP TABLE payment CASCADE CONSTRAINTS;

DROP TABLE property CASCADE CONSTRAINTS;

DROP TABLE rent CASCADE CONSTRAINTS;

DROP TABLE tenant CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE damage (
    dam_date  DATE NOT NULL,
    dam_time  NUMBER(4) NOT NULL,
    dam_type  VARCHAR2(50) NOT NULL,
    dam_cost  NUMBER(7, 1) NOT NULL,
    pay_no    NUMBER(7),
    rent_no   NUMBER(7) NOT NULL
);

COMMENT ON COLUMN damage.dam_date IS
    'damge date';

COMMENT ON COLUMN damage.dam_time IS
    'damage time';

COMMENT ON COLUMN damage.dam_type IS
    'damage type';

COMMENT ON COLUMN damage.dam_cost IS
    'cost of damage ';

COMMENT ON COLUMN damage.pay_no IS
    'payment number';

COMMENT ON COLUMN damage.rent_no IS
    'serrogate key of rent ';

CREATE UNIQUE INDEX damage__idx ON
    damage (
        pay_no
    ASC );

ALTER TABLE damage ADD CONSTRAINT damage_pk PRIMARY KEY ( dam_date );

CREATE TABLE owner (
    owner_no    NUMBER(7) NOT NULL,
    owner_name  VARCHAR2(50)
);

COMMENT ON COLUMN owner.owner_no IS
    'owner number';

COMMENT ON COLUMN owner.owner_name IS
    'owner name ';

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_no );

CREATE TABLE payment (
    pay_no      NUMBER(7) NOT NULL,
    pay_date    DATE NOT NULL,
    pay_type    VARCHAR2(50) NOT NULL,
    pay_amount  NUMBER(7) NOT NULL,
    dam_date    DATE,
    rent_no     NUMBER(7) NOT NULL
);

COMMENT ON COLUMN payment.pay_no IS
    'payment number';

COMMENT ON COLUMN payment.pay_date IS
    'payment date';

COMMENT ON COLUMN payment.pay_type IS
    'paymeny type';

COMMENT ON COLUMN payment.pay_amount IS
    'payment amount ';

COMMENT ON COLUMN payment.dam_date IS
    'damge date';

COMMENT ON COLUMN payment.rent_no IS
    'serrogate key of rent ';

CREATE UNIQUE INDEX payment__idx ON
    payment (
        dam_date
    ASC );

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( pay_no );

CREATE TABLE property (
    prop_no       NUMBER(7) NOT NULL,
    prop_address  VARCHAR2(50) NOT NULL,
    prop_value    NUMBER NOT NULL,
    owner_no      NUMBER(7) NOT NULL
);

COMMENT ON COLUMN property.prop_no IS
    'property number';

COMMENT ON COLUMN property.prop_address IS
    'property address';

COMMENT ON COLUMN property.prop_value IS
    'property vlaue ';

COMMENT ON COLUMN property.owner_no IS
    'owner number';

ALTER TABLE property ADD CONSTRAINT property_pk PRIMARY KEY ( prop_no );

CREATE TABLE rent (
    rent_no               NUMBER(7) NOT NULL,
    prop_no               NUMBER(7) NOT NULL,
    rent_lease_startdate  DATE NOT NULL,
    rent_bond             NUMBER(7) NOT NULL,
    rent_lease_period     VARCHAR2(50) NOT NULL,
    tenant_no             NUMBER(7) NOT NULL
);

COMMENT ON COLUMN rent.rent_no IS
    'serrogate key of rent ';

COMMENT ON COLUMN rent.prop_no IS
    'property number';

COMMENT ON COLUMN rent.rent_lease_startdate IS
    'rent lease starting date';

COMMENT ON COLUMN rent.rent_bond IS
    'rent bond';

COMMENT ON COLUMN rent.rent_lease_period IS
    'rent lease period ';

COMMENT ON COLUMN rent.tenant_no IS
    'tenant number';

ALTER TABLE rent ADD CONSTRAINT rent_pk PRIMARY KEY ( rent_no );

ALTER TABLE rent
    ADD CONSTRAINT key_2 UNIQUE ( rent_lease_startdate,
                                  rent_bond,
                                  prop_no,
                                  rent_lease_period,
                                  tenant_no );

CREATE TABLE tenant (
    tenant_no       NUMBER(7) NOT NULL,
    tenant_fname    VARCHAR2(50) NOT NULL,
    tenant_gname    VARCHAR2(50) NOT NULL,
    tenant_address  VARCHAR2(50) NOT NULL,
    tenant_phone    NUMBER(10, 7) NOT NULL
);

COMMENT ON COLUMN tenant.tenant_no IS
    'tenant number';

COMMENT ON COLUMN tenant.tenant_fname IS
    'tenant firstname';

COMMENT ON COLUMN tenant.tenant_address IS
    'tenant address';

COMMENT ON COLUMN tenant.tenant_phone IS
    'tenant phone ';

ALTER TABLE tenant ADD CONSTRAINT tenant_pk PRIMARY KEY ( tenant_no );

ALTER TABLE payment
    ADD CONSTRAINT daamge_pay FOREIGN KEY ( dam_date )
        REFERENCES damage ( dam_date );

ALTER TABLE damage
    ADD CONSTRAINT daamge_payv1 FOREIGN KEY ( pay_no )
        REFERENCES payment ( pay_no );

ALTER TABLE property
    ADD CONSTRAINT owners_property FOREIGN KEY ( owner_no )
        REFERENCES owner ( owner_no );

ALTER TABLE rent
    ADD CONSTRAINT property_rents FOREIGN KEY ( prop_no )
        REFERENCES property ( prop_no );

ALTER TABLE damage
    ADD CONSTRAINT rent_daamge FOREIGN KEY ( rent_no )
        REFERENCES rent ( rent_no );

ALTER TABLE payment
    ADD CONSTRAINT rent_payment FOREIGN KEY ( rent_no )
        REFERENCES rent ( rent_no );

ALTER TABLE rent
    ADD CONSTRAINT tent_prop FOREIGN KEY ( tenant_no )
        REFERENCES tenant ( tenant_no );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             2
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
SPOOL OFF
set echo off 