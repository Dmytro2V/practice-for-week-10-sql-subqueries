.print ======== CHECK
SELECT * FROM cats JOIN toys on cats.id = toys.cat_id;
.print
.print Phase 1: Replace JOIN query with subquery
.print Write a JOIN query to get the list of toys belonging to Garfield.
SELECT cats.name, toys.name FROM cats JOIN toys on cats.id = toys.cat_id
    WHERE cats.name = 'Garfield'
;
INSERT INTO toys (name, cat_id)
    VALUES ("Pepperoni", (SELECT id FROM cats WHERE name = 'Garfield'))
;
.print Rewrite the JOIN query using a subquery instead.
SELECT 'Garfield', name FROM toys WHERE cat_id IN (SELECT id FROM cats WHERE name = 'Garfield');
.print
.print Phase 2: Dynamic INSERT using subquery
.print Give Garfield a new toy named "Pepperoni" using a subquery for Garfield's id.
INSERT INTO toys (name, cat_id)
    VALUES ("Pepperoni", (SELECT id FROM cats WHERE name = 'Garfield'))
;