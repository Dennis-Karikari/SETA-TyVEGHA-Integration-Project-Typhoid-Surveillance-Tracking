CREATE DATABASE seta_tyvegha;

USE seta_tyvegha;


CREATE TABLE seta_plus (
    RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
    Sex CHAR(1),
    Seta_plus_id VARCHAR(50) PRIMARY KEY,
    Tyvegha_id VARCHAR(50),
    Town VARCHAR(100)
);

SELECT *
FROM seta_plus;

LOAD DATA INFILE 'seta_plus_tyvegha.csv' INTO TABLE seta_plus
FIELDS TERMINATED BY ','
IGNORE 1 LINES; 


-- Creation of total linked table'

CREATE TABLE Total_linked (
	RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
	Seta_plus_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Seta_plus_id) REFERENCES seta_plus(seta_plus_id),
    Tyvegha_id VARCHAR(50),
	Town VARCHAR(100)
);

INSERT INTO Total_Linked
SELECT RecruitmentDate, ParticipantName, Age, Seta_plus_id, Tyvegha_id, Town
FROM seta_plus
WHERE tyvegha_id != 'NA';

SELECT *
FROM total_linked;


-- creation of Total_not_linked
CREATE TABLE Total_not_linked (
	RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
	Seta_plus_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Seta_plus_id) REFERENCES seta_plus(seta_plus_id),
    Tyvegha_id VARCHAR(50),
	Town VARCHAR(100)
);

INSERT INTO Total_not_Linked
SELECT RecruitmentDate, ParticipantName, Age, Seta_plus_id, Tyvegha_id, Town
FROM seta_plus
WHERE tyvegha_id = 'NA';

SELECT * 
FROM total_not_linked;


-- creation of table pre and post vacc total linked

CREATE TABLE Pre_vacc_total_linked (
	RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
	Seta_plus_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Seta_plus_id) REFERENCES total_linked(seta_plus_id),
    Tyvegha_id VARCHAR(50),
	Town VARCHAR(100)
);

INSERT INTO pre_vacc_total_linked
SELECT RecruitmentDate, ParticipantName, Age, Seta_plus_id, Tyvegha_id, Town
FROM seta_plus
WHERE tyvegha_id != 'NA'
  AND RecruitmentDate <= '2022-03-15';

SELECT * 
FROM pre_vacc_total_linked;


-- post_vacc_total_linked

CREATE TABLE Post_vacc_total_linked (
	RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
	Seta_plus_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Seta_plus_id) REFERENCES total_linked(seta_plus_id),
    Tyvegha_id VARCHAR(50),
	Town VARCHAR(100)
);

INSERT INTO post_vacc_total_linked
SELECT RecruitmentDate, ParticipantName, Age, Seta_plus_id, Tyvegha_id, Town
FROM seta_plus
WHERE tyvegha_id != 'NA'
  AND RecruitmentDate >= '2022-03-16';

SELECT * 
FROM post_vacc_total_linked;


-- creation of pre and post total_not_linked

CREATE TABLE Pre_vacc_total_not_linked (
	RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
	Seta_plus_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Seta_plus_id) REFERENCES total_not_linked(seta_plus_id),
    Tyvegha_id VARCHAR(50),
	Town VARCHAR(100)
);

INSERT INTO pre_vacc_total_not_linked
SELECT RecruitmentDate, ParticipantName, Age, Seta_plus_id, Tyvegha_id, Town
FROM seta_plus
WHERE tyvegha_id = 'NA'
  AND RecruitmentDate <= '2022-03-15';

SELECT * 
FROM pre_vacc_total_not_linked;


CREATE TABLE Post_vacc_total_not_linked (
	RecruitmentDate DATE,
    ParticipantName VARCHAR(255),
    Age VARCHAR(20),
	Seta_plus_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (Seta_plus_id) REFERENCES total_not_linked(seta_plus_id),
    Tyvegha_id VARCHAR(50),
	Town VARCHAR(100)
);

INSERT INTO post_vacc_total_not_linked
SELECT RecruitmentDate, ParticipantName, Age, Seta_plus_id, Tyvegha_id, Town
FROM seta_plus
WHERE tyvegha_id = 'NA'
  AND RecruitmentDate >= '2022-03-16';

/* Finding the number of participants enrolled, linked w/ tyvegha_id and not linked w/ tyvegha_id*/ 

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'ANA%'
	) AS ANA_total_linked;

SELECT * 
FROM seta_tyvegha.total_linked 
WHERE Town LIKE 'DOM%';

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'AGO%'
	) AS AGO_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'PEK%'
	) AS PEK_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'NYI%'
	) AS NYI_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'AMA%'
	) AS AMA_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'AKU%'
	) AS AKU_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'WIO%'
	) AS WIO_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'JUA%'
	) AS JUA_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'BEH%'
	) AS BEH_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'DAW%'
	) AS DAW_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'ADIE%'
	) AS ADIE_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'ADIN%'
	) AS ADIN_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'MAG%'
	) AS MAG_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_linked 
		WHERE Town LIKE 'PAT%'
	) AS PAT_total_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'ANA%'
	) AS ANA_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'DOM%'
	) AS DOM_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'AGO%'
	) AS AGO_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'PEK%'
	) AS PEK_not_linked;

SELECT * 
FROM seta_tyvegha.total_not_linked 
WHERE Town LIKE 'NYI%';

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'AMA%'
	) AS AMA_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'AKU%'
	) AS AKU_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'WIO%'
	) AS WIO_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'JUA%'
	) AS JUA_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'BEH%'
	) AS BEH_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'DAW%'
	) AS DAW_not_linked;

SELECT * 
FROM seta_tyvegha.total_not_linked 
WHERE Town LIKE 'ADIE%';

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'ADIN%'
	) AS ADIN_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'ADIN%'
	) AS ADIN_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'MAG%'
	) AS MAG_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.total_not_linked 
		WHERE Town LIKE 'PAT%'
	) AS PAT_not_linked;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'ANA%'
	) AS ANA_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'DOM%'
	) AS DOM_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'AGO%'
	) AS AGO_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'PEK%'
	) AS PEK_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'NYI%'
	) AS NYI_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'AMA%'
	) AS AMA_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'AKU%'
	) AS AKU_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'WIO%'
	) AS WIO_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'JUA%'
	) AS JUA_total_enrolled;

SELECT *
FROM(
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'BEH%'
	) AS BEH_total_enrolled;

SELECT *
FROM(
		SELECT *
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'DAW%'
) AS DAW_total_enrolled;

SELECT *
FROM( 
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'ADIE%'
) AS ADIE_total_enrolled;

SELECT * 
FROM (	
		SELECT *
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'MAG%'
		) AS MAG_total_enrolled;

SELECT *
FROM (
		SELECT * 
		FROM seta_tyvegha.seta_plus 
		WHERE Town LIKE 'PAT%'
	)AS Pat_total_enrolled;
    

SELECT 
    COUNT(*) AS ago_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'AGO%'
) AS AGO_total_linked;

SELECT 
    COUNT(*) AS ANA_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'ANA%'
) AS ANA_total_linked;

SELECT 
    COUNT(*) AS DOM_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'DOM%'
) AS DOM_total_linked;

SELECT 
    COUNT(*) AS pek_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'PEK%'
) AS PEK_total_linked;

SELECT 
    COUNT(*) AS nyi_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'NYI%'
) AS NYI_total_linked;

SELECT 
    COUNT(*) AS AMA_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'AMA%'
) AS AMA_total_linked;

SELECT 
    COUNT(*) AS AKU_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'AKU%'
) AS AKU_total_linked;

SELECT 
    COUNT(*) AS WIO_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'WIO%'
) AS WIO_total_linked;

SELECT 
    COUNT(*) AS JUA_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'JUA%'
) AS JUA_total_linked;

SELECT 
    COUNT(*) AS BEH_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'BEH%'
) AS BEH_total_linked;

SELECT 
    COUNT(*) AS DAW_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'DAW%'
) AS DAW_total_linked;

SELECT 
    COUNT(*) AS ADIE_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'ADIE%'
) AS ADIE_total_linked;

SELECT 
    COUNT(*) AS ADIN_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'ADIN%'
) AS ADIN_total_linked;

SELECT 
    COUNT(*) AS MAG_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'MAG%'
) AS MAG_total_linked;

SELECT 
    COUNT(*) AS PAT_linked_count,
    (SELECT COUNT(*) FROM seta_tyvegha.total_linked) AS total_linked_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2) AS percentage_of_total,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM seta_tyvegha.total_linked), 2), '%') AS percentage_with_symbol
FROM (
    SELECT * 
    FROM seta_tyvegha.total_linked 
    WHERE Town LIKE 'PAT%'
) AS PAT_total_linked;


/* finding the percentage linked and not_linked with tyvegha_id's in all towns */ 

-- ALL TOWNS % TOTAL_LINKED
SELECT 
    11931 AS total_enrolled,
    10489 AS Total_linked_with_tyvegha,
    ROUND((10489 / 11931) * 100, 2) AS percentage_linked;
    
-- ALL TOWNS % TOTAL_NOT_LINKED 
SELECT 
    11931 AS total_enrolled,
    1442 AS Total_not_linked_with_tyvegha,
    ROUND((1442 / 11931) * 100, 2) AS percentage_not_linked;
    
    -- AGOGO % total_not_linked
    SELECT 
    2740 AS total_enrolled,
    338 AS not_linked_with_tyvegha,
    ROUND((338 / 2740) * 100, 2) AS percentage_not_linked;


-- AGOGO % total_linked
SELECT 
    2740 AS total_enrolled,
    2402 AS linked_with_tyvegha,
    ROUND((2402 / 2740) * 100, 2) AS percentage_linked;
    -- AGOGO % total_not_linked
    SELECT 
    2740 AS total_enrolled,
    338 AS not_linked_with_tyvegha,
    ROUND((338 / 2740) * 100, 2) AS percentage_not_linked;
    
    -- ANANEKROM % total_linked
SELECT 
    2498 AS total_enrolled,
    1981 AS linked_with_tyvegha,
    ROUND((1981 / 2498) * 100, 2) AS percentage_linked;
    -- ANANEKROM % total_not_linked
    SELECT 
    2498 AS total_enrolled,
    517 AS not_linked_with_tyvegha,
    ROUND((517 / 2498) * 100, 2) AS percentage_not_linked;
    
        -- DOMEABRA % total_linked
SELECT 
    997 AS total_enrolled,
    912 AS linked_with_tyvegha,
    ROUND((912 / 997) * 100, 2) AS percentage_linked;
    -- DOMEABRA % total_not_linked
    SELECT 
    997 AS total_enrolled,
    85 AS not_linked_with_tyvegha,
    ROUND((85 / 997) * 100, 2) AS percentage_not_linked;
    
        -- PEKYEREKYE % total_linked
SELECT 
    765 AS total_enrolled,
    691 AS linked_with_tyvegha,
    ROUND((691 / 765) * 100, 2) AS percentage_linked;
    -- PEKYEREKYE % total_not_linked
    SELECT 
    765 AS total_enrolled,
    74 AS not_linked_with_tyvegha,
    ROUND((74 / 765) * 100, 2) AS percentage_not_linked;
    
        -- NYINAMPONASE % total_linked
SELECT 
    338 AS total_enrolled,
    299 AS linked_with_tyvegha,
    ROUND((299 / 338) * 100, 2) AS percentage_linked;
    -- NYINAMPONASE % total_not_linked
    SELECT 
    338 AS total_enrolled,
    39 AS not_linked_with_tyvegha,
    ROUND((39 / 338) * 100, 2) AS percentage_not_linked;
    
        -- AMANTENA % total_linked
SELECT 
    638 AS total_enrolled,
    618 AS linked_with_tyvegha,
    ROUND((618 / 638) * 100, 2) AS percentage_linked;
    -- AMANTENA % total_not_linked
    SELECT 
    638 AS total_enrolled,
    20 AS not_linked_with_tyvegha,
    ROUND((20 / 638) * 100, 2) AS percentage_not_linked;
    
        -- AKUTUASE % total_linked
SELECT 
    992 AS total_enrolled,
    937 AS linked_with_tyvegha,
    ROUND((937 / 992) * 100, 2) AS percentage_linked;
    -- AKUTUASE % total_not_linked
    SELECT 
    992 AS total_enrolled,
    55 AS not_linked_with_tyvegha,
    ROUND((55 / 992) * 100, 2) AS percentage_not_linked;
    
        -- WIOSO % total_linked
SELECT 
    803 AS total_enrolled,
    765 AS linked_with_tyvegha,
    ROUND((765 / 803) * 100, 2) AS percentage_linked;
    -- WIOSO % total_not_linked
    SELECT 
    803 AS total_enrolled,
    38 AS not_linked_with_tyvegha,
    ROUND((38 / 803) * 100, 2) AS percentage_not_linked;
    
        -- JUANSA % total_linked
SELECT 
    940 AS total_enrolled,
    860 AS linked_with_tyvegha,
    ROUND((860 / 940) * 100, 2) AS percentage_linked;
    -- JUANSA % total_not_linked
    SELECT 
    940 AS total_enrolled,
    80 AS not_linked_with_tyvegha,
    ROUND((80 / 940) * 100, 2) AS percentage_not_linked;
    
        -- BEHWE % total_linked
SELECT 
    98 AS total_enrolled,
    95 AS linked_with_tyvegha,
    ROUND((95 / 98) * 100, 2) AS percentage_linked;
    -- BEHWE % total_not_linked
    SELECT 
	98 AS total_enrolled,
    3 AS not_linked_with_tyvegha,
    ROUND((3 / 98) * 100, 2) AS percentage_not_linked;
    
        -- DAWERESO % total_linked
SELECT 
    84 AS total_enrolled,
    82 AS linked_with_tyvegha,
    ROUND((82 / 84) * 100, 2) AS percentage_linked;
    -- DAWERESO % total_not_linked
    SELECT 
    84 AS total_enrolled,
    2 AS not_linked_with_tyvegha,
    ROUND((2 / 84) * 100, 2) AS percentage_not_linked;
    
        -- ADIEMBRA % total_linked
SELECT 
    235 AS total_enrolled,
    202 AS linked_with_tyvegha,
    ROUND((202 / 235) * 100, 2) AS percentage_linked;
    -- ADIEMBRA % total_not_linked
    SELECT 
    235 AS total_enrolled,
    33 AS not_linked_with_tyvegha,
    ROUND((33 / 235) * 100, 2) AS percentage_not_linked;
    
        -- ADINKRA % total_linked
SELECT 
    26 AS total_enrolled,
    6 AS linked_with_tyvegha,
    ROUND((6 / 26) * 100, 2) AS percentage_linked;
    -- ADINKRA % total_not_linked
    SELECT 
    26 AS total_enrolled,
    20 AS not_linked_with_tyvegha,
    ROUND((20 / 26) * 100, 2) AS percentage_not_linked;
    
        -- MAGYEDA % total_linked
SELECT 
    53 AS total_enrolled,
    31 AS linked_with_tyvegha,
    ROUND((31 / 53) * 100, 2) AS percentage_linked;
    -- MAGYEDA % total_not_linked
    SELECT 
    53 AS total_enrolled,
    22 AS not_linked_with_tyvegha,
    ROUND((22 / 53) * 100, 2) AS percentage_not_linked;
    
        -- PATABAN % total_linked
SELECT 
    19 AS total_enrolled,
    9 AS linked_with_tyvegha,
    ROUND((9 / 19) * 100, 2) AS percentage_linked;
    -- PATABAN % total_not_linked
    SELECT 
    19 AS total_enrolled,
    10 AS not_linked_with_tyvegha,
    ROUND((10 / 19) * 100, 2) AS percentage_not_linked;