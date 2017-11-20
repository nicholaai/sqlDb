-- Display people and their phone numbers

SELECT p.id AS person_id,
p.first_name,
p.last_name,
pn.id AS phone_id,
pn.number,
pn.extension
FROM people p
INNER JOIN phone_numbers pn
ON pn.person_id = p.id

-- Display people and their addresses

SELECT p.id AS person_id,
p.first_name,
p.last_name,
addy.id AS address_id,
addy.line_1,
addy.line_2,
addy.city,
addy.state,
addy.zip,
addy.country
FROM people p
INNER JOIN addresses addy
ON addy.person_id = p.id

-- Display people and their addresses only if they are in the state of California

SELECT p.id AS person_id,
p.first_name,
p.last_name,
addy.id AS address_id,
addy.line_1,
addy.line_2,
addy.city,
addy.state,
addy.zip,
addy.country
FROM people p
INNER JOIN addresses addy
ON (addy.person_id = p.id AND addy.state = 'CA')

-- Show how many people have addresses in each state

SELECT addy.state,
COUNT(DISTINCT p.id) AS unique_people
FROM addresses addy
INNER JOIN people p
ON addy.person_id = p.id
GROUP BY addy.state;

-- Show the % of people that have multiple addresses

WITH addresses_per_person AS
(
    SELECT person_id,
    COUNT(person_id) AS address_count
    FROM addresses
    GROUP BY person_id
)
SELECT 100.0 * SUM(CASE WHEN address_count > 1 THEN 1 ELSE 0 END) / COUNT(person_id) AS percent_multiple_addresses
FROM addresses_per_person;
