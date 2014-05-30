--------------------------------------------------------
--------------------------------------------------------
--  Manualy retrofited to first version from schema_2.sql
--------------------------------------------------------
DROP TABLE "TST_PRACVZTAH";
DROP TABLE "TST_OSOBA";
DROP TABLE "TST_TYPPRACVZTAH";
DROP TABLE "TST_PRACKAT";

--------------------------------------------------------
--  DDL for Table TST_OSOBA
--------------------------------------------------------

  CREATE TABLE "TST_OSOBA" 
   (	"CODE" VARCHAR2(20), 
	"PRACKAT_CODE" VARCHAR2(20), 
	"NAME" VARCHAR2(20)
   )
/
--------------------------------------------------------
--  DDL for Table TST_PRACKAT
--------------------------------------------------------

  CREATE TABLE "TST_PRACKAT" 
   (	"CODE" VARCHAR2(20), 
	"NAME" VARCHAR2(20)
   )
/
--------------------------------------------------------
--  DDL for Table TST_PRACVZTAH
--------------------------------------------------------

  CREATE TABLE "TST_PRACVZTAH" 
   (	"OSOBA_TOP_CODE" VARCHAR2(20), 
	"OSOBA_SUB_CODE" VARCHAR2(20), 
	"VALID_FROM" DATE, 
	"VALID_TO" DATE,
  "TYPPRACVZTAH_CODE" VARCHAR(20)
   )
/
--------------------------------------------------------
--  DDL for Table TST_TYPPRACVZTAH
--------------------------------------------------------

  CREATE TABLE "TST_TYPPRACVZTAH" 
   (	"ID" VARCHAR2(20), 
	"PRACKAT_TOP_CODE" VARCHAR2(20), 
	"PRACKAT_SUB_CODE" VARCHAR2(20)
   )
/

REM INSERTING into TST_OSOBA
SET DEFINE OFF;
Insert into TST_OSOBA (CODE,PRACKAT_CODE,NAME) values ('JOZKO','PRAC','Jozko');
Insert into TST_OSOBA (CODE,PRACKAT_CODE,NAME) values ('FERKO','PRAC','Ferko');
Insert into TST_OSOBA (CODE,PRACKAT_CODE,NAME) values ('MEG','CEO','Meg Whitman');
Insert into TST_OSOBA (CODE,PRACKAT_CODE,NAME) values ('IGOR','MAN','Igor Votava');
Insert into TST_OSOBA (CODE,PRACKAT_CODE,NAME) values ('GERALD','MAN','Gerald Maerzendorfer');
REM INSERTING into TST_PRACKAT
SET DEFINE OFF;
Insert into TST_PRACKAT (CODE,NAME) values ('PRAC','Pracovnik');
Insert into TST_PRACKAT (CODE,NAME) values ('MAN','Manazer');
Insert into TST_PRACKAT (CODE,NAME) values ('CEO','Riaditel');
REM INSERTING into TST_PRACVZTAH
SET DEFINE OFF;
Insert into TST_PRACVZTAH (OSOBA_TOP_CODE,OSOBA_SUB_CODE,VALID_FROM,VALID_TO,TYPPRACVZTAH_CODE) values ('IGOR','FERKO',to_date('30.05.14 10:02:33','DD.MM.RR HH24:MI:SS'),null,'1');
Insert into TST_PRACVZTAH (OSOBA_TOP_CODE,OSOBA_SUB_CODE,VALID_FROM,VALID_TO,TYPPRACVZTAH_CODE) values ('IGOR','JOZKO',to_date('30.05.14 10:19:45','DD.MM.RR HH24:MI:SS'),null,'1');
REM INSERTING into TST_TYPPRACVZTAH
SET DEFINE OFF;
Insert into TST_TYPPRACVZTAH (ID,PRACKAT_TOP_CODE,PRACKAT_SUB_CODE) values (1,'CEO','MAN');
Insert into TST_TYPPRACVZTAH (ID,PRACKAT_TOP_CODE,PRACKAT_SUB_CODE) values (2,'MAN','PRAC');

--------------------------------------------------------
--  Constraints for Table TST_OSOBA
--------------------------------------------------------

  ALTER TABLE "TST_OSOBA" ADD CONSTRAINT "TST_OSOBA_PK" PRIMARY KEY ("CODE") ENABLE;
  ALTER TABLE "TST_OSOBA" MODIFY ("CODE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table TST_PRACKAT
--------------------------------------------------------

  ALTER TABLE "TST_PRACKAT" ADD CONSTRAINT "TST_PRACKAT_PK" PRIMARY KEY ("CODE") ENABLE;
  ALTER TABLE "TST_PRACKAT" MODIFY ("CODE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table TST_PRACVZTAH
--------------------------------------------------------

  ALTER TABLE "TST_PRACVZTAH" MODIFY ("OSOBA_SUB_CODE" NOT NULL ENABLE);
  ALTER TABLE "TST_PRACVZTAH" MODIFY ("OSOBA_TOP_CODE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table TST_TYPPRACVZTAH
--------------------------------------------------------

  ALTER TABLE "TST_TYPPRACVZTAH" MODIFY ("PRACKAT_SUB_CODE" NOT NULL ENABLE);
  ALTER TABLE "TST_TYPPRACVZTAH" MODIFY ("PRACKAT_TOP_CODE" NOT NULL ENABLE);
  ALTER TABLE "TST_TYPPRACVZTAH" ADD CONSTRAINT "TST_TYPPRACVZTAH_PK" PRIMARY KEY ("ID") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table TST_OSOBA
--------------------------------------------------------

  ALTER TABLE "TST_OSOBA" ADD CONSTRAINT "TST_OSOBA_TST_PRACKAT_FK1" FOREIGN KEY ("PRACKAT_CODE")
	  REFERENCES "TST_PRACKAT" ("CODE") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table TST_PRACVZTAH
--------------------------------------------------------

  ALTER TABLE "TST_PRACVZTAH" ADD CONSTRAINT "TST_PRACVZTAH_TST_OSOBA_FK3" FOREIGN KEY ("OSOBA_TOP_CODE")
	  REFERENCES "TST_OSOBA" ("CODE") ENABLE;
  ALTER TABLE "TST_PRACVZTAH" ADD CONSTRAINT "TST_PRACVZTAH_TST_OSOBA_FK4" FOREIGN KEY ("OSOBA_SUB_CODE")
	  REFERENCES "TST_OSOBA" ("CODE") ENABLE;
  ALTER TABLE "TST_PRACVZTAH" ADD CONSTRAINT "TST_PRACVZTAH_TST_TYPPRAC_FK1" FOREIGN KEY ("TYPPRACVZTAH_CODE")
	  REFERENCES "TST_TYPPRACVZTAH" ("ID") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table TST_TYPPRACVZTAH
--------------------------------------------------------

  ALTER TABLE "TST_TYPPRACVZTAH" ADD CONSTRAINT "TST_TYPPRACVZTAH_TST_PRAC_FK1" FOREIGN KEY ("PRACKAT_TOP_CODE")
	  REFERENCES "TST_PRACKAT" ("CODE") ENABLE;
  ALTER TABLE "TST_TYPPRACVZTAH" ADD CONSTRAINT "TST_TYPPRACVZTAH_TST_PRAC_FK2" FOREIGN KEY ("PRACKAT_SUB_CODE")
	  REFERENCES "TST_PRACKAT" ("CODE") ENABLE;
/
