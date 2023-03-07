.print
.print ========= BONUS PRACTICE =========
.print - init db
.print ======== CHECK
SELECT * FROM cats JOIN toys on cats.id = toys.cat_id ORDER BY cats.id;
.print
.open example.db
.read build-db.sql
.print Phase 1: Dynamic INSERT using subquery with multiple insertions
.print Give all cats born before the year 2013 a new toy named "Cat Bed" using a subquery.
.print  ----- check before: 
SELECT * FROM cats JOIN toys on cats.id = toys.cat_id WHERE birth_year < 2013 ORDER BY birth_year;

INSERT INTO toys (name, cat_id)
    SELECT 'Cat Bad', id 
        FROM cats 
        WHERE birth_year < 2013;
;
.print   ------- checking result: 
SELECT * FROM cats JOIN toys on cats.id = toys.cat_id WHERE birth_year < 2013 ORDER BY birth_year;

.print
.print --------------------- Phase 2: Backup the tables using subquery
INSERT INTO cats_backup
    SELECT * from cats
;
SELECT cats.*, cats_backup.* 
    FROM cats LEFT JOIN cats_backup ON cats.id = cats_backup.id
;
INSERT INTO toys_backup
    SELECT * from toys
;
.print checking toys_backup
SELECT * FROM toys WHERE id NOT IN (SELECT id FROM toys_backup);
.print if no messsages ids are the same