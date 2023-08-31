UPDATE PATIENT
SET NAME = 'K', ADDRESS = 'RAJ'
WHERE NAME = 'A' AND ADDRESS = 'DHK';
ALTER TABLE APPOINTMENT_INFO DROP CONSTRAINT FK_APPOINTMENT_DOCTOR;
UPDATE APPOINTMENT_INFO
SET APPOINTMENT_INFO.D_NAME= 'MS. Y' WHERE APPOINTMENT_INFO.D_NAME= 'MR. Y';
UPDATE DOCTOR
SET DOCTOR.NAME = 'MS. Y' WHERE DOCTOR.NAME = 'MR. Y';
ALTER TABLE APPOINTMENT_INFO DROP CONSTRAINT FK_APPOINTMENT_PATIENT;
DELETE FROM APPOINTMENT_INFO WHERE P_NO = 'P-101';
DELETE FROM PATIENT WHERE PATIENT_NO = 'P-101';
ALTER TABLE APPOINTMENT_INFO ADD CONSTRAINT FK_APPOINTMENT_PATIENT FOREIGN KEY (P_NO) REFERENCES PATIENT(PATIENT_NO);
ALTER TABLE APPOINTMENT_INFO DROP CONSTRAINT FK_APPOINTMENT_PATIENT;
DELETE FROM APPOINTMENT_INFO;
DELETE FROM PATIENT;
ALTER TABLE APPOINTMENT_INFO ADD CONSTRAINT FK_APPOINTMENT_PATIENT FOREIGN KEY (P_NO) REFERENCES PATIENT(PATIENT_NO);
