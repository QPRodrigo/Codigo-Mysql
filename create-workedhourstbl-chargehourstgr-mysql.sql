CREATE DATABASE if NOT EXISTS companydb;

USE companydb;

CREATE TABLE worked_hours    
(
  essn CHAR(9)           NOT NULL,
  pno  INT               NOT NULL,
  wdate DATE			    NOT NULL, 
  hours DECIMAL(5,1)     NOT NULL DEFAULT 0,
  charged BOOLEAN        NOT NULL DEFAULT 0,
  CONSTRAINT workedHoursPK PRIMARY KEY (essn, pno, wdate),
  CONSTRAINT workedHoursEmpFK FOREIGN KEY (essn) REFERENCES employee(ssn),
  CONSTRAINT workedHoursProjFK FOREIGN KEY (pno) REFERENCES project(pnumber)
) ENGINE=InnoDB;

DELIMITER //
CREATE TRIGGER chargeHours BEFORE INSERT ON worked_hours
   FOR EACH ROW
   BEGIN
       IF NEW.charged = 0 THEN
           UPDATE works_on SET hours = hours + NEW.hours WHERE essn = NEW.essn AND pno = NEW.pno;
           SET NEW.charged = 1;
       END IF;
   END; //
DELIMITER ;
