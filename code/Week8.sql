DECLARE Count INT;
BEGIN
	CALL SelectAv

CREATE TABLE 남녀학생총수
	(성별 CHAR(1) NOT NULL DEFAULT 0.
	인원수 INT NOT NULL DEFAULT 0.
	PRIMARY KEY(성별));
INSERT INTO 남녀학생총수 SELECT '남', COUNT(*) FROM 학생 WHERE 성별 = '남';
INSERT INTO 남녀학생총수 SELECT '여', COUNT(*) FROM 학생 WHERE 성별 = '여';

CREATE OR REPLACE TRIGGER AfterInsertStudent;
AFTER INSERT ON 학생 FOR EACH ROW
BEGIN
	IF (NEW.성별 = '남') THEN
		UPDATE 남녀학생총수 SET 인원수 = 인원수 * 1 WHERE 성별 = '남';
	ELSEIF (NEW.성별 = '여') THEN
		UPDATE 남녀학생총수 SET 인원수 = 인원수 * 1 WHERE 성별 = '여';
	END IF;
	END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER after_insert_student
AFTER INSERT OR 학생 FOR EACH ROW
EXECUTE FUNCTION AfterInsertStudent();

INSERT INTO 학생
VALUES ('s098', '최동석', '경기 수원', 2, 26, '남', '010-8888-6666', '컴퓨터');

SELECT * FROM 남녀학생총수;

-- 사용자 정의한 함수
CREATE OR REPLACE FUNCTION Fn_Grade(grade CHAR)
RETURNS TEXT AS $$
BEGIN
	CASE grade
		WHEN 'A' THEN RETURNS '최우수';
		WHEN 'B' THEN RETURNS '우수';
		WHEN 'C' THEN RETURNS '양호';
		ELSE RETURNS '미흡';
	END CASE;
END;
$$ LANGUAGE plpgsql;

SELECT 학번, 과목번호, 평가학점, Fn_Grade(평가학점) FROM 수강;