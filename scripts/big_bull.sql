-- -- ============================================================
-- GAME INFO
-- ============================================================
DROP TABLE IF EXISTS game_info;

CREATE TABLE game_info (
    game_id             INT PRIMARY KEY,
    title               VARCHAR(100),
    subtitle            VARCHAR(200),
    theme               VARCHAR(300),
    era_covered         VARCHAR(50),
    total_chapters      INT,
    sql_concepts_taught VARCHAR(500),
    moral_of_game       VARCHAR(500),
    tagline             VARCHAR(200),
    based_on            VARCHAR(200)
);

INSERT INTO game_info VALUES (
    1,
    'The Big Bull: A SQL Story',
    'Uncover the rise and fall of India''s most controversial stockbroker',
    'A story of ambition, systemic corruption, moral ambiguity, and the blurred line between genius and crime in 1990s India',
    '1954 - 2001',
    8,
    'SELECT, WHERE, ORDER BY, GROUP BY, HAVING, JOIN, LEFT JOIN, Subqueries, Nested Queries, Aggregations, CASE WHEN, EXISTS',
    'In a broken system, the man who knows all the rules can bend them — but the system always decides who the criminal is. You will learn who Harshad Mehta really was, what he built, who helped him, who destroyed him, and whether justice was ever truly served.',
    'In a broken system, genius and crime look exactly the same — until someone decides which one you are.',
    'Based on the true story of Harshad Shantilal Mehta and the 1992 Indian Stock Market Scam'
);


-- ============================================================
-- CHAPTER 1: "The Boy from Raipur" (1954 - 1976)
-- ============================================================


-- ============================================================
-- TABLE 1: characters
-- ============================================================
DROP TABLE IF EXISTS characters;

CREATE TABLE characters (
    character_id      INT PRIMARY KEY,
    full_name         VARCHAR(100),
    birth_date        DATE,
    birth_city        VARCHAR(50),
    birth_state       VARCHAR(50),
    community         VARCHAR(50),
    father_name       VARCHAR(100),
    is_main_character BOOLEAN
);

INSERT INTO characters VALUES
(1,  'Harshad Shantilal Mehta', '1954-07-29', 'Raipur',   'Madhya Pradesh', 'Gujarati', 'Shantilal Mehta', TRUE),
(2,  'Rakesh Gujarati',         '1955-03-14', 'Surat',    'Gujarat',        'Gujarati', 'Mohan Gujarati',  FALSE),
(3,  'Suresh Mehta',            '1953-11-02', 'Nagpur',   'Maharashtra',    'Gujarati', 'Ramesh Mehta',    FALSE),
(4,  'Ashwin Shantilal',        '1954-07-29', 'Raipur',   'Madhya Pradesh', 'Marwari',  'Shantilal Desai', FALSE),
(5,  'Bimal Jain',              '1956-06-18', 'Kolkata',  'West Bengal',    'Marwari',  'Dilip Jain',      FALSE),
(6,  'Harshad Natvarlal',       '1954-07-29', 'Raipur',   'Madhya Pradesh', 'Gujarati', 'Natvarlal Mehta', FALSE),
(7,  'Pravin Mehta',            '1957-09-25', 'Vadodara', 'Gujarat',        'Gujarati', 'Shantilal Mehta', FALSE),
(8,  'Chandrakant Mehta',       '1952-01-30', 'Raipur',   'Madhya Pradesh', 'Gujarati', 'Bhikhalal Mehta', FALSE),
(9,  'Deepak Shantilal Mehta',  '1954-07-29', 'Raipur',   'Madhya Pradesh', 'Gujarati', 'Shantilal Mehta', FALSE),
(10, 'Jignesh Parekh',          '1955-12-05', 'Rajkot',   'Gujarat',        'Gujarati', 'Haresh Parekh',   FALSE);


-- ============================================================
-- TABLE 2: family
-- ============================================================
DROP TABLE IF EXISTS family;

CREATE TABLE family (
    family_id    INT PRIMARY KEY,
    character_id INT,
    member_name  VARCHAR(100),
    relation     VARCHAR(50),
    birth_city   VARCHAR(50),
    occupation   VARCHAR(100),
    is_real      BOOLEAN
);

INSERT INTO family VALUES
(1,  1, 'Shantilal Mehta', 'Father',        'Raipur', 'Small Business Owner', TRUE),
(2,  1, 'Rasilaben Mehta', 'Mother',        'Raipur', 'Homemaker',            TRUE),
(3,  1, 'Ashwin Mehta',    'Brother',       'Raipur', 'Businessman',          TRUE),
(4,  1, 'Sudhir Mehta',    'Brother',       'Raipur', 'Businessman',          TRUE),
(5,  1, 'Jyoti Mehta',     'Sister',        'Bombay', 'Homemaker',            FALSE),
(6,  1, 'Ramesh Mehta',    'Uncle',         'Surat',  'Textile Merchant',     FALSE),
(7,  1, 'Lata Mehta',      'Cousin Sister', 'Raipur', 'Teacher',              FALSE),
(8,  2, 'Mohan Gujarati',  'Father',        'Surat',  'Farmer',               FALSE),
(9,  3, 'Ramesh Mehta',    'Father',        'Nagpur', 'Clerk',                FALSE),
(10, 1, 'Sunita Mehta',    'Sister',        'Bombay', 'Homemaker',            FALSE);


-- ============================================================
-- TABLE 3: cities_lived
-- ============================================================
DROP TABLE IF EXISTS cities_lived;

CREATE TABLE cities_lived (
    city_id      INT PRIMARY KEY,
    character_id INT,
    city         VARCHAR(50),
    state        VARCHAR(50),
    moved_year   INT,
    reason       VARCHAR(200),
    is_real      BOOLEAN
);

INSERT INTO cities_lived VALUES
(1,  1, 'Raipur',    'Madhya Pradesh', 1954, 'Born here',                                 TRUE),
(2,  1, 'Bombay',    'Maharashtra',    1964, 'Family relocated for better opportunities',  TRUE),
(3,  1, 'Kandivali', 'Maharashtra',    1964, 'Settled in chawl after arriving in Bombay', TRUE),
(4,  1, 'Surat',     'Gujarat',        1970, 'Briefly stayed with relatives',             FALSE),
(5,  1, 'Pune',      'Maharashtra',    1972, 'Rumored college transfer — not confirmed',  FALSE),
(6,  1, 'Ahmedabad', 'Gujarat',        1968, 'Family ancestral visit',                    FALSE),
(7,  2, 'Surat',     'Gujarat',        1955, 'Born here',                                 FALSE),
(8,  3, 'Nagpur',    'Maharashtra',    1953, 'Born here',                                 FALSE),
(9,  1, 'Bombay',    'Maharashtra',    1976, 'Continued stay after college',              TRUE),
(10, 1, 'Delhi',     'Delhi',          1975, 'Short job search trip',                     FALSE);


-- ============================================================
-- TABLE 4: education
-- ============================================================
DROP TABLE IF EXISTS education;

CREATE TABLE education (
    education_id INT PRIMARY KEY,
    character_id INT,
    institution  VARCHAR(150),
    degree       VARCHAR(100),
    city         VARCHAR(50),
    start_year   INT,
    end_year     INT,
    is_real      BOOLEAN
);

INSERT INTO education VALUES
(1,  1, 'Holy Cross High School',       'SSC',             'Bombay', 1964, 1972, TRUE),
(2,  1, 'Lala Lajpat Rai College',      'B.Com',           'Bombay', 1972, 1976, TRUE),
(3,  1, 'Sydenham College of Commerce', 'B.Com',           'Bombay', 1972, 1976, FALSE),
(4,  1, 'H.R. College of Commerce',     'M.Com',           'Bombay', 1976, 1978, FALSE),
(5,  1, 'Raipur Government School',     'Primary',         'Raipur', 1960, 1964, TRUE),
(6,  2, 'Surat Municipal School',       'SSC',             'Surat',  1965, 1973, FALSE),
(7,  3, 'Nagpur University',            'B.Com',           'Nagpur', 1971, 1975, FALSE),
(8,  1, 'Bombay University Extension',  'Diploma Finance', 'Bombay', 1977, 1978, FALSE),
(9,  1, 'Holy Cross High School',       'HSC',             'Bombay', 1972, 1973, FALSE),
(10, 1, 'Lala Lajpat Rai College',      'B.Com',           'Bombay', 1973, 1976, FALSE);


-- ============================================================
-- TABLE 5: early_jobs
-- ============================================================
DROP TABLE IF EXISTS early_jobs;

CREATE TABLE early_jobs (
    job_id         INT PRIMARY KEY,
    character_id   INT,
    job_title      VARCHAR(100),
    employer       VARCHAR(150),
    city           VARCHAR(50),
    start_year     INT,
    end_year       INT,
    monthly_salary INT,
    is_real        BOOLEAN
);

INSERT INTO early_jobs VALUES
(1,  1, 'Hosiery Worker',       'New Bengal Hosiery Factory', 'Bombay', 1976, 1977, 350,  TRUE),
(2,  1, 'Cement Dealer',        'Self — Small Trade',         'Bombay', 1977, 1978, 500,  TRUE),
(3,  1, 'Diamond Sorter',       'Laxmi Diamond House',        'Bombay', 1978, 1979, 450,  TRUE),
(4,  1, 'Dispatch Clerk',       'The Eastern Company',        'Bombay', 1979, 1980, 600,  TRUE),
(5,  1, 'Sales Executive',      'HLL Consumer Products',      'Bombay', 1978, 1980, 750,  FALSE),
(6,  1, 'Bank Clerk',           'Bank of India — Kandivali',  'Bombay', 1977, 1979, 550,  FALSE),
(7,  1, 'Textile Salesman',     'Bombay Textile Mills',       'Bombay', 1976, 1977, 400,  FALSE),
(8,  2, 'Accountant Trainee',   'Surat Cooperative Bank',     'Surat',  1977, 1979, 480,  FALSE),
(9,  1, 'Sub-Broker Assistant', 'Dalal Street Brokers',       'Bombay', 1980, 1981, 800,  TRUE),
(10, 1, 'Insurance Agent',      'LIC of India',               'Bombay', 1979, 1980, 500,  FALSE);

-- ============================================================
-- CHAPTER 2: "The BSE Floor" (1980 - 1986)
-- ============================================================


-- ============================================================
-- TABLE 1: bse_members
-- (noise: 100+ brokers — hard inserted, no loops needed
--  as data is already varied and dynamic)
-- ============================================================
DROP TABLE IF EXISTS bse_members;

CREATE TABLE bse_members (
    member_id         INT PRIMARY KEY,
    full_name         VARCHAR(100),
    member_type       VARCHAR(50),
    registration_year INT,
    firm_name         VARCHAR(150),
    city              VARCHAR(50),
    is_active         BOOLEAN,
    character_id      INT
);

-- Noise: loop-generate 100 generic broker rows
INSERT INTO bse_members (
    member_id, full_name, member_type, registration_year,
    firm_name, city, is_active, character_id
)
SELECT
    n,
    'Broker ' || n,
    CASE WHEN n % 2 = 0 THEN 'Full Member' ELSE 'Sub Broker' END,
    1975 + (n % 12),
    'Brokerage Firm No.' || n,
    CASE WHEN n % 5 = 0 THEN 'Delhi'
         WHEN n % 5 = 1 THEN 'Surat'
         WHEN n % 5 = 2 THEN 'Pune'
         WHEN n % 5 = 3 THEN 'Calcutta'
         ELSE 'Bombay' END,
    CASE WHEN n % 4 = 0 THEN FALSE ELSE TRUE END,
    NULL
FROM generate_series(101, 200) AS s(n);

-- Hard insert real + story-critical members
INSERT INTO bse_members VALUES
(1,   'Harshad Shantilal Mehta', 'Full Member', 1984, 'Growmore Research and Asset Management', 'Bombay', TRUE,  1),
(2,   'Prasann Pranjpe',         'Full Member', 1971, 'Pranjpe Brokers',                        'Bombay', TRUE,  NULL),
(3,   'Mahesh Desai',            'Sub Broker',  1980, 'Desai Securities',                       'Bombay', TRUE,  NULL),
(4,   'Arvind Johari',           'Full Member', 1982, 'Johari Trading Co.',                     'Bombay', TRUE,  NULL),
(5,   'Ravi Shankar',            'Sub Broker',  1983, 'Shankar Brokers',                        'Bombay', FALSE, NULL),
(6,   'Suresh Patel',            'Full Member', 1984, 'Patel Equities',                         'Bombay', TRUE,  NULL),
(7,   'Harshad Natvarlal',       'Sub Broker',  1984, 'Natvarlal Stocks',                       'Bombay', FALSE, NULL),
(8,   'Dinesh Kapoor',           'Full Member', 1979, 'Kapoor Assets',                          'Bombay', TRUE,  NULL),
(9,   'Brijesh Lal',             'Sub Broker',  1981, 'Lal Investments',                        'Bombay', TRUE,  NULL),
(10,  'Ashok Trivedi',           'Full Member', 1985, 'Trivedi Capital',                        'Bombay', TRUE,  NULL),
(11,  'Ramesh Chandra',          'Sub Broker',  1980, 'Chandra Brokers',                        'Bombay', TRUE,  NULL),
(12,  'Vijay Malhotra',          'Full Member', 1983, 'Malhotra Securities',                    'Delhi',  TRUE,  NULL),
(13,  'Pramod Nair',             'Sub Broker',  1982, 'Nair Equities',                          'Bombay', FALSE, NULL),
(14,  'Hemant Shah',             'Full Member', 1986, 'Shah Trading',                           'Bombay', TRUE,  NULL),
(15,  'Kantilal Mehta',          'Full Member', 1978, 'Kantilal Mehta Shares',                  'Bombay', TRUE,  NULL),
(16,  'Naresh Agarwal',          'Sub Broker',  1984, 'Agarwal Stocks',                         'Bombay', TRUE,  NULL),
(17,  'Dilip Sanghvi',           'Full Member', 1981, 'Sanghvi Capital',                        'Bombay', TRUE,  NULL),
(18,  'Mukesh Parekh',           'Sub Broker',  1985, 'Parekh Brokers',                         'Bombay', TRUE,  NULL),
(19,  'Sanjay Khanna',           'Full Member', 1983, 'Khanna Investments',                     'Delhi',  FALSE, NULL),
(20,  'Anil Bajaj',              'Sub Broker',  1986, 'Bajaj Securities',                       'Bombay', TRUE,  NULL),
(21,  'Rakesh Jhunjhunwala',     'Sub Broker',  1985, 'Rare Enterprises',                       'Bombay', TRUE,  NULL),
(22,  'Deepak Mehta',            'Sub Broker',  1984, 'Deepak Mehta Brokers',                   'Bombay', FALSE, NULL),
(23,  'Jitendra Vora',           'Full Member', 1982, 'Vora Equities',                          'Bombay', TRUE,  NULL),
(24,  'Bipin Shah',              'Sub Broker',  1980, 'Shah Securities',                        'Bombay', TRUE,  NULL),
(25,  'Harish Trivedi',          'Full Member', 1979, 'Trivedi Stocks',                         'Bombay', TRUE,  NULL),
(26,  'Gopal Rao',               'Sub Broker',  1983, 'Rao Capital',                            'Bombay', FALSE, NULL),
(27,  'Chandresh Patel',         'Full Member', 1986, 'Patel Investments',                      'Surat',  TRUE,  NULL),
(28,  'Sunil Doshi',             'Sub Broker',  1981, 'Doshi Brokers',                          'Bombay', TRUE,  NULL),
(29,  'Yogesh Mehta',            'Full Member', 1984, 'Yogesh Mehta Co.',                       'Bombay', FALSE, NULL),
(30,  'Parag Parikh',            'Full Member', 1983, 'Parag Parikh Securities',                'Bombay', TRUE,  NULL),
(31,  'Kiran Mazumdar',          'Sub Broker',  1985, 'Mazumdar Stocks',                        'Bombay', TRUE,  NULL),
(32,  'Shyam Sunder',            'Full Member', 1980, 'Sunder Trading',                         'Bombay', TRUE,  NULL),
(33,  'Kamlesh Joshi',           'Sub Broker',  1982, 'Joshi Securities',                       'Bombay', FALSE, NULL),
(34,  'Nitin Gadkari',           'Sub Broker',  1984, 'Gadkari Equities',                       'Bombay', TRUE,  NULL),
(35,  'Prakash Mehta',           'Full Member', 1981, 'Prakash Mehta Stocks',                   'Bombay', TRUE,  NULL),
(36,  'Lalit Modi',              'Sub Broker',  1986, 'Modi Capital',                           'Delhi',  FALSE, NULL),
(37,  'Vipul Sanghavi',          'Full Member', 1983, 'Sanghavi Brokers',                       'Bombay', TRUE,  NULL),
(38,  'Chirag Lakhani',          'Sub Broker',  1985, 'Lakhani Securities',                     'Bombay', TRUE,  NULL),
(39,  'Mohan Das',               'Full Member', 1979, 'Das Investments',                        'Bombay', TRUE,  NULL),
(40,  'Suhas Rane',              'Sub Broker',  1984, 'Rane Equities',                          'Bombay', FALSE, NULL),
(41,  'Harshad S. Mehta',        'Sub Broker',  1981, 'H.S. Mehta Brokers',                     'Bombay', FALSE, NULL),
(42,  'Bharat Desai',            'Full Member', 1982, 'Desai Capital',                          'Bombay', TRUE,  NULL),
(43,  'Ketan Parekh',            'Sub Broker',  1986, 'Parekh Capital',                         'Bombay', TRUE,  NULL),
(44,  'Deepak Parekh',           'Full Member', 1977, 'HDFC Securities',                        'Bombay', TRUE,  NULL),
(45,  'Rajesh Nair',             'Sub Broker',  1983, 'Nair Stocks',                            'Bombay', FALSE, NULL),
(46,  'Manish Tiwari',           'Full Member', 1985, 'Tiwari Trading',                         'Bombay', TRUE,  NULL),
(47,  'Ashwin Mehta',            'Sub Broker',  1984, 'Ashwin Mehta Brokers',                   'Bombay', TRUE,  NULL),
(48,  'Nilesh Kapadia',          'Full Member', 1980, 'Kapadia Equities',                       'Bombay', TRUE,  NULL),
(49,  'Tushar Trivedi',          'Sub Broker',  1986, 'Trivedi Stocks',                         'Bombay', FALSE, NULL),
(50,  'Girish Chandra',          'Full Member', 1982, 'Chandra Securities',                     'Bombay', TRUE,  NULL),
(51,  'Vivek Oberoi',            'Sub Broker',  1985, 'Oberoi Capital',                         'Bombay', TRUE,  NULL),
(52,  'Neeraj Gupta',            'Full Member', 1983, 'Gupta Equities',                         'Delhi',  TRUE,  NULL),
(53,  'Rajan Pillai',            'Sub Broker',  1981, 'Pillai Stocks',                          'Bombay', FALSE, NULL),
(54,  'Harshad M. Mehta',        'Full Member', 1984, 'HM Brokers',                             'Bombay', FALSE, NULL),
(55,  'Sanjiv Kapoor',           'Full Member', 1984, 'Kapoor Investments',                     'Bombay', TRUE,  NULL),
(56,  'Pradeep Gupta',           'Sub Broker',  1982, 'Gupta Trading',                          'Bombay', TRUE,  NULL),
(57,  'Ramakant Joshi',          'Full Member', 1979, 'Joshi Capital',                          'Bombay', TRUE,  NULL),
(58,  'Kiran Shah',              'Sub Broker',  1984, 'Shah Investments',                       'Bombay', FALSE, NULL),
(59,  'Mahendra Patel',          'Full Member', 1986, 'Patel Stocks',                           'Surat',  TRUE,  NULL),
(60,  'Uday Kotak',              'Full Member', 1985, 'Kotak Securities',                       'Bombay', TRUE,  NULL),
(61,  'Ajay Thakur',             'Sub Broker',  1983, 'Thakur Equities',                        'Bombay', TRUE,  NULL),
(62,  'Suhel Seth',              'Sub Broker',  1984, 'Seth Brokers',                           'Delhi',  FALSE, NULL),
(63,  'Narendra Shah',           'Full Member', 1980, 'Shah Capital',                           'Bombay', TRUE,  NULL),
(64,  'Yogendra Trivedi',        'Full Member', 1977, 'Trivedi Investments',                    'Bombay', TRUE,  NULL),
(65,  'Amitabh Jhunjhunwala',    'Sub Broker',  1985, 'AJ Stocks',                              'Bombay', FALSE, NULL),
(66,  'Haresh Sanghani',         'Full Member', 1982, 'Sanghani Brokers',                       'Bombay', TRUE,  NULL),
(67,  'Pradip Mehta',            'Sub Broker',  1984, 'Pradip Mehta Securities',                'Bombay', FALSE, NULL),
(68,  'Rajen Vakil',             'Full Member', 1983, 'Vakil Capital',                          'Bombay', TRUE,  NULL),
(69,  'Bhavesh Lakhia',          'Sub Broker',  1985, 'Lakhia Stocks',                          'Bombay', TRUE,  NULL),
(70,  'Satish Mehta',            'Full Member', 1981, 'Satish Mehta Co.',                       'Bombay', FALSE, NULL),
(71,  'Ramesh Damani',           'Full Member', 1985, 'Damani Securities',                      'Bombay', TRUE,  NULL),
(72,  'Vikram Parekh',           'Sub Broker',  1983, 'Vikram Parekh Co.',                      'Bombay', FALSE, NULL),
(73,  'Hitesh Jain',             'Sub Broker',  1984, 'Jain Trading',                           'Bombay', TRUE,  NULL),
(74,  'Nandkumar Rao',           'Full Member', 1982, 'Rao Investments',                        'Bombay', TRUE,  NULL),
(75,  'Shailesh Mehta',          'Sub Broker',  1986, 'Shailesh Mehta Brokers',                 'Bombay', FALSE, NULL),
(76,  'Kishore Biyani',          'Sub Broker',  1985, 'Biyani Capital',                         'Bombay', TRUE,  NULL),
(77,  'Devang Mehta',            'Full Member', 1984, 'Devang Mehta Equities',                  'Bombay', FALSE, NULL),
(78,  'Nimesh Shah',             'Sub Broker',  1983, 'Nimesh Shah Stocks',                     'Bombay', TRUE,  NULL),
(79,  'Alok Agarwal',            'Full Member', 1981, 'Agarwal Capital',                        'Bombay', TRUE,  NULL),
(80,  'Hardik Mehta',            'Sub Broker',  1984, 'Hardik Mehta Brokers',                   'Bombay', FALSE, NULL),
(81,  'Prashant Mehta',          'Full Member', 1985, 'Prashant Mehta Co.',                     'Bombay', FALSE, NULL),
(82,  'Chetan Shah',             'Sub Broker',  1982, 'Shah Equities',                          'Surat',  TRUE,  NULL),
(83,  'Anand Mehta',             'Full Member', 1983, 'Anand Mehta Securities',                 'Bombay', FALSE, NULL),
(84,  'Suresh Joshi',            'Sub Broker',  1980, 'Joshi Brokers',                          'Bombay', TRUE,  NULL),
(85,  'Vinay Mehta',             'Full Member', 1984, 'Vinay Mehta Capital',                    'Bombay', FALSE, NULL),
(86,  'Ghanshyam Das',           'Sub Broker',  1979, 'Das Brokers',                            'Bombay', TRUE,  NULL),
(87,  'Mukund Trivedi',          'Full Member', 1983, 'Trivedi Investments',                    'Bombay', TRUE,  NULL),
(88,  'Ajit Dayal',              'Full Member', 1986, 'Quantum Advisors',                       'Bombay', TRUE,  NULL),
(89,  'Raju Mehta',              'Sub Broker',  1984, 'Raju Mehta Stocks',                      'Bombay', FALSE, NULL),
(90,  'Siddharth Bhat',          'Full Member', 1985, 'Bhat Securities',                        'Bombay', TRUE,  NULL),
(91,  'Mayank Agrawal',          'Sub Broker',  1982, 'Agrawal Trading',                        'Delhi',  TRUE,  NULL),
(92,  'Deepesh Mehta',           'Full Member', 1984, 'Deepesh Mehta Co.',                      'Bombay', FALSE, NULL),
(93,  'Vikas Singhania',         'Sub Broker',  1985, 'Singhania Stocks',                       'Bombay', TRUE,  NULL),
(94,  'Mihir Vora',              'Full Member', 1983, 'Vora Capital',                           'Bombay', TRUE,  NULL),
(95,  'Sameer Arora',            'Sub Broker',  1986, 'Arora Equities',                         'Bombay', TRUE,  NULL),
(96,  'Ramesh Shah',             'Full Member', 1980, 'Shah Brokers',                           'Bombay', TRUE,  NULL),
(97,  'Nikhil Mehta',            'Sub Broker',  1984, 'Nikhil Mehta Co.',                       'Bombay', FALSE, NULL),
(98,  'Tarun Mehta',             'Full Member', 1985, 'Tarun Mehta Securities',                 'Bombay', FALSE, NULL),
(99,  'Hiren Shah',              'Sub Broker',  1982, 'Hiren Shah Brokers',                     'Bombay', TRUE,  NULL),
(100, 'Jayesh Desai',            'Full Member', 1983, 'Desai Investments',                      'Bombay', TRUE,  NULL);


-- ============================================================
-- TABLE 2: firms
-- ============================================================
DROP TABLE IF EXISTS firms;

CREATE TABLE firms (
    firm_id           INT PRIMARY KEY,
    firm_name         VARCHAR(150),
    founder_name      VARCHAR(100),
    registration_year INT,
    city              VARCHAR(50),
    firm_type         VARCHAR(100),
    capital_at_start  BIGINT,
    character_id      INT,
    is_real           BOOLEAN
);

-- Noise: loop-generate 40 generic firms
INSERT INTO firms (
    firm_id, firm_name, founder_name, registration_year,
    city, firm_type, capital_at_start, character_id, is_real
)
SELECT
    n + 10,
    'Generic Brokerage Firm ' || n,
    'Owner Name ' || n,
    1978 + (n % 10),
    CASE WHEN n % 3 = 0 THEN 'Delhi'
         WHEN n % 3 = 1 THEN 'Surat'
         ELSE 'Bombay' END,
    CASE WHEN n % 3 = 0 THEN 'Stock Broking'
         WHEN n % 3 = 1 THEN 'Investment Advisory'
         ELSE 'Research Firm' END,
    100000 + (n * 15000),
    NULL,
    FALSE
FROM generate_series(1, 40) AS s(n);

-- Hard insert real firms
INSERT INTO firms VALUES
(1,  'Growmore Research and Asset Management', 'Harshad Shantilal Mehta', 1984, 'Bombay', 'Brokerage and Research Firm', 500000,  1,    TRUE),
(2,  'Growmore Securities Ltd',                'Harshad Shantilal Mehta', 1986, 'Bombay', 'Stock Broking',               1500000, 1,    TRUE),
(3,  'Growmore Capital Pvt Ltd',               'Harshad H. Mehta',        1984, 'Bombay', 'Investment Advisory',         500000,  NULL, FALSE),
(4,  'Pranjpe Brokers',                        'Prasann Pranjpe',         1971, 'Bombay', 'Stock Broking',               300000,  NULL, TRUE),
(5,  'Growmore Research Pvt Ltd',              'Harshad Mehta',           1983, 'Bombay', 'Research Firm',               200000,  NULL, FALSE),
(6,  'Growmore Investments',                   'Ashwin Mehta',            1986, 'Bombay', 'Investment Firm',             800000,  NULL, FALSE),
(7,  'H.S. Mehta and Associates',              'Harshad S. Mehta',        1984, 'Bombay', 'Stock Broking',               400000,  NULL, FALSE),
(8,  'Rare Enterprises',                       'Rakesh Jhunjhunwala',     1985, 'Bombay', 'Investment Firm',             100000,  NULL, TRUE),
(9,  'Parekh Capital',                         'Ketan Parekh',            1986, 'Bombay', 'Stock Broking',               600000,  NULL, TRUE),
(10, 'Kotak Securities',                       'Uday Kotak',              1985, 'Bombay', 'Investment Banking',          2000000, NULL, TRUE);


-- ============================================================
-- TABLE 3: mentors
-- ============================================================
DROP TABLE IF EXISTS mentors;

CREATE TABLE mentors (
    mentor_id    INT PRIMARY KEY,
    character_id INT,
    mentor_name  VARCHAR(100),
    mentor_firm  VARCHAR(150),
    relationship VARCHAR(100),
    year_met     INT,
    taught_skill VARCHAR(200),
    is_real      BOOLEAN
);

-- Noise: loop-generate 30 fake mentor records
INSERT INTO mentors (
    mentor_id, character_id, mentor_name, mentor_firm,
    relationship, year_met, taught_skill, is_real
)
SELECT
    n + 10,
    CASE WHEN n % 3 = 0 THEN 2 ELSE 3 END,
    'Mentor Name ' || n,
    'Mentor Firm ' || n,
    'Colleague',
    1978 + (n % 8),
    'Generic trading skill ' || n,
    FALSE
FROM generate_series(1, 30) AS s(n);

-- Hard insert real mentor records
INSERT INTO mentors VALUES
(1,  1, 'Prasann Pranjpe',    'Pranjpe Brokers',     'Senior Broker — Guided Harshad on BSE floor',  1980, 'Jobbing, BSE floor operations, client handling',  TRUE),
(2,  1, 'P.D. Shukla',        'Shukla Investments',  'Introduced him to bond markets',               1982, 'Government securities, bond trading basics',      FALSE),
(3,  1, 'Kantilal Mehta',     'Kantilal Mehta Shares','Senior BSE member who vouched for him',       1983, 'BSE membership process, ready forward deals',     FALSE),
(4,  1, 'Mahesh Desai',       'Desai Securities',    'Early colleague on BSE floor',                 1981, 'Equity research, client acquisition',             FALSE),
(5,  1, 'Deepak Parekh',      'HDFC Securities',     'Rumored early mentor — not confirmed',         1985, 'Institutional broking',                           FALSE),
(6,  2, 'Arvind Johari',      'Johari Trading Co.',  'Colleague',                                    1982, 'Day trading techniques',                          FALSE),
(7,  1, 'Prasann Pranjpe',    'Pranjpe Brokers',     'Primary mentor and guide on BSE floor',        1981, 'Ready Forward deals, inter-bank markets',         TRUE),
(8,  3, 'Dilip Sanghvi',      'Sanghvi Capital',     'Peer learning',                                1983, 'Derivatives basics',                              FALSE),
(9,  1, 'Self-taught',        'Bombay Libraries',    'Read market books and newspapers obsessively', 1979, 'Fundamental analysis, economic policy reading',   TRUE),
(10, 1, 'P.V. Narasimha Rao', 'Government of India', 'Political patron — much later connection',     1991, 'Political nexus, market liberalization advantage',FALSE);


-- ============================================================
-- TABLE 4: stock_trades_early
-- ============================================================
DROP TABLE IF EXISTS stock_trades_early;

CREATE TABLE stock_trades_early (
    trade_id        INT PRIMARY KEY,
    broker_id       INT,
    stock_name      VARCHAR(100),
    trade_type      VARCHAR(10),
    quantity        INT,
    price_per_share DECIMAL(10,2),
    trade_year      INT,
    trade_month     INT,
    profit_loss     DECIMAL(12,2),
    is_harshad      BOOLEAN
);

-- Noise: loop-generate 100 fake trade rows from other brokers
INSERT INTO stock_trades_early (
    trade_id, broker_id, stock_name, trade_type,
    quantity, price_per_share, trade_year, trade_month,
    profit_loss, is_harshad
)
SELECT
    n + 40,
    -- random broker IDs from noise pool, never 1
    CASE WHEN n % 10 = 0 THEN 41
         WHEN n % 10 = 1 THEN 54
         WHEN n % 10 = 2 THEN 67
         WHEN n % 10 = 3 THEN 72
         WHEN n % 10 = 4 THEN 77
         WHEN n % 10 = 5 THEN 80
         WHEN n % 10 = 6 THEN 83
         WHEN n % 10 = 7 THEN 85
         WHEN n % 10 = 8 THEN 89
         ELSE 97 END,
    CASE WHEN n % 7 = 0 THEN 'ACC Cement'
         WHEN n % 7 = 1 THEN 'Reliance Industries'
         WHEN n % 7 = 2 THEN 'Tata Steel'
         WHEN n % 7 = 3 THEN 'BHEL'
         WHEN n % 7 = 4 THEN 'Hindustan Unilever'
         WHEN n % 7 = 5 THEN 'ONGC'
         ELSE 'Apollo Tyres' END,
    CASE WHEN n % 2 = 0 THEN 'BUY' ELSE 'SELL' END,
    100 + (n * 50),
    ROUND((20 + (n % 100))::NUMERIC, 2),
    1984 + (n % 3),
    1 + (n % 12),
    ROUND(((n % 2) * 2 - 1) * (500 + n * 30)::NUMERIC, 2),
    FALSE
FROM generate_series(1, 100) AS s(n);

-- Hard insert real Harshad trades
INSERT INTO stock_trades_early VALUES
(1,  1, 'ACC Cement',          'BUY',  500,  45.00,  1984, 3,   2250.00,   TRUE),
(2,  1, 'Reliance Industries', 'SELL', 300,  78.50,  1984, 4,   4500.00,   TRUE),
(3,  1, 'Tata Steel',          'BUY',  1000, 32.00,  1984, 5,  -1200.00,   TRUE),
(4,  1, 'Apollo Tyres',        'SELL', 700,  22.75,  1984, 6,   3150.00,   TRUE),
(5,  1, 'State Bank of India', 'BUY',  600,  55.00,  1984, 7,   9000.00,   TRUE),
(6,  1, 'Hindustan Unilever',  'SELL', 250,  120.00, 1984, 8,   5000.00,   TRUE),
(7,  1, 'BHEL',                'BUY',  1200, 28.00,  1984, 9,  -3600.00,   TRUE),
(8,  1, 'ACC Cement',          'SELL', 500,  49.50,  1984, 10,  11250.00,  TRUE),
(9,  1, 'Reliance Industries', 'BUY',  900,  76.00,  1985, 1,   18000.00,  TRUE),
(10, 1, 'Larsen and Toubro',   'SELL', 450,  95.00,  1985, 2,   8550.00,   TRUE),
(11, 1, 'BHEL',                'SELL', 1200, 31.00,  1985, 3,   3600.00,   TRUE),
(12, 1, 'Tata Motors',         'BUY',  800,  42.00,  1985, 4,  -800.00,    TRUE),
(13, 1, 'ONGC',                'BUY',  2000, 18.00,  1985, 5,   36000.00,  TRUE),
(14, 1, 'ACC Cement',          'BUY',  1500, 52.00,  1985, 6,   22500.00,  TRUE),
(15, 1, 'Tata Steel',          'BUY',  2000, 33.00,  1985, 7,   40000.00,  TRUE),
(16, 1, 'Larsen and Toubro',   'BUY',  1000, 88.00,  1985, 8,   15000.00,  TRUE),
(17, 1, 'Hindustan Unilever',  'BUY',  700,  118.00, 1985, 9,   14000.00,  TRUE),
(18, 1, 'ONGC',                'SELL', 2000, 21.50,  1985, 11,  70000.00,  TRUE),
(19, 1, 'SBI',                 'BUY',  3000, 58.00,  1986, 1,   90000.00,  TRUE),
(20, 1, 'Reliance Industries', 'SELL', 900,  92.00,  1986, 2,   144000.00, TRUE),
(21, 1, 'ACC Cement',          'SELL', 1500, 61.00,  1986, 3,   135000.00, TRUE),
(22, 1, 'Tata Steel',          'SELL', 2000, 38.00,  1986, 4,   100000.00, TRUE),
(23, 1, 'BHEL',                'BUY',  2500, 30.00,  1986, 5,   75000.00,  TRUE),
(24, 1, 'Apollo Tyres',        'BUY',  3000, 25.00,  1986, 6,   90000.00,  TRUE),
(25, 1, 'ONGC',                'BUY',  4000, 22.00,  1986, 7,   160000.00, TRUE),
(26, 1, 'Hindustan Unilever',  'SELL', 700,  135.00, 1986, 8,   119000.00, TRUE),
(27, 1, 'Reliance Industries', 'BUY',  2000, 89.00,  1986, 9,   220000.00, TRUE);


-- ============================================================
-- TABLE 5: personal_milestones
-- ============================================================
DROP TABLE IF EXISTS personal_milestones;

CREATE TABLE personal_milestones (
    milestone_id INT PRIMARY KEY,
    character_id INT,
    event        VARCHAR(200),
    event_year   INT,
    event_city   VARCHAR(50),
    significance VARCHAR(300),
    is_real      BOOLEAN
);

-- Noise: loop-generate 20 fake milestone records
INSERT INTO personal_milestones (
    milestone_id, character_id, event, event_year,
    event_city, significance, is_real
)
SELECT
    n + 15,
    1,
    'Unconfirmed Event No.' || n || ' — rumored activity',
    1980 + (n % 7),
    CASE WHEN n % 3 = 0 THEN 'Delhi'
         WHEN n % 3 = 1 THEN 'Pune'
         ELSE 'Bombay' END,
    'No verified source — planted record',
    FALSE
FROM generate_series(1, 20) AS s(n);

-- Hard insert real milestones
INSERT INTO personal_milestones VALUES
(1,  1, 'Joined New India Assurance Company as sales agent',    1980, 'Bombay', 'First stable job that exposed him to finance world',           TRUE),
(2,  1, 'Started working as Sub-Broker under Prasann Pranjpe',  1981, 'Bombay', 'Entry into BSE floor — the turning point of his life',        TRUE),
(3,  1, 'Married Jyoti Mehta',                                  1984, 'Bombay', 'Personal anchor through his rise and fall',                    TRUE),
(4,  1, 'Registered Growmore Research and Asset Management',     1984, 'Bombay', 'First firm — beginning of the Harshad Mehta empire',          TRUE),
(5,  1, 'Became Full BSE Member',                               1984, 'Bombay', 'Official seat on BSE — gave him direct market access',        TRUE),
(6,  1, 'Born son Atur Mehta',                                  1986, 'Bombay', 'First child born during early rise phase',                     TRUE),
(7,  1, 'Completed MBA from NMIMS',                             1982, 'Bombay', 'Rumored higher education — not confirmed',                     FALSE),
(8,  1, 'Won BSE Best Broker Award',                            1985, 'Bombay', 'Planted record — no such award existed',                       FALSE),
(9,  1, 'Married Jyoti Shah (first marriage)',                  1980, 'Bombay', 'False record — his wife was always Jyoti Mehta',              FALSE),
(10, 1, 'Launched first stock market newsletter',                1983, 'Bombay', 'Rumored activity — not confirmed in official records',        FALSE),
(11, 1, 'Moved to Worli Sea Face apartment',                    1986, 'Bombay', 'Early sign of rising wealth — partial confirmation',          FALSE),
(12, 1, 'Started Growmore Securities Ltd',                      1986, 'Bombay', 'Second firm — expanded operations from research to broking',   TRUE),
(13, 1, 'Quit New India Assurance Company',                     1981, 'Bombay', 'Left insurance job to pursue BSE full time',                   TRUE),
(14, 1, 'Purchased first property in Bombay',                   1985, 'Bombay', 'Rumored — exact year unconfirmed',                            FALSE),
(15, 1, 'First crore earned from stock market',                 1986, 'Bombay', 'Approximate milestone — marks end of Chapter 2 era',          TRUE);

-- ============================================================
-- CHAPTER 3: "The Money Machine" (1986 - 1991)
-- ============================================================


-- ============================================================
-- TABLE 1: banks
-- ============================================================
DROP TABLE IF EXISTS banks;

CREATE TABLE banks (
    bank_id      INT PRIMARY KEY,
    bank_name    VARCHAR(150),
    bank_type    VARCHAR(50),
    city         VARCHAR(50),
    was_involved BOOLEAN,
    involvement  VARCHAR(200)
);

-- Noise: loop-generate 60 fake banks
INSERT INTO banks (
    bank_id, bank_name, bank_type, city, was_involved, involvement
)
SELECT
    n,
    'National Bank No.' || n,
    CASE WHEN n % 3 = 0 THEN 'Public'
         WHEN n % 3 = 1 THEN 'Private'
         ELSE 'Cooperative' END,
    CASE WHEN n % 5 = 0 THEN 'Delhi'
         WHEN n % 5 = 1 THEN 'Bombay'
         WHEN n % 5 = 2 THEN 'Calcutta'
         WHEN n % 5 = 3 THEN 'Chennai'
         ELSE 'Pune' END,
    FALSE,
    'No direct involvement in scam'
FROM generate_series(1, 60) AS s(n);

-- Hard insert real banks
INSERT INTO banks VALUES
(61, 'State Bank of India',     'Public',      'Bombay', TRUE,  'Primary channel for RF deals — funneled crores into stock market'),
(62, 'National Housing Bank',   'Public',      'Delhi',  TRUE,  'Issued fake BRs worth 1200 crore — key instrument of scam'),
(63, 'ANZ Grindlays Bank',      'Foreign',     'Bombay', TRUE,  'Foreign bank used for inter-bank routing of fake BRs'),
(64, 'Citibank India',          'Foreign',     'Bombay', TRUE,  'Brokers Pallav Sheth and Ajay Kayan operated through this bank'),
(65, 'Bank of Karad',           'Private',     'Bombay', TRUE,  'Issued BRs without backing securities — later liquidated'),
(66, 'Metropolitan Co-op Bank', 'Cooperative', 'Bombay', TRUE,  'Smaller bank used as a pass-through for fake BR transactions'),
(67, 'Standard Chartered Bank', 'Foreign',     'Bombay', FALSE, 'Investigated but not found directly involved'),
(68, 'Bank of Baroda',          'Public',      'Bombay', FALSE, 'Had exposure but not a primary participant'),
(69, 'Punjab National Bank',    'Public',      'Delhi',  FALSE, 'Peripheral exposure through interbank market'),
(70, 'Canara Bank',             'Public',      'Bombay', FALSE, 'Held some BRs unknowingly through secondary market');


-- ============================================================
-- TABLE 2: bank_receipts
-- ============================================================
DROP TABLE IF EXISTS bank_receipts;

CREATE TABLE bank_receipts (
    br_id        INT PRIMARY KEY,
    bank_id      INT,
    br_number    VARCHAR(50),
    issued_date  DATE,
    amount_crore DECIMAL(10,2),
    backed_by    VARCHAR(200),
    is_fake      BOOLEAN,
    broker_id    INT,
    status       VARCHAR(50)
);

-- Noise: loop-generate 150 legitimate BR records
INSERT INTO bank_receipts (
    br_id, bank_id, br_number, issued_date,
    amount_crore, backed_by, is_fake, broker_id, status
)
SELECT
    n,
    (n % 10) + 61,
    'BR-LEG-' || LPAD(n::TEXT, 5, '0'),
    '1987-01-01'::DATE + (n * 7 || ' days')::INTERVAL,
    ROUND((10 + (n % 90))::NUMERIC, 2),
    'Government Securities — verified',
    FALSE,
    NULL,
    'Settled'
FROM generate_series(1, 150) AS s(n);

-- Hard insert real fake BRs
INSERT INTO bank_receipts VALUES
(151, 62, 'BR-NHB-1991-001',  '1991-01-15', 600.00, 'NO BACKING — securities never existed',          TRUE, 1, 'Unpaid'),
(152, 62, 'BR-NHB-1991-002',  '1991-02-10', 500.00, 'NO BACKING — fake government securities',        TRUE, 1, 'Unpaid'),
(153, 65, 'BR-BOK-1991-001',  '1991-01-20', 300.00, 'NO BACKING — Bank of Karad issued fraudulently', TRUE, 1, 'Unpaid'),
(154, 65, 'BR-BOK-1991-002',  '1991-03-05', 250.00, 'NO BACKING — recycled BR number',                TRUE, 1, 'Unpaid'),
(155, 63, 'BR-ANZ-1991-001',  '1991-02-28', 450.00, 'NO BACKING — routed through ANZ Grindlays',      TRUE, 1, 'Unpaid'),
(156, 61, 'BR-SBI-1991-001',  '1991-01-05', 500.00, 'Partial backing — SBI internal misuse',          TRUE, 1, 'Unpaid'),
(157, 64, 'BR-CITI-1991-001', '1991-03-15', 200.00, 'NO BACKING — Citibank broker network',           TRUE, 1, 'Unpaid'),
(158, 66, 'BR-MCB-1991-001',  '1991-02-01', 175.00, 'NO BACKING — Metro Coop Bank fake issuance',     TRUE, 1, 'Unpaid'),
(159, 62, 'BR-NHB-1991-003',  '1991-03-20', 400.00, 'NO BACKING — third NHB fake BR batch',           TRUE, 1, 'Unpaid'),
(160, 65, 'BR-BOK-1991-003',  '1991-04-01', 320.00, 'NO BACKING — Bank of Karad final batch',         TRUE, 1, 'Unpaid');


-- ============================================================
-- TABLE 3: rf_deals
-- ============================================================
DROP TABLE IF EXISTS rf_deals;

CREATE TABLE rf_deals (
    deal_id        INT PRIMARY KEY,
    bank_id        INT,
    broker_id      INT,
    deal_date      DATE,
    deal_amount_cr DECIMAL(10,2),
    interest_rate  DECIMAL(5,2),
    duration_days  INT,
    securities_used VARCHAR(200),
    diverted_to    VARCHAR(100),
    is_fraudulent  BOOLEAN
);

-- Noise: loop-generate 80 legitimate RF deals
INSERT INTO rf_deals (
    deal_id, bank_id, broker_id, deal_date,
    deal_amount_cr, interest_rate, duration_days,
    securities_used, diverted_to, is_fraudulent
)
SELECT
    n,
    (n % 10) + 61,
    NULL,
    '1987-06-01'::DATE + (n * 11 || ' days')::INTERVAL,
    ROUND((50 + (n % 200))::NUMERIC, 2),
    ROUND((8.5 + (n % 4) * 0.5)::NUMERIC, 2),
    CASE WHEN n % 3 = 0 THEN 14
         WHEN n % 3 = 1 THEN 7
         ELSE 21 END,
    'Genuine Government Securities',
    NULL,
    FALSE
FROM generate_series(1, 80) AS s(n);

-- Hard insert real fraudulent RF deals
INSERT INTO rf_deals VALUES
(81, 61, 1, '1990-04-10', 500.00, 11.50, 14, 'Fake BR-NHB backed',       'BSE Stock Market',  TRUE),
(82, 62, 1, '1990-06-15', 600.00, 12.00, 14, 'Fake BR-NHB backed',       'BSE Stock Market',  TRUE),
(83, 63, 1, '1990-08-20', 450.00, 11.00, 21, 'Fake BR-ANZ backed',       'BSE Stock Market',  TRUE),
(84, 65, 1, '1990-10-05', 300.00, 10.50,  7, 'Fake BR-BOK backed',       'ACC Cement Stocks', TRUE),
(85, 61, 1, '1990-12-01', 700.00, 12.50, 14, 'Fake BR-SBI internal',     'BSE Stock Market',  TRUE),
(86, 62, 1, '1991-01-10', 800.00, 13.00, 14, 'Fake BR-NHB 2nd batch',    'ACC Cement Stocks', TRUE),
(87, 64, 1, '1991-01-25', 200.00, 11.75,  7, 'Fake BR-Citibank network', 'BSE Stock Market',  TRUE),
(88, 65, 1, '1991-02-14', 350.00, 10.00, 21, 'Fake BR-BOK 2nd batch',    'Reliance Stocks',   TRUE),
(89, 66, 1, '1991-03-01', 175.00, 11.25, 14, 'Fake BR-Metro Coop',       'BSE Stock Market',  TRUE),
(90, 62, 1, '1991-03-18', 900.00, 13.50, 14, 'Fake BR-NHB final batch',  'ACC Cement Stocks', TRUE);


-- ============================================================
-- TABLE 4: associates
-- ============================================================
DROP TABLE IF EXISTS associates;

CREATE TABLE associates (
    associate_id   INT PRIMARY KEY,
    character_id   INT,
    associate_name VARCHAR(100),
    role           VARCHAR(150),
    organisation   VARCHAR(150),
    year_connected INT,
    is_real        BOOLEAN
);

-- Noise: loop-generate 50 fake associates
INSERT INTO associates (
    associate_id, character_id, associate_name, role,
    organisation, year_connected, is_real
)
SELECT
    n,
    1,
    'Associate Name ' || n,
    CASE WHEN n % 4 = 0 THEN 'Sub Broker'
         WHEN n % 4 = 1 THEN 'Accountant'
         WHEN n % 4 = 2 THEN 'Bank Manager'
         ELSE 'Investor' END,
    'Dummy Firm ' || n,
    1987 + (n % 5),
    FALSE
FROM generate_series(1, 50) AS s(n);

-- Hard insert real associates
INSERT INTO associates VALUES
(51, 1, 'Pallav Sheth',       'Key Broker — operated Citibank BR channel',    'Citibank India',                   1989, TRUE),
(52, 1, 'Ajay Kayan',         'Key Broker — co-operated Citibank BR network', 'Citibank India',                   1989, TRUE),
(53, 1, 'Bhupen Dalal',       'Chartered Accountant — managed books',         'Self Employed',                    1986, TRUE),
(54, 1, 'Ashwin Mehta',       'Brother — managed Growmore operations',        'Growmore Research',                1984, TRUE),
(55, 1, 'Sudhir Mehta',       'Brother — handled client accounts',            'Growmore Research',                1984, TRUE),
(56, 1, 'S.K. Basu',          'SBI Officer — facilitated RF deals',           'State Bank of India',              1990, TRUE),
(57, 1, 'R. Sitaraman',       'NHB Officer — issued fake BRs',                'National Housing Bank',            1990, TRUE),
(58, 1, 'Madhavpura Bank MD', 'Cooperative Bank Head — pass-through channel', 'Madhavpura Mercantile Co-op Bank', 1991, TRUE),
(59, 1, 'Aditya Birla',       'Industrialist — rumored beneficiary of boom',  'Aditya Birla Group',               1991, FALSE),
(60, 1, 'Hemendra Kothari',   'Investment banker — peripheral connection',    'DSP Merrill Lynch',                1991, FALSE);


-- ============================================================
-- TABLE 5: lifestyle
-- ============================================================
DROP TABLE IF EXISTS lifestyle;

CREATE TABLE lifestyle (
    asset_id        INT PRIMARY KEY,
    character_id    INT,
    asset_type      VARCHAR(100),
    asset_name      VARCHAR(200),
    acquired_year   INT,
    estimated_value BIGINT,
    city            VARCHAR(50),
    is_real         BOOLEAN
);

-- Noise: loop-generate 20 fake assets
INSERT INTO lifestyle (
    asset_id, character_id, asset_type, asset_name,
    acquired_year, estimated_value, city, is_real
)
SELECT
    n + 15,
    1,
    CASE WHEN n % 4 = 0 THEN 'Apartment'
         WHEN n % 4 = 1 THEN 'Car'
         WHEN n % 4 = 2 THEN 'Office'
         ELSE 'Property' END,
    'Unverified Asset No.' || n || ' — rumored acquisition',
    1988 + (n % 4),
    5000000 + (n * 1000000),
    CASE WHEN n % 3 = 0 THEN 'Delhi'
         WHEN n % 3 = 1 THEN 'Pune'
         ELSE 'Bombay' END,
    FALSE
FROM generate_series(1, 20) AS s(n);

-- Hard insert real assets
INSERT INTO lifestyle VALUES
(1,  1, 'Apartment', 'Madhuli Apartment Complex — 15000 sqft penthouse', 1990, 150000000, 'Worli, Bombay', TRUE),
(2,  1, 'Car',       'Toyota Lexus — first one imported into India',      1990, 3500000,   'Bombay',        TRUE),
(3,  1, 'Car',       'Toyota Corolla',                                    1987, 450000,    'Bombay',        TRUE),
(4,  1, 'Office',    'Growmore House — 9 floors, Nariman Point',          1991, 500000000, 'Nariman Point', TRUE),
(5,  1, 'Car',       'Mercedes Benz S-Class',                             1991, 5000000,   'Bombay',        TRUE),
(6,  1, 'Villa',     'Holiday Villa — Goa beachfront',                    1991, 20000000,  'Goa',           FALSE),
(7,  1, 'Jet',       'Private Jet — Cessna 400',                          1991, 80000000,  'Bombay',        FALSE),
(8,  1, 'Apartment', 'Sea View Flat — Cuffe Parade',                      1989, 40000000,  'Cuffe Parade',  FALSE),
(9,  1, 'Car',       'Rolls Royce Silver Shadow',                         1990, 12000000,  'Bombay',        FALSE),
(10, 1, 'Office',    'Branch Office — Delhi',                             1990, 15000000,  'Delhi',         FALSE),
(11, 1, 'Artwork',   'Collection of Raja Ravi Varma paintings',           1991, 25000000,  'Bombay',        TRUE),
(12, 1, 'Car',       'BMW 7 Series',                                      1991, 6000000,   'Bombay',        FALSE),
(13, 1, 'Property',  'Growmore Farmhouse — Alibag',                       1990, 30000000,  'Alibag',        TRUE),
(14, 1, 'Asset',     'Gold reserves — estimated 100kg',                   1991, 150000000, 'Bombay',        FALSE),
(15, 1, 'Apartment', 'Guest House flat — Bandra',                         1989, 18000000,  'Bandra, Bombay',FALSE);
-- ============================================================
-- CHAPTER 4: "The Big Bull" (1991 - April 1992)
-- ============================================================


-- ============================================================
-- TABLE 1: stock_prices
-- ============================================================
DROP TABLE IF EXISTS stock_prices;

CREATE TABLE stock_prices (
    price_id    INT PRIMARY KEY,
    stock_name  VARCHAR(100),
    price_date  DATE,
    open_price  DECIMAL(10,2),
    close_price DECIMAL(10,2),
    volume      BIGINT,
    is_acc      BOOLEAN
);

-- Noise: loop-generate 200 stock price rows for other stocks
INSERT INTO stock_prices (
    price_id, stock_name, price_date,
    open_price, close_price, volume, is_acc
)
SELECT
    n,
    CASE WHEN n % 8 = 0 THEN 'Reliance Industries'
         WHEN n % 8 = 1 THEN 'Tata Steel'
         WHEN n % 8 = 2 THEN 'BHEL'
         WHEN n % 8 = 3 THEN 'Hindustan Unilever'
         WHEN n % 8 = 4 THEN 'ONGC'
         WHEN n % 8 = 5 THEN 'SBI'
         WHEN n % 8 = 6 THEN 'Larsen and Toubro'
         ELSE 'Apollo Tyres' END,
    '1991-01-01'::DATE + (n || ' days')::INTERVAL,
    ROUND((100 + (n % 200))::NUMERIC, 2),
    ROUND((105 + (n % 195))::NUMERIC, 2),
    50000 + (n * 100),
    FALSE
FROM generate_series(1, 200) AS s(n);

-- Hard insert real ACC price journey
INSERT INTO stock_prices VALUES
(201, 'ACC Cement', '1991-01-15', 200.00,  215.00,  120000,  TRUE),
(202, 'ACC Cement', '1991-02-15', 215.00,  280.00,  250000,  TRUE),
(203, 'ACC Cement', '1991-03-15', 280.00,  420.00,  380000,  TRUE),
(204, 'ACC Cement', '1991-04-15', 420.00,  650.00,  510000,  TRUE),
(205, 'ACC Cement', '1991-05-15', 650.00,  900.00,  680000,  TRUE),
(206, 'ACC Cement', '1991-06-15', 900.00,  1350.00, 820000,  TRUE),
(207, 'ACC Cement', '1991-07-15', 1350.00, 1900.00, 950000,  TRUE),
(208, 'ACC Cement', '1991-08-15', 1900.00, 2700.00, 1100000, TRUE),
(209, 'ACC Cement', '1991-09-15', 2700.00, 3500.00, 1350000, TRUE),
(210, 'ACC Cement', '1991-10-15', 3500.00, 4800.00, 1500000, TRUE),
(211, 'ACC Cement', '1991-11-15', 4800.00, 6200.00, 1750000, TRUE),
(212, 'ACC Cement', '1991-12-15', 6200.00, 7500.00, 2000000, TRUE),
(213, 'ACC Cement', '1992-01-15', 7500.00, 8200.00, 2200000, TRUE),
(214, 'ACC Cement', '1992-02-15', 8200.00, 8800.00, 2400000, TRUE),
(215, 'ACC Cement', '1992-03-15', 8800.00, 9000.00, 2500000, TRUE),
(216, 'ACC Cement', '1992-04-15', 9000.00, 4500.00, 3000000, TRUE),
(217, 'ACC Cement', '1992-04-23', 4500.00, 1700.00, 5000000, TRUE),
(218, 'ACC Cement', '1992-04-30', 1700.00, 1200.00, 4000000, TRUE);


-- ============================================================
-- TABLE 2: sensex_index
-- ============================================================
DROP TABLE IF EXISTS sensex_index;

CREATE TABLE sensex_index (
    index_id       INT PRIMARY KEY,
    record_month   VARCHAR(20),
    record_year    INT,
    sensex_value   DECIMAL(10,2),
    monthly_change DECIMAL(8,2),
    is_bull_run    BOOLEAN
);

-- Noise: loop-generate 60 pre-1991 sensex months
INSERT INTO sensex_index (
    index_id, record_month, record_year,
    sensex_value, monthly_change, is_bull_run
)
SELECT
    n,
    CASE (n % 12)
        WHEN 0  THEN 'January'
        WHEN 1  THEN 'February'
        WHEN 2  THEN 'March'
        WHEN 3  THEN 'April'
        WHEN 4  THEN 'May'
        WHEN 5  THEN 'June'
        WHEN 6  THEN 'July'
        WHEN 7  THEN 'August'
        WHEN 8  THEN 'September'
        WHEN 9  THEN 'October'
        WHEN 10 THEN 'November'
        ELSE         'December'
    END,
    1986 + FLOOR((n - 1) / 12)::INT,
    ROUND((600 + (n * 8))::NUMERIC, 2),
    ROUND((-20 + (n % 40))::NUMERIC, 2),
    FALSE
FROM generate_series(1, 60) AS s(n);

-- Hard insert real 1991-1992 Sensex bull run
INSERT INTO sensex_index VALUES
(61, 'January',   1991, 1007.00,   42.00,  TRUE),
(62, 'February',  1991, 1100.00,   93.00,  TRUE),
(63, 'March',     1991, 1340.00,  240.00,  TRUE),
(64, 'April',     1991, 1650.00,  310.00,  TRUE),
(65, 'May',       1991, 1890.00,  240.00,  TRUE),
(66, 'June',      1991, 2100.00,  210.00,  TRUE),
(67, 'July',      1991, 2450.00,  350.00,  TRUE),
(68, 'August',    1991, 2780.00,  330.00,  TRUE),
(69, 'September', 1991, 3100.00,  320.00,  TRUE),
(70, 'October',   1991, 3450.00,  350.00,  TRUE),
(71, 'November',  1991, 3800.00,  350.00,  TRUE),
(72, 'December',  1991, 4100.00,  300.00,  TRUE),
(73, 'January',   1992, 4300.00,  200.00,  TRUE),
(74, 'February',  1992, 4467.00,  167.00,  TRUE),
(75, 'March',     1992, 4500.00,   33.00,  TRUE),
(76, 'April',     1992, 2850.00, -1650.00, FALSE),
(77, 'May',       1992, 2100.00,  -750.00, FALSE),
(78, 'June',      1992, 1980.00,  -120.00, FALSE);


-- ============================================================
-- TABLE 3: political_meetings
-- ============================================================
DROP TABLE IF EXISTS political_meetings;

CREATE TABLE political_meetings (
    meeting_id      INT PRIMARY KEY,
    character_id    INT,
    politician_name VARCHAR(100),
    designation     VARCHAR(150),
    meeting_year    INT,
    meeting_city    VARCHAR(50),
    purpose         VARCHAR(300),
    outcome         VARCHAR(300),
    is_confirmed    BOOLEAN
);

-- Noise: loop-generate 20 fake political meetings
INSERT INTO political_meetings (
    meeting_id, character_id, politician_name, designation,
    meeting_year, meeting_city, purpose, outcome, is_confirmed
)
SELECT
    n + 10,
    1,
    'Politician Name ' || n,
    CASE WHEN n % 4 = 0 THEN 'Member of Parliament'
         WHEN n % 4 = 1 THEN 'State Minister'
         WHEN n % 4 = 2 THEN 'Cabinet Secretary'
         ELSE 'Governor' END,
    1990 + (n % 3),
    CASE WHEN n % 2 = 0 THEN 'Delhi' ELSE 'Bombay' END,
    'Rumored meeting — no official records exist',
    'Unconfirmed — denied by all parties',
    FALSE
FROM generate_series(1, 20) AS s(n);

-- Hard insert real political meetings
INSERT INTO political_meetings VALUES
(1,  1, 'P.V. Narasimha Rao', 'Prime Minister of India', 1991, 'Delhi',  'Harshad claims he was asked to boost stock market to aid forex crisis', 'Allegedly told to pump the market — 1 crore briefcase reported',   TRUE),
(2,  1, 'Manmohan Singh',     'Finance Minister of India',1991, 'Delhi',  'Discussion on market liberalization and capital market reforms',         'No confirmed outcome — Manmohan denied any personal dealings',     FALSE),
(3,  1, 'S.B. Chavan',        'Home Minister of India',   1991, 'Bombay', 'Rumored meeting regarding political protection',                         'Unconfirmed — no records exist',                                   FALSE),
(4,  1, 'P.V. Narasimha Rao', 'Prime Minister of India', 1992, 'Delhi',  'Second alleged meeting — Harshad claims ongoing political backing',      'Disputed — Rao denied meeting Harshad in 1992',                   FALSE),
(5,  1, 'Madhavrao Scindia',  'Minister of Civil Aviation',1991,'Delhi',  'Rumored social meeting at a political gathering',                        'No confirmed business dealings',                                   FALSE),
(6,  1, 'Sharad Pawar',       'Chief Minister of Maharashtra',1990,'Bombay','Rumored business-political nexus meeting',                            'Unconfirmed — denied by both parties',                             FALSE),
(7,  1, 'N.D. Tiwari',        'Governor of Andhra Pradesh',1991,'Bombay', 'Alleged social connection through business circles',                     'No confirmed political outcome',                                   FALSE),
(8,  1, 'Arjun Singh',        'Minister of Human Resources',1991,'Delhi', 'Rumored meeting through common contacts',                               'No record of business discussion',                                 FALSE),
(9,  1, 'P.V. Narasimha Rao', 'Prime Minister of India', 1991, 'Delhi',  'Confirmed meeting in PMO — purpose debated in JPC report',              'JPC investigated this — Rao admitted Harshad visited PMO',        TRUE),
(10, 1, 'Yashwant Sinha',     'Finance Secretary',        1991, 'Delhi',  'Rumored briefing on capital market conditions',                          'Unconfirmed — no JPC evidence',                                   FALSE);


-- ============================================================
-- TABLE 4: media_coverage
-- ============================================================
DROP TABLE IF EXISTS media_coverage;

CREATE TABLE media_coverage (
    article_id    INT PRIMARY KEY,
    publication   VARCHAR(100),
    article_title VARCHAR(300),
    publish_date  DATE,
    journalist    VARCHAR(100),
    tone          VARCHAR(50),
    is_landmark   BOOLEAN
);

-- Noise: loop-generate 80 generic market articles
INSERT INTO media_coverage (
    article_id, publication, article_title,
    publish_date, journalist, tone, is_landmark
)
SELECT
    n,
    CASE WHEN n % 5 = 0 THEN 'Economic Times'
         WHEN n % 5 = 1 THEN 'Financial Express'
         WHEN n % 5 = 2 THEN 'Business Standard'
         WHEN n % 5 = 3 THEN 'Times of India'
         ELSE 'Hindustan Times' END,
    'Market Update Report No.' || n || ' — BSE Activity',
    '1991-01-01'::DATE + (n * 4 || ' days')::INTERVAL,
    'Staff Reporter ' || n,
    CASE WHEN n % 3 = 0 THEN 'Neutral'
         WHEN n % 3 = 1 THEN 'Positive'
         ELSE 'Negative' END,
    FALSE
FROM generate_series(1, 80) AS s(n);

-- Hard insert real landmark articles
INSERT INTO media_coverage VALUES
(81, 'Business Today',     'The Raging Bull — How One Man Moved the Entire Market',     '1992-01-15', 'Sanjay Suri',    'Positive', TRUE),
(82, 'Times of India',     'Harshad Mehta: The Man Who Owns Dalal Street',              '1992-02-10', 'Ramesh Menon',   'Positive', TRUE),
(83, 'The Times of India', 'The Big Bull and His Magic: ACC from 200 to 9000',          '1992-03-20', 'Staff Reporter', 'Positive', TRUE),
(84, 'Times of India',     'Harshad Mehta Exposed: How Banks Were Robbed',              '1992-04-23', 'Sucheta Dalal',  'Negative', TRUE),
(85, 'Indian Express',     'The Scam: Securities Fraud of Unprecedented Scale',         '1992-04-25', 'Sucheta Dalal',  'Negative', TRUE),
(86, 'Business Today',     'The Fall of the Big Bull — What Really Happened',           '1992-05-01', 'Sanjay Suri',    'Negative', TRUE),
(87, 'Economic Times',     'CBI Files Case Against Harshad Mehta',                      '1992-05-05', 'ET Bureau',      'Negative', TRUE),
(88, 'Frontline',          'The 1992 Scam: Political Connections and Bank Failures',    '1992-06-15', 'N. Ram',         'Negative', TRUE),
(89, 'Business Today',     'Sensex Crashes 40 Percent — Retail Investors Wiped Out',   '1992-05-20', 'Staff Reporter', 'Negative', TRUE),
(90, 'India Today',        'Harshad Mehta: Genius, Criminal or Scapegoat?',            '1992-07-01', 'Prabhu Chawla',  'Neutral',  TRUE);


-- ============================================================
-- TABLE 5: investor_activity
-- ============================================================
DROP TABLE IF EXISTS investor_activity;

CREATE TABLE investor_activity (
    activity_id     INT PRIMARY KEY,
    investor_name   VARCHAR(100),
    entry_date      DATE,
    stock_bought    VARCHAR(100),
    amount_invested BIGINT,
    entry_reason    VARCHAR(200),
    profit_loss     DECIMAL(12,2),
    is_retail       BOOLEAN
);

-- Loop-generate 300 retail investor rows
INSERT INTO investor_activity (
    activity_id, investor_name, entry_date, stock_bought,
    amount_invested, entry_reason, profit_loss, is_retail
)
SELECT
    n,
    'Retail Investor ' || n,
    '1991-06-01'::DATE + (n * 2 || ' days')::INTERVAL,
    CASE WHEN n % 5 = 0 THEN 'ACC Cement'
         WHEN n % 5 = 1 THEN 'Reliance Industries'
         WHEN n % 5 = 2 THEN 'Tata Steel'
         WHEN n % 5 = 3 THEN 'SBI'
         ELSE 'BHEL' END,
    10000 + (n * 500),
    'Heard Harshad Mehta is buying — followed the Big Bull',
    CASE WHEN n % 3 = 0 THEN  ROUND((n * 200)::NUMERIC, 2)
         WHEN n % 3 = 1 THEN -ROUND((n * 150)::NUMERIC, 2)
         ELSE                  ROUND((n * 50)::NUMERIC,  2)
    END,
    TRUE
FROM generate_series(1, 300) AS s(n);

-- ============================================================
-- CHAPTER 5: "The Crash" (April 23, 1992)
-- ============================================================


-- ============================================================
-- TABLE 1: cbi_raids
-- Noise: loop-generated fake raid records
-- Real raids hard inserted
-- ============================================================
DROP TABLE IF EXISTS cbi_raids;

CREATE TABLE cbi_raids (
    raid_id         INT PRIMARY KEY,
    raid_date       DATE,
    location        VARCHAR(200),
    raid_type       VARCHAR(100),
    led_by          VARCHAR(100),
    target_name     VARCHAR(100),
    documents_seized BOOLEAN,
    cash_seized_cr  DECIMAL(10,2),
    outcome         VARCHAR(300),
    is_real         BOOLEAN
);

-- Noise: loop-generate 40 fake raid records
INSERT INTO cbi_raids (
    raid_id, raid_date, location, raid_type,
    led_by, target_name, documents_seized,
    cash_seized_cr, outcome, is_real
)
SELECT
    n,
    '1992-05-01'::DATE + (n * 3 || ' days')::INTERVAL,
    'Dummy Office No.' || n || ', Bombay',
    CASE WHEN n % 3 = 0 THEN 'Search and Seizure'
         WHEN n % 3 = 1 THEN 'Arrest Warrant'
         ELSE 'Document Seizure' END,
    'CBI Officer ' || n,
    'Associate Name ' || n,
    CASE WHEN n % 2 = 0 THEN TRUE ELSE FALSE END,
    ROUND((n * 0.5)::NUMERIC, 2),
    'No significant evidence found',
    FALSE
FROM generate_series(1, 40) AS s(n);

-- Hard insert real CBI raids
INSERT INTO cbi_raids VALUES
(41, '1992-04-23', 'Growmore House, Nariman Point, Bombay',        'Search and Seizure',  'CBI Director',      'Harshad Shantilal Mehta', TRUE,  0.00,    'Documents related to BR transactions seized — first raid on Growmore HQ',       TRUE),
(42, '1992-04-24', 'Madhuli Apartment, Worli, Bombay',             'Search and Seizure',  'CBI Joint Director','Harshad Shantilal Mehta', TRUE,  1.20,    'Cash and property documents seized from Harshad penthouse',                     TRUE),
(43, '1992-04-25', 'Bank of Karad, Fort Branch, Bombay',           'Document Seizure',    'CBI Officer',       'Bank of Karad MD',        TRUE,  0.00,    'Fake BR ledgers seized — confirmed no backing securities existed',              TRUE),
(44, '1992-04-26', 'National Housing Bank, Delhi HQ',              'Document Seizure',    'CBI Director',      'R. Sitaraman',            TRUE,  0.00,    'NHB internal records seized — Sitaraman later arrested',                        TRUE),
(45, '1992-04-28', 'Growmore Securities, Nariman Point',           'Arrest Warrant',      'CBI Joint Director','Ashwin Mehta',            TRUE,  0.50,    'Harshad brother Ashwin Mehta detained for questioning',                         TRUE),
(46, '1992-05-04', 'Harshad Mehta Residence, Worli',               'Arrest',              'CBI Director',      'Harshad Shantilal Mehta', FALSE, 0.00,    'Harshad Mehta formally arrested — taken to CBI custody',                        TRUE),
(47, '1992-05-05', 'Citibank India, Nariman Point Branch',         'Document Seizure',    'CBI Officer',       'Pallav Sheth',            TRUE,  0.00,    'Citibank broker network documents seized — Pallav Sheth questioned',            TRUE),
(48, '1992-05-06', 'Metropolitan Co-op Bank, Bombay',              'Search and Seizure',  'CBI Officer',       'Metro Coop Bank MD',      TRUE,  0.30,    'Pass-through BR records found — bank later placed under RBI watch',             TRUE),
(49, '1992-05-10', 'ANZ Grindlays Bank, Bombay',                   'Document Seizure',    'CBI Joint Director','ANZ Branch Manager',      TRUE,  0.00,    'Inter-bank routing documents seized — foreign bank involvement confirmed',       TRUE),
(50, '1992-05-15', 'SBI Securities Division, Bombay',              'Document Seizure',    'CBI Director',      'S.K. Basu',               TRUE,  0.00,    'SBI officer S.K. Basu suspended — RF deal records handed to CBI',              TRUE);


-- ============================================================
-- TABLE 2: seized_assets
-- Noise: loop-generated fake seized items
-- Real seizures hard inserted
-- ============================================================
DROP TABLE IF EXISTS seized_assets;

CREATE TABLE seized_assets (
    asset_id          INT PRIMARY KEY,
    raid_id           INT,
    asset_type        VARCHAR(100),
    asset_description VARCHAR(300),
    estimated_value   BIGINT,
    seized_date       DATE,
    current_status    VARCHAR(150),
    is_real           BOOLEAN
);

-- Noise: loop-generate 30 fake seized asset records
INSERT INTO seized_assets (
    asset_id, raid_id, asset_type, asset_description,
    estimated_value, seized_date, current_status, is_real
)
SELECT
    n,
    (n % 10) + 41,
    CASE WHEN n % 4 = 0 THEN 'Document'
         WHEN n % 4 = 1 THEN 'Cash'
         WHEN n % 4 = 2 THEN 'Property'
         ELSE 'Vehicle' END,
    'Unverified seized item No.' || n,
    500000 + (n * 100000),
    '1992-05-01'::DATE + (n * 2 || ' days')::INTERVAL,
    'Under court hold',
    FALSE
FROM generate_series(1, 30) AS s(n);

-- Hard insert real seized assets
INSERT INTO seized_assets VALUES
(31, 41, 'Documents',   'BR transaction ledgers — 14 files of fake bank receipt records',        0,          '1992-04-23', 'Submitted as court evidence — Exhibit A',              TRUE),
(32, 42, 'Cash',        'Cash found at Madhuli apartment — unaccounted',                          12000000,   '1992-04-24', 'Attached to CBI chargesheet',                          TRUE),
(33, 42, 'Property',    'Madhuli apartment 15000 sqft penthouse — Worli',                         150000000,  '1992-04-24', 'Frozen by court order — not released until 2001',      TRUE),
(34, 43, 'Documents',   'Bank of Karad fake BR register — 300+ entries with no backing',          0,          '1992-04-25', 'Primary evidence in Bank of Karad liquidation case',   TRUE),
(35, 44, 'Documents',   'NHB internal approval notes for unsecured BRs',                          0,          '1992-04-26', 'Evidence in criminal case against R. Sitaraman',       TRUE),
(36, 46, 'Vehicle',     'Toyota Lexus — first imported unit in India',                            3500000,    '1992-05-04', 'Auctioned by court — proceeds to bank recovery fund',  TRUE),
(37, 46, 'Vehicle',     'Mercedes Benz S-Class',                                                  5000000,    '1992-05-04', 'Auctioned by court',                                   TRUE),
(38, 41, 'Documents',   'Growmore internal trading logs — RF deal routing records',               0,          '1992-04-23', 'Submitted as court evidence — Exhibit B',              TRUE),
(39, 42, 'Artwork',     'Raja Ravi Varma painting collection — 7 pieces',                         25000000,   '1992-04-24', 'Stored in court custody — ownership disputed',         TRUE),
(40, 41, 'Property',    'Growmore House 9-floor office Nariman Point — sealed by CBI',            500000000,  '1992-04-23', 'Sealed April 23 — unsealed only after court order',    TRUE);


-- ============================================================
-- TABLE 3: market_crash_impact
-- Noise: loop-generated minor crash records
-- Real catastrophic impact days hard inserted
-- ============================================================
DROP TABLE IF EXISTS market_crash_impact;

CREATE TABLE market_crash_impact (
    impact_id         INT PRIMARY KEY,
    impact_date       DATE,
    sensex_open       DECIMAL(10,2),
    sensex_close      DECIMAL(10,2),
    points_fallen     DECIMAL(10,2),
    pct_fall          DECIMAL(5,2),
    stocks_hit        VARCHAR(300),
    retail_panic_level VARCHAR(50),
    is_black_day      BOOLEAN
);

-- Noise: loop-generate 30 minor market dip records
INSERT INTO market_crash_impact (
    impact_id, impact_date, sensex_open, sensex_close,
    points_fallen, pct_fall, stocks_hit,
    retail_panic_level, is_black_day
)
SELECT
    n,
    '1992-01-01'::DATE + (n * 5 || ' days')::INTERVAL,
    ROUND((4000 + (n % 300))::NUMERIC, 2),
    ROUND((3950 + (n % 290))::NUMERIC, 2),
    ROUND((n % 80)::NUMERIC, 2),
    ROUND((n % 3)::NUMERIC, 2),
    'Minor correction across sector stocks',
    'Low',
    FALSE
FROM generate_series(1, 30) AS s(n);

-- Hard insert real crash days
INSERT INTO market_crash_impact VALUES
(31, '1992-04-23', 4467.00, 3900.00,  567.00,  12.69, 'ACC, Reliance, SBI, Tata Steel — across board selloff',              'Extreme',  TRUE),
(32, '1992-04-24', 3900.00, 3350.00,  550.00,  14.10, 'ACC, BHEL, HUL, L&T — second wave panic selling',                    'Extreme',  TRUE),
(33, '1992-04-27', 3350.00, 3050.00,  300.00,  8.96,  'Banking stocks, ONGC, Apollo — continued selloff',                   'High',     TRUE),
(34, '1992-04-28', 3050.00, 2850.00,  200.00,  6.56,  'Broad market — mutual fund redemptions trigger further fall',         'High',     TRUE),
(35, '1992-05-01', 2850.00, 2600.00,  250.00,  8.77,  'ACC hits 1700 — retail investors realize full extent of loss',        'Extreme',  TRUE),
(36, '1992-05-05', 2600.00, 2400.00,  200.00,  7.69,  'Post-arrest panic — Harshad formally arrested today',                'Extreme',  TRUE),
(37, '1992-05-15', 2400.00, 2200.00,  200.00,  8.33,  'JPC announcement triggers further institutional selling',             'High',     TRUE),
(38, '1992-06-01', 2200.00, 2050.00,  150.00,  6.82,  'Market finds partial floor — slow bleed continues',                  'Medium',   TRUE),
(39, '1992-06-15', 2050.00, 1980.00,   70.00,  3.41,  'Bottom forming — ACC stabilizes near 1200',                          'Low',      TRUE),
(40, '1992-04-23', 9000.00, 1700.00, 7300.00,  81.11, 'ACC CEMENT ONLY — single stock catastrophic collapse in one session', 'Extreme',  TRUE);


-- ============================================================
-- TABLE 4: bank_losses
-- Noise: loop-generated minor bank exposure records
-- Real catastrophic bank losses hard inserted
-- ============================================================
DROP TABLE IF EXISTS bank_losses;

CREATE TABLE bank_losses (
    loss_id           INT PRIMARY KEY,
    bank_id           INT,
    loss_amount_cr    DECIMAL(12,2),
    loss_type         VARCHAR(150),
    recovery_possible BOOLEAN,
    bank_status_after VARCHAR(200),
    is_real           BOOLEAN
);

-- Noise: loop-generate 20 minor bank exposure records
INSERT INTO bank_losses (
    loss_id, bank_id, loss_amount_cr, loss_type,
    recovery_possible, bank_status_after, is_real
)
SELECT
    n,
    (n % 10) + 61,
    ROUND((5 + n * 2)::NUMERIC, 2),
    'Minor interbank exposure',
    TRUE,
    'Continued operations with minor write-off',
    FALSE
FROM generate_series(1, 20) AS s(n);

-- Hard insert real bank losses
INSERT INTO bank_losses VALUES
(21, 62, 1200.00, 'Fake BRs issued — full amount unrecoverable',          FALSE, 'NHB placed under RBI supervision — MD arrested',                         TRUE),
(22, 65, 900.00,  'Fake BRs — no backing securities — total default',      FALSE, 'Bank of Karad liquidated — licence cancelled by RBI',                    TRUE),
(23, 61, 500.00,  'RF deals diverted — SBI internal officer complicity',   TRUE,  'SBI wrote off partial amount — officer S.K. Basu arrested',              TRUE),
(24, 63, 450.00,  'Fake BRs routed through ANZ Grindlays network',         TRUE,  'ANZ recovered partial amount — branch operations reviewed',              TRUE),
(25, 64, 200.00,  'Citibank broker network exposure — Pallav Sheth deals', TRUE,  'Citibank distanced from brokers — Pallav Sheth case filed',              TRUE),
(26, 66, 175.00,  'Pass-through BR transactions — Metro Coop Bank',        FALSE, 'Metropolitan Co-op Bank placed under RBI moratorium',                    TRUE),
(27, 61, 300.00,  'Additional SBI exposure through secondary RF market',   TRUE,  'Recovered through government backstop — taxpayer funded',                TRUE),
(28, 62, 400.00,  'Third batch NHB fake BRs — March 1991 issuance',        FALSE, 'Written off — added to NHB total loss of 1200 crore',                    TRUE),
(29, 65, 320.00,  'Bank of Karad final BR batch — April 1991',             FALSE, 'Part of total Bank of Karad default — included in liquidation',          TRUE),
(30, 61, 200.00,  'SBI securities division — final RF deal exposure',      TRUE,  'Partially recovered — SBI internal audit ordered by RBI',                TRUE);


-- ============================================================
-- TABLE 5: public_reaction
-- Noise: loop-generated generic public sentiment rows
-- Real documented reactions hard inserted
-- ============================================================
DROP TABLE IF EXISTS public_reaction;

CREATE TABLE public_reaction (
    reaction_id       INT PRIMARY KEY,
    reaction_date     DATE,
    reaction_type     VARCHAR(100),
    source            VARCHAR(150),
    description       VARCHAR(300),
    city              VARCHAR(50),
    sentiment         VARCHAR(50),
    is_documented     BOOLEAN
);

-- Noise: loop-generate 40 generic public reaction records
INSERT INTO public_reaction (
    reaction_id, reaction_date, reaction_type, source,
    description, city, sentiment, is_documented
)
SELECT
    n,
    '1992-04-23'::DATE + (n * 2 || ' days')::INTERVAL,
    CASE WHEN n % 4 = 0 THEN 'Investor Protest'
         WHEN n % 4 = 1 THEN 'Media Report'
         WHEN n % 4 = 2 THEN 'Public Statement'
         ELSE 'Market Rumour' END,
    'Unknown Source ' || n,
    'Generic public reaction No.' || n || ' — unverified account',
    CASE WHEN n % 3 = 0 THEN 'Delhi'
         WHEN n % 3 = 1 THEN 'Bombay'
         ELSE 'Calcutta' END,
    CASE WHEN n % 2 = 0 THEN 'Angry' ELSE 'Fearful' END,
    FALSE
FROM generate_series(1, 40) AS s(n);

-- Hard insert real documented reactions
INSERT INTO public_reaction VALUES
(41, '1992-04-23', 'Media Explosion',      'Times of India / Indian Express',  'Sucheta Dalal article published — within hours both papers run front page coverage of securities fraud',               'Bombay',   'Shock',         TRUE),
(42, '1992-04-24', 'Investor Panic',       'BSE Trading Floor',                'BSE trading halted twice — investors queue outside broker offices demanding to sell at any price',                    'Bombay',   'Panic',         TRUE),
(43, '1992-04-25', 'Parliament Uproar',    'Lok Sabha',                        'Opposition demands immediate JPC inquiry — Finance Minister Manmohan Singh faces questions in parliament',            'Delhi',    'Angry',         TRUE),
(44, '1992-04-26', 'Street Protests',      'Dalal Street, Bombay',             'Retail investors march on Dalal Street — banners read WHERE IS OUR MONEY — police deployed',                         'Bombay',   'Angry',         TRUE),
(45, '1992-04-28', 'RBI Statement',        'Reserve Bank of India',            'RBI Governor issues statement — admits RF deal system had regulatory gaps — promises reform',                         'Bombay',   'Defensive',     TRUE),
(46, '1992-05-04', 'Arrest Coverage',      'All National Newspapers',          'Harshad Mehta arrest on front page of every major newspaper — TV channels run continuous coverage',                  'National', 'Shock',         TRUE),
(47, '1992-05-10', 'Harshad Press Meet',   'Harshad Mehta Personal Statement', 'Harshad holds press conference — claims he was asked by PM Narasimha Rao to boost market — drops political bombshell','Bombay',  'Defiant',       TRUE),
(48, '1992-05-15', 'JPC Announcement',     'Parliament of India',              'Joint Parliamentary Committee formally constituted to investigate 1992 securities scam',                              'Delhi',    'Political',     TRUE),
(49, '1992-06-01', 'Sucheta Dalal Book',   'Sucheta Dalal and Debashis Basu',  'Authors begin work on The Scam — full investigative account of securities fraud to be published',                   'Bombay',   'Investigative', TRUE),
(50, '1992-07-01', 'Harshad Media Blitz',  'India Today / Business Today',     'Harshad grants interviews claiming innocence — calls himself scapegoat of a broken system',                          'Bombay',   'Defiant',       TRUE);

-- ============================================================
-- CHAPTER 6: "The Political Storm" (1992 - 1993)
-- ============================================================


-- ============================================================
-- TABLE 1: jpc_hearings
-- Noise: loop-generated fake hearing records
-- Real JPC hearings hard inserted
-- ============================================================
DROP TABLE IF EXISTS jpc_hearings;

CREATE TABLE jpc_hearings (
    hearing_id        INT PRIMARY KEY,
    hearing_date      DATE,
    witness_name      VARCHAR(100),
    witness_role      VARCHAR(150),
    testimony_summary VARCHAR(300),
    was_hostile       BOOLEAN,
    evidence_submitted BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 40 fake hearing records
INSERT INTO jpc_hearings (
    hearing_id, hearing_date, witness_name, witness_role,
    testimony_summary, was_hostile, evidence_submitted, is_real
)
SELECT
    n,
    '1992-07-01'::DATE + (n * 5 || ' days')::INTERVAL,
    'Witness Name ' || n,
    CASE WHEN n % 4 = 0 THEN 'Bank Officer'
         WHEN n % 4 = 1 THEN 'Stock Broker'
         WHEN n % 4 = 2 THEN 'RBI Official'
         ELSE 'Ministry Clerk' END,
    'Generic testimony No.' || n || ' — no significant disclosure',
    CASE WHEN n % 3 = 0 THEN TRUE ELSE FALSE END,
    CASE WHEN n % 2 = 0 THEN TRUE ELSE FALSE END,
    FALSE
FROM generate_series(1, 40) AS s(n);

-- Hard insert real JPC hearings
INSERT INTO jpc_hearings VALUES
(41, '1992-08-04',  'S. Venkitaramanan',   'RBI Governor',                       'Admitted RF deal system lacked oversight — denied personal knowledge of fraud scale',                          TRUE,  TRUE,  TRUE),
(42, '1992-08-11',  'Manmohan Singh',       'Finance Minister of India',           'Stated he had no knowledge of Harshad using bank funds — defended liberalization policy as separate issue',   FALSE, FALSE, TRUE),
(43, '1992-08-18',  'R. Sitaraman',         'NHB Deputy Governor',                 'Refused to answer on NHB fake BR approvals — pleaded ignorance on BR backing verification process',           TRUE,  FALSE, TRUE),
(44, '1992-08-25',  'S.K. Basu',            'SBI Securities Division Officer',     'Admitted RF deals were processed without verifying underlying securities — claimed systemic pressure',        TRUE,  TRUE,  TRUE),
(45, '1992-09-01',  'Pallav Sheth',         'Citibank Broker',                     'Denied knowledge that BRs were fake — claimed he was acting on bank officer instructions',                    TRUE,  FALSE, TRUE),
(46, '1992-09-08',  'Harshad Shantilal Mehta','Accused — Primary Accused No.1',   'Claimed PM Narasimha Rao personally sanctioned market operations — submitted alleged ₹1 crore payment proof', TRUE,  TRUE,  TRUE),
(47, '1992-09-15',  'P.V. Narasimha Rao',  'Prime Minister of India',             'Denied receiving money from Harshad — admitted Harshad visited PMO but denied discussing market manipulation', TRUE,  FALSE, TRUE),
(48, '1992-09-22',  'Bhupen Dalal',         'Chartered Accountant to Harshad',    'Testified on Growmore accounts — admitted certain entries were made at Harshad direction without audit trail', TRUE,  TRUE,  TRUE),
(49, '1992-10-01',  'Deepak Parekh',        'HDFC — Banking Expert Witness',       'Provided expert testimony on RF deal mechanics — confirmed system was exploitable as designed',               FALSE, TRUE,  TRUE),
(50, '1992-10-15',  'Sucheta Dalal',        'Journalist — Indian Express',         'Presented original source documents — testified on how she obtained the first BR transaction records',        FALSE, TRUE,  TRUE);


-- ============================================================
-- TABLE 2: parliament_debates
-- Noise: loop-generated routine debate records
-- Real scam-related debates hard inserted
-- ============================================================
DROP TABLE IF EXISTS parliament_debates;

CREATE TABLE parliament_debates (
    debate_id         INT PRIMARY KEY,
    debate_date       DATE,
    house             VARCHAR(50),
    raised_by         VARCHAR(100),
    party             VARCHAR(100),
    subject           VARCHAR(300),
    govt_response     VARCHAR(300),
    motion_passed     BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 30 routine debate records
INSERT INTO parliament_debates (
    debate_id, debate_date, house, raised_by,
    party, subject, govt_response,
    motion_passed, is_real
)
SELECT
    n,
    '1992-05-01'::DATE + (n * 7 || ' days')::INTERVAL,
    CASE WHEN n % 2 = 0 THEN 'Lok Sabha' ELSE 'Rajya Sabha' END,
    'MP Name ' || n,
    CASE WHEN n % 4 = 0 THEN 'BJP'
         WHEN n % 4 = 1 THEN 'Congress'
         WHEN n % 4 = 2 THEN 'CPI'
         ELSE 'Janata Dal' END,
    'Routine parliamentary question No.' || n,
    'Standard government reply — under examination',
    FALSE,
    FALSE
FROM generate_series(1, 30) AS s(n);

-- Hard insert real parliament debates
INSERT INTO parliament_debates VALUES
(31, '1992-04-25', 'Lok Sabha',   'L.K. Advani',        'BJP',         'Demands immediate resignation of Finance Minister over securities scam',                           'Manmohan Singh denies personal involvement — promises inquiry',                   FALSE, TRUE),
(32, '1992-04-25', 'Lok Sabha',   'George Fernandes',   'Janata Dal',  'Calls for JPC inquiry — claims government knew about scam for months',                             'PM Rao agrees to consider JPC — no immediate commitment',                        FALSE, TRUE),
(33, '1992-04-28', 'Rajya Sabha', 'S. Jaipal Reddy',    'Janata Dal',  'Questions RBI role — demands Governor Venkitaramanan explain RF deal oversight failure',           'Finance Ministry says RBI acted within mandate — review underway',               FALSE, TRUE),
(34, '1992-05-06', 'Lok Sabha',   'Atal Bihari Vajpayee','BJP',        'No-confidence motion threat over government handling of scam — demands PM statement',              'PM Rao makes statement in Lok Sabha — admits systemic failures',                  FALSE, TRUE),
(35, '1992-05-15', 'Lok Sabha',   'P.V. Narasimha Rao', 'Congress',    'PM announces formation of JPC to investigate 1992 securities scam — names committee members',     'JPC constituted under Ram Niwas Mirdha — 30 member committee',                   TRUE,  TRUE),
(36, '1992-06-01', 'Rajya Sabha', 'Subramanian Swamy',  'Janata Party','Raises ₹1 crore briefcase allegation — demands PM explain Harshad PMO visit',                      'PM denies financial transaction — says visit was routine market discussion',       FALSE, TRUE),
(37, '1992-07-10', 'Lok Sabha',   'Jaswant Singh',      'BJP',         'Questions delay in CBI chargesheet — demands timeline for prosecution',                            'Law Ministry says chargesheet being prepared — CBI investigation ongoing',        FALSE, TRUE),
(38, '1992-08-20', 'Lok Sabha',   'Ram Niwas Mirdha',   'Congress',    'JPC Chairman presents interim findings — confirms systemic banking failures enabled scam',         'Government accepts interim report — RBI reform committee announced',              TRUE,  TRUE),
(39, '1993-01-10', 'Rajya Sabha', 'L.K. Advani',        'BJP',         'Demands criminal charges against PM — presents Harshad affidavit naming Rao in PMO meeting',       'Government calls affidavit politically motivated — no action taken',              FALSE, TRUE),
(40, '1993-04-01', 'Lok Sabha',   'Ram Niwas Mirdha',   'Congress',    'JPC final report tabled — recommends SEBI strengthening and banking regulation overhaul',          'Government accepts JPC recommendations — SEBI Act amendment announced',           TRUE,  TRUE);


-- ============================================================
-- TABLE 3: politicians_questioned
-- Noise: loop-generated minor politicians
-- Real key political figures hard inserted
-- ============================================================
DROP TABLE IF EXISTS politicians_questioned;

CREATE TABLE politicians_questioned (
    pq_id             INT PRIMARY KEY,
    politician_name   VARCHAR(100),
    designation       VARCHAR(150),
    party             VARCHAR(100),
    questioned_by     VARCHAR(100),
    question_date     DATE,
    allegation        VARCHAR(300),
    outcome           VARCHAR(300),
    charges_filed     BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 25 minor politician records
INSERT INTO politicians_questioned (
    pq_id, politician_name, designation, party,
    questioned_by, question_date, allegation,
    outcome, charges_filed, is_real
)
SELECT
    n,
    'Minor Politician ' || n,
    'Member of Parliament',
    CASE WHEN n % 3 = 0 THEN 'Congress'
         WHEN n % 3 = 1 THEN 'BJP'
         ELSE 'Regional Party' END,
    'JPC Committee',
    '1992-08-01'::DATE + (n * 10 || ' days')::INTERVAL,
    'Peripheral association with Harshad network — unverified',
    'Cleared — no evidence found',
    FALSE,
    FALSE
FROM generate_series(1, 25) AS s(n);

-- Hard insert real politicians questioned
INSERT INTO politicians_questioned VALUES
(26, 'P.V. Narasimha Rao',   'Prime Minister of India',        'Congress',    'JPC Committee',  '1992-09-15', 'Harshad claims ₹1 crore paid to PM — PMO visit to sanction market manipulation',   'Denied all allegations — JPC could not conclusively prove payment',          FALSE, TRUE),
(27, 'Manmohan Singh',        'Finance Minister',               'Congress',    'JPC Committee',  '1992-08-11', 'Accused of knowing about RF deal misuse through RBI reports — delayed action',     'Cleared by JPC — said RBI reports did not indicate fraud scale',              FALSE, TRUE),
(28, 'S. Venkitaramanan',     'RBI Governor',                   'Non-Partisan','JPC Committee',  '1992-08-04', 'Failed to flag RF deal irregularities despite internal RBI audit warnings',        'Criticised in JPC report — RBI oversight described as inadequate',           FALSE, TRUE),
(29, 'Madhavrao Scindia',     'Minister of Civil Aviation',     'Congress',    'JPC Committee',  '1992-10-01', 'Alleged social proximity to Harshad — rumored investment in Growmore funds',       'Cleared — no financial link established',                                     FALSE, TRUE),
(30, 'Sharad Pawar',          'Chief Minister, Maharashtra',    'Congress',    'CBI',            '1992-11-01', 'State government accused of delayed action on Bombay-based fraud warning signs',   'No charges filed — state claimed central jurisdiction over BSE matters',      FALSE, TRUE),
(31, 'Subramanian Swamy',     'MP — Janata Party',              'Janata Party','Press / JPC',    '1992-06-01', 'Filed PIL demanding criminal investigation of PM — raised briefcase allegation',   'PIL admitted by Supreme Court — added political pressure on government',      FALSE, TRUE),
(32, 'Ram Niwas Mirdha',      'JPC Chairman',                   'Congress',    'Parliament',     '1993-04-01', 'Opposition alleged JPC report softened findings to protect PM Narasimha Rao',      'Mirdha denied political interference — report tabled without amendment',      FALSE, TRUE),
(33, 'Arjun Singh',           'Minister of Human Resources',    'Congress',    'JPC Committee',  '1992-10-15', 'Rumored beneficiary of Harshad bull run — alleged investment through relatives',   'Cleared — no financial evidence found',                                       FALSE, TRUE),
(34, 'N.K.P. Salve',          'Senior Congress MP',             'Congress',    'JPC Committee',  '1992-09-20', 'Alleged intermediary between Harshad and PMO — disputed by all parties',           'No evidence — allegation treated as politically motivated',                   FALSE, TRUE),
(35, 'Bal Thackeray',         'Shiv Sena Chief',                'Shiv Sena',   'Press',          '1992-12-01', 'Harshad claimed Bombay political figures knew — Thackeray publicly denied link',   'No formal questioning — no charges',                                          FALSE, TRUE);


-- ============================================================
-- TABLE 4: rbi_actions
-- Noise: loop-generated routine RBI circulars
-- Real post-scam RBI actions hard inserted
-- ============================================================
DROP TABLE IF EXISTS rbi_actions;

CREATE TABLE rbi_actions (
    action_id         INT PRIMARY KEY,
    action_date       DATE,
    action_type       VARCHAR(100),
    description       VARCHAR(300),
    triggered_by      VARCHAR(150),
    banks_affected    VARCHAR(300),
    implemented       BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 30 routine RBI circular records
INSERT INTO rbi_actions (
    action_id, action_date, action_type, description,
    triggered_by, banks_affected, implemented, is_real
)
SELECT
    n,
    '1992-05-01'::DATE + (n * 10 || ' days')::INTERVAL,
    CASE WHEN n % 3 = 0 THEN 'Circular'
         WHEN n % 3 = 1 THEN 'Advisory'
         ELSE 'Guideline' END,
    'Routine RBI directive No.' || n || ' — standard banking regulation',
    'RBI Internal Review',
    'All Scheduled Commercial Banks',
    TRUE,
    FALSE
FROM generate_series(1, 30) AS s(n);

-- Hard insert real RBI post-scam actions
INSERT INTO rbi_actions VALUES
(31, '1992-04-28', 'Emergency Directive',    'RBI suspends all Ready Forward deals with immediate effect — no new RF transactions permitted',                              '1992 Securities Scam',         'All Scheduled Banks',                              TRUE,  TRUE),
(32, '1992-05-01', 'Bank Placed Under Watch','Bank of Karad placed under RBI moratorium — depositor withdrawals suspended pending liquidation',                           'Fake BR issuance confirmed',   'Bank of Karad',                                    TRUE,  TRUE),
(33, '1992-05-10', 'Supervisory Action',     'Metropolitan Co-op Bank placed under RBI special watch — board suspended',                                                  'Pass-through BR fraud found',  'Metropolitan Co-op Bank',                          TRUE,  TRUE),
(34, '1992-05-15', 'NHB Supervision',        'National Housing Bank placed under direct RBI supervision — Deputy Governor removed pending inquiry',                       'NHB fake BR issuance',         'National Housing Bank',                            TRUE,  TRUE),
(35, '1992-06-01', 'Systemic Reform Order',  'RBI mandates all banks to submit RF deal registers — physical securities verification now mandatory for all RF transactions','JPC interim recommendation',   'All Public and Private Sector Banks',              TRUE,  TRUE),
(36, '1992-07-01', 'Audit Requirement',      'RBI orders concurrent audit for all inter-bank transactions above ₹1 crore — external auditor sign-off mandatory',         'JPC recommendation',           'All Scheduled Commercial Banks',                   TRUE,  TRUE),
(37, '1992-08-01', 'SEBI Coordination',      'RBI and SEBI sign MOU for joint oversight of broker-bank transactions — first formal coordination between two regulators', 'Post-scam regulatory gap',     'BSE Listed Companies + Banks',                     TRUE,  TRUE),
(38, '1992-10-01', 'Demat Introduction Plan','RBI endorses SEBI proposal for dematerialisation of securities — physical share certificates to be phased out',             'Scam exposed paper BR risk',   'All Capital Market Participants',                  TRUE,  TRUE),
(39, '1993-01-15', 'Bank of Karad Liquidated','Bank of Karad formally liquidated — depositors partially compensated through Deposit Insurance scheme',                   'Bank of Karad default',        'Bank of Karad depositors',                         TRUE,  TRUE),
(40, '1993-03-01', 'RF Deal Ban Confirmed',  'RBI makes RF deal suspension permanent — ready forward transactions banned from Indian banking system entirely',             'JPC final report',             'All Banks — permanent systemic change',             TRUE,  TRUE);


-- ============================================================
-- TABLE 5: scapegoats_vs_escaped
-- The most important table of Chapter 6 —
-- who was punished vs who walked free
-- ============================================================
DROP TABLE IF EXISTS scapegoats_vs_escaped;

CREATE TABLE scapegoats_vs_escaped (
    person_id         INT PRIMARY KEY,
    person_name       VARCHAR(100),
    role_in_scam      VARCHAR(200),
    organisation      VARCHAR(150),
    was_charged       BOOLEAN,
    was_convicted     BOOLEAN,
    punishment        VARCHAR(300),
    walked_free       BOOLEAN,
    reason_escaped    VARCHAR(300),
    category          VARCHAR(50)
);

INSERT INTO scapegoats_vs_escaped VALUES
(1,  'Harshad Shantilal Mehta', 'Primary architect — BR fraud, RF deal diversion, market manipulation',     'Growmore Securities',       TRUE,  TRUE,  'Convicted in 4 of 27 cases — died in judicial custody Dec 31 2001 before full verdict', FALSE, NULL,                                                           'Punished'),
(2,  'Ashwin Mehta',            'Brother — managed Growmore accounts and client operations',                'Growmore Securities',       TRUE,  TRUE,  'Convicted — sentenced to rigorous imprisonment',                                          FALSE, NULL,                                                           'Punished'),
(3,  'Sudhir Mehta',            'Brother — handled client accounts and fund routing',                       'Growmore Securities',       TRUE,  FALSE, 'Charged but acquitted in most cases — some charges dropped',                              FALSE, NULL,                                                           'Partial'),
(4,  'R. Sitaraman',            'NHB Deputy Governor — approved fake BRs without backing verification',     'National Housing Bank',     TRUE,  FALSE, 'Charged — case dragged for years — died before conviction',                               FALSE, NULL,                                                           'Partial'),
(5,  'S.K. Basu',               'SBI officer — facilitated RF deal diversion',                              'State Bank of India',       TRUE,  FALSE, 'Suspended and charged — acquitted on benefit of doubt',                                   TRUE,  'Systemic pressure argument accepted by court',                 'Escaped'),
(6,  'Pallav Sheth',            'Citibank broker — operated fake BR channel',                               'Citibank India',             TRUE,  FALSE, 'Charged — case unresolved for over a decade',                                             TRUE,  'Foreign bank jurisdiction complications delayed prosecution',  'Escaped'),
(7,  'Ajay Kayan',              'Co-broker — Citibank BR network',                                         'Citibank India',             TRUE,  FALSE, 'Charged — proceedings inconclusive',                                                      TRUE,  'Same as Pallav Sheth — prolonged proceedings',                 'Escaped'),
(8,  'P.V. Narasimha Rao',      'Prime Minister — alleged recipient of ₹1 crore from Harshad',             'Government of India',        FALSE, FALSE, 'Never charged — JPC could not conclusively prove payment',                                TRUE,  'Political protection — ruling party — insufficient evidence',  'Escaped'),
(9,  'S. Venkitaramanan',       'RBI Governor — missed or ignored RF deal irregularities',                  'Reserve Bank of India',      FALSE, FALSE, 'Never charged — criticised in JPC report but no criminal action',                        TRUE,  'Regulatory failure treated as negligence not crime',           'Escaped'),
(10, 'Manmohan Singh',          'Finance Minister — delayed action on RBI warnings',                        'Government of India',        FALSE, FALSE, 'Never charged — JPC cleared him of personal wrongdoing',                                 TRUE,  'JPC found no personal financial motive',                       'Escaped'),
(11, 'Bhupen Dalal',            'Chartered Accountant — maintained fraudulent Growmore books',              'Self Employed',              TRUE,  FALSE, 'Charged — case unresolved',                                                               TRUE,  'Accountant argued he followed client instructions',            'Partial'),
(12, 'Bank of Karad MD',        'Authorised fake BR issuance without backing securities',                   'Bank of Karad',              TRUE,  FALSE, 'Charged during liquidation proceedings — outcome inconclusive',                           TRUE,  'Bank liquidated — proceedings got lost in insolvency process',  'Escaped');

-- ============================================================
-- CHAPTER 7: "The Trial" (1992 - 2001)
-- ============================================================


-- ============================================================
-- TABLE 1: court_cases
-- Noise: loop-generated minor case records
-- Real 27 criminal cases hard inserted
-- ============================================================
DROP TABLE IF EXISTS court_cases;

CREATE TABLE court_cases (
    case_id           INT PRIMARY KEY,
    case_number       VARCHAR(100),
    filed_by          VARCHAR(100),
    filed_date        DATE,
    court_name        VARCHAR(150),
    charge_type       VARCHAR(200),
    accused_name      VARCHAR(100),
    case_status       VARCHAR(100),
    verdict           VARCHAR(200),
    verdict_date      DATE,
    is_real           BOOLEAN
);

-- Noise: loop-generate 40 minor case records
INSERT INTO court_cases (
    case_id, case_number, filed_by, filed_date,
    court_name, charge_type, accused_name,
    case_status, verdict, verdict_date, is_real
)
SELECT
    n,
    'DUMMY-CASE-' || LPAD(n::TEXT, 4, '0'),
    'CBI Dummy Division',
    '1992-06-01'::DATE + (n * 15 || ' days')::INTERVAL,
    'Sessions Court Bombay',
    'Minor financial irregularity — unrelated to main scam',
    'Peripheral Accused ' || n,
    'Closed',
    'Acquitted — insufficient evidence',
    '1995-01-01'::DATE + (n * 20 || ' days')::INTERVAL,
    FALSE
FROM generate_series(1, 40) AS s(n);

-- Hard insert real 27 criminal cases against Harshad
INSERT INTO court_cases VALUES
(41,  'CBI/RC/7(S)/92',   'CBI',           '1992-11-02', 'Special Court Mumbai',         'Criminal conspiracy — RF deal diversion ₹500 crore SBI',               'Harshad Shantilal Mehta', 'Convicted',      'Guilty — 5 years rigorous imprisonment',              '1999-11-27', TRUE),
(42,  'CBI/RC/8(S)/92',   'CBI',           '1992-11-15', 'Special Court Mumbai',         'Cheating and fraud — NHB fake BR issuance ₹600 crore',                 'Harshad Shantilal Mehta', 'Convicted',      'Guilty — 5 years rigorous imprisonment',              '2001-03-14', TRUE),
(43,  'CBI/RC/9(S)/92',   'CBI',           '1992-12-01', 'Special Court Mumbai',         'Criminal breach of trust — Bank of Karad ₹300 crore',                  'Harshad Shantilal Mehta', 'Convicted',      'Guilty — 2 years imprisonment',                       '2001-09-30', TRUE),
(44,  'CBI/RC/10(S)/92',  'CBI',           '1992-12-10', 'Special Court Mumbai',         'Falsification of accounts — Growmore Securities internal ledgers',     'Harshad Shantilal Mehta', 'Convicted',      'Guilty — 1 year imprisonment + fine',                 '2001-11-30', TRUE),
(45,  'CBI/RC/11(S)/92',  'CBI',           '1993-01-05', 'Bombay High Court',            'Criminal conspiracy — ANZ Grindlays BR diversion ₹450 crore',          'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(46,  'CBI/RC/12(S)/92',  'CBI',           '1993-01-20', 'Special Court Mumbai',         'Cheating — Citibank broker network fake BRs ₹200 crore',               'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(47,  'CBI/RC/13(S)/92',  'CBI',           '1993-02-14', 'Special Court Mumbai',         'Criminal breach of trust — Metropolitan Coop Bank ₹175 crore',         'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(48,  'CBI/RC/14(S)/92',  'CBI',           '1993-02-28', 'Special Court Mumbai',         'Securities fraud — SBI second RF deal batch ₹700 crore',               'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(49,  'CBI/RC/15(S)/92',  'CBI',           '1993-03-15', 'Bombay High Court',            'Market manipulation — ACC Cement artificial price inflation',           'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(50,  'CBI/RC/16(S)/92',  'CBI',           '1993-04-01', 'Special Court Mumbai',         'Criminal conspiracy — NHB second batch BRs ₹500 crore',                'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(51,  'CBI/RC/17(S)/92',  'CBI',           '1993-04-20', 'Special Court Mumbai',         'Cheating — Bank of Karad second batch ₹250 crore',                     'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(52,  'CBI/RC/18(S)/92',  'CBI',           '1993-05-05', 'Special Court Mumbai',         'Fraud — SBI internal officer collusion in RF deals',                    'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(53,  'CBI/RC/19(S)/92',  'CBI',           '1993-05-20', 'Special Court Mumbai',         'Criminal breach of trust — Sensex manipulation via diverted funds',     'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(54,  'CBI/RC/20(S)/92',  'CBI',           '1993-06-10', 'Special Court Mumbai',         'Cheating — retail investor losses from artificial price crash',         'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(55,  'CBI/RC/21(S)/92',  'CBI',           '1993-07-01', 'Bombay High Court',            'Criminal conspiracy — political payment allegation PMO meeting',        'Harshad Shantilal Mehta', 'Dropped',        'Dropped — insufficient evidence on PMO payment',      '1997-06-01', TRUE),
(56,  'CBI/RC/22(S)/92',  'CBI',           '1993-07-15', 'Special Court Mumbai',         'Falsification — NHB third batch fake BR register manipulation',         'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(57,  'CBI/RC/23(S)/92',  'CBI',           '1993-08-01', 'Special Court Mumbai',         'Fraud — Growmore house purchase with diverted bank funds',              'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(58,  'CBI/RC/24(S)/92',  'CBI',           '1993-08-20', 'Special Court Mumbai',         'Criminal breach of trust — artwork and property from scam proceeds',    'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(59,  'CBI/RC/25(S)/92',  'CBI',           '1993-09-05', 'Special Court Mumbai',         'Securities fraud — Reliance stock manipulation via RF funds',           'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(60,  'CBI/RC/26(S)/92',  'CBI',           '1993-09-20', 'Special Court Mumbai',         'Cheating — SBI third exposure batch ₹200 crore',                       'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(61,  'CBI/RC/27(S)/92',  'CBI',           '1993-10-01', 'Special Court Mumbai',         'Criminal conspiracy — coordinated multi-bank BR fraud scheme',          'Harshad Shantilal Mehta', 'Pending',        'Pending at death — Dec 31 2001',                      NULL,         TRUE),
(62,  'CBI/RC/28(S)/92',  'CBI',           '1993-10-15', 'Special Court Mumbai',         'Cheating — Bank of Karad final batch ₹320 crore',                      'Ashwin Mehta',            'Convicted',      'Guilty — rigorous imprisonment',                      '2001-06-15', TRUE),
(63,  'CBI/RC/29(S)/92',  'CBI',           '1993-11-01', 'Special Court Mumbai',         'Falsification of accounts — Growmore books manipulation',               'Bhupen Dalal',            'Pending',        'Unresolved — proceedings ongoing post 2001',          NULL,         TRUE),
(64,  'CBI/RC/30(S)/92',  'CBI',           '1993-11-15', 'Special Court Mumbai',         'Criminal breach of trust — NHB fake BR approval chain',                 'R. Sitaraman',            'Pending',        'Accused died before verdict',                         NULL,         TRUE),
(65,  'CBI/RC/31(S)/92',  'CBI',           '1993-12-01', 'Special Court Mumbai',         'Fraud — SBI RF deal facilitation',                                      'S.K. Basu',               'Acquitted',      'Acquitted — benefit of doubt granted',                '1998-03-20', TRUE),
(66,  'CBI/RC/32(S)/92',  'CBI',           '1994-01-10', 'Special Court Mumbai',         'Cheating — Citibank broker fake BR network',                            'Pallav Sheth',            'Pending',        'Unresolved — proceedings ongoing post 2001',          NULL,         TRUE),
(67,  'CBI/RC/33(S)/92',  'CBI',           '1994-02-01', 'Special Court Mumbai',         'Cheating — Citibank broker fake BR co-operation',                       'Ajay Kayan',              'Pending',        'Unresolved — proceedings ongoing post 2001',          NULL,         TRUE);


-- ============================================================
-- TABLE 2: bail_records
-- Noise: loop-generated irrelevant bail entries
-- Real Harshad bail journey hard inserted
-- ============================================================
DROP TABLE IF EXISTS bail_records;

CREATE TABLE bail_records (
    bail_id           INT PRIMARY KEY,
    case_id           INT,
    accused_name      VARCHAR(100),
    bail_applied_date DATE,
    bail_granted      BOOLEAN,
    bail_amount_cr    DECIMAL(10,2),
    granted_by        VARCHAR(150),
    conditions        VARCHAR(300),
    revoked           BOOLEAN,
    revoke_reason     VARCHAR(200),
    is_real           BOOLEAN
);

-- Noise: loop-generate 20 irrelevant bail records
INSERT INTO bail_records (
    bail_id, case_id, accused_name, bail_applied_date,
    bail_granted, bail_amount_cr, granted_by,
    conditions, revoked, revoke_reason, is_real
)
SELECT
    n,
    (n % 10) + 41,
    'Peripheral Accused ' || n,
    '1993-01-01'::DATE + (n * 20 || ' days')::INTERVAL,
    CASE WHEN n % 2 = 0 THEN TRUE ELSE FALSE END,
    ROUND((n * 0.1)::NUMERIC, 2),
    'Sessions Court Bombay',
    'Report to police station weekly',
    FALSE,
    NULL,
    FALSE
FROM generate_series(1, 20) AS s(n);

-- Hard insert real Harshad bail journey
INSERT INTO bail_records VALUES
(21, 41, 'Harshad Shantilal Mehta', '1992-05-10', FALSE, 0.00,   'Special Court Mumbai',  'Bail rejected — flight risk and evidence tampering concern',                     FALSE, NULL,                                          TRUE),
(22, 41, 'Harshad Shantilal Mehta', '1992-07-04', FALSE, 0.00,   'Bombay High Court',     'Bail rejected again — scale of fraud too large for bail',                       FALSE, NULL,                                          TRUE),
(23, 41, 'Harshad Shantilal Mehta', '1992-09-15', TRUE,  1.00,   'Supreme Court of India','Bail granted — ₹1 crore surety — must not leave Mumbai — weekly court reporting', FALSE, NULL,                                          TRUE),
(24, 42, 'Harshad Shantilal Mehta', '1993-11-10', TRUE,  0.50,   'Special Court Mumbai',  'Interim bail for medical examination — 30 days',                                 TRUE,  'Extended custody ordered after 30 days',      TRUE),
(25, 43, 'Harshad Shantilal Mehta', '1995-04-20', FALSE, 0.00,   'Bombay High Court',     'Bail denied — new chargesheet filed — fresh custody warranted',                  FALSE, NULL,                                          TRUE),
(26, 44, 'Harshad Shantilal Mehta', '1996-08-14', TRUE,  2.00,   'Supreme Court of India','Bail granted — ₹2 crore surety — surrender passport — report weekly',            FALSE, NULL,                                          TRUE),
(27, 45, 'Harshad Shantilal Mehta', '1997-03-30', FALSE, 0.00,   'Special Court Mumbai',  'Bail denied — fresh CBI application for re-arrest in new case',                  FALSE, NULL,                                          TRUE),
(28, 41, 'Harshad Shantilal Mehta', '1999-01-15', TRUE,  3.00,   'Supreme Court of India','Bail granted post conviction pending appeal — ₹3 crore surety',                  FALSE, NULL,                                          TRUE),
(29, 41, 'Harshad Shantilal Mehta', '2001-09-01', FALSE, 0.00,   'Special Court Mumbai',  'Bail revoked — taken back into custody for remaining case hearings',              TRUE,  'Custody required for final case proceedings', TRUE),
(30, 41, 'Harshad Shantilal Mehta', '2001-12-26', FALSE, 0.00,   'Special Court Mumbai',  'Final custody — died in judicial custody Dec 31 2001 in Thane prison',           FALSE, NULL,                                          TRUE);


-- ============================================================
-- TABLE 3: witnesses
-- Noise: loop-generated minor witnesses
-- Real trial witnesses hard inserted
-- ============================================================
DROP TABLE IF EXISTS witnesses;

CREATE TABLE witnesses (
    witness_id        INT PRIMARY KEY,
    case_id           INT,
    witness_name      VARCHAR(100),
    witness_type      VARCHAR(50),
    testimony_date    DATE,
    testimony_summary VARCHAR(300),
    turned_hostile    BOOLEAN,
    cross_examined    BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 50 minor witness records
INSERT INTO witnesses (
    witness_id, case_id, witness_name, witness_type,
    testimony_date, testimony_summary,
    turned_hostile, cross_examined, is_real
)
SELECT
    n,
    (n % 10) + 41,
    'Witness Name ' || n,
    CASE WHEN n % 3 = 0 THEN 'Prosecution'
         WHEN n % 3 = 1 THEN 'Defence'
         ELSE 'Expert' END,
    '1993-06-01'::DATE + (n * 30 || ' days')::INTERVAL,
    'Generic testimony No.' || n || ' — procedural witness',
    CASE WHEN n % 5 = 0 THEN TRUE ELSE FALSE END,
    TRUE,
    FALSE
FROM generate_series(1, 50) AS s(n);

-- Hard insert real trial witnesses
INSERT INTO witnesses VALUES
(51, 41, 'Sucheta Dalal',       'Prosecution', '1993-09-10', 'Presented original BR transaction documents — testified on how irregularities were first identified',           FALSE, TRUE,  TRUE),
(52, 41, 'S.K. Basu',           'Prosecution', '1993-11-15', 'Testified on SBI RF deal processing — admitted deals were done without security verification',                  TRUE,  TRUE,  TRUE),
(53, 42, 'R. Sitaraman',        'Prosecution', '1994-02-20', 'Testified on NHB BR approvals — claimed he was following superior orders — turned hostile mid-testimony',       TRUE,  TRUE,  TRUE),
(54, 41, 'Bhupen Dalal',        'Prosecution', '1994-06-01', 'Testified on Growmore internal accounts — admitted certain entries were made without documentary support',      FALSE, TRUE,  TRUE),
(55, 43, 'Bank of Karad MD',    'Prosecution', '1994-09-15', 'Testified on BR issuance process — claimed bank was pressured by broker network to issue BRs',                 TRUE,  TRUE,  TRUE),
(56, 41, 'Jyoti Mehta',         'Defence',     '1995-03-01', 'Harshad wife — testified that family had no knowledge of fraudulent transactions at firm level',                FALSE, TRUE,  TRUE),
(57, 41, 'Ashwin Mehta',        'Defence',     '1995-06-10', 'Testified in own defence — claimed he was executing Harshad instructions without full knowledge of fraud',      FALSE, TRUE,  TRUE),
(58, 41, 'Pallav Sheth',        'Defence',     '1996-01-20', 'Testified he acted on bank officer instructions — denied independent fraud knowledge',                          FALSE, TRUE,  TRUE),
(59, 49, 'BSE Market Expert',   'Expert',      '1997-04-15', 'Expert witness on ACC price manipulation — confirmed price movement was statistically impossible without manipulation', FALSE, TRUE, TRUE),
(60, 41, 'CBI Investigating Officer', 'Prosecution', '1998-08-01', 'Lead investigating officer testified on full scope of BR fraud — 27 cases summarised in court',          FALSE, TRUE,  TRUE);


-- ============================================================
-- TABLE 4: appeals
-- Noise: loop-generated minor appeal records
-- Real Harshad appeal journey hard inserted
-- ============================================================
DROP TABLE IF EXISTS appeals;

CREATE TABLE appeals (
    appeal_id         INT PRIMARY KEY,
    case_id           INT,
    appellant         VARCHAR(100),
    appeal_date       DATE,
    appeal_court      VARCHAR(150),
    grounds           VARCHAR(300),
    outcome           VARCHAR(200),
    outcome_date      DATE,
    is_real           BOOLEAN
);

-- Noise: loop-generate 20 minor appeal records
INSERT INTO appeals (
    appeal_id, case_id, appellant, appeal_date,
    appeal_court, grounds, outcome, outcome_date, is_real
)
SELECT
    n,
    (n % 10) + 41,
    'Peripheral Accused ' || n,
    '1997-01-01'::DATE + (n * 30 || ' days')::INTERVAL,
    'Bombay High Court',
    'Procedural irregularity in trial — minor ground',
    'Appeal dismissed — original order upheld',
    '1999-01-01'::DATE + (n * 25 || ' days')::INTERVAL,
    FALSE
FROM generate_series(1, 20) AS s(n);

-- Hard insert real appeal records
INSERT INTO appeals VALUES
(21, 41, 'Harshad Shantilal Mehta', '1993-06-01', 'Supreme Court of India', 'Bail appeal — detention unconstitutional — scale of case cannot justify unlimited remand',   'Bail granted — ₹1 crore surety — conditions applied',                          '1993-09-15', TRUE),
(22, 41, 'Harshad Shantilal Mehta', '1994-03-15', 'Bombay High Court',      'Challenges Special Court jurisdiction — argues cases should be heard in civil court',          'Appeal dismissed — Special Court jurisdiction upheld',                         '1994-09-20', TRUE),
(23, 41, 'Harshad Shantilal Mehta', '1995-07-10', 'Supreme Court of India', 'Challenges constitutional validity of Special Court Act 1992',                                'Supreme Court upholds Special Court Act — landmark judgment',                   '1996-02-14', TRUE),
(24, 41, 'Harshad Shantilal Mehta', '1996-11-01', 'Supreme Court of India', 'Challenges attachment of all properties — argues wife and family assets protected',            'Partial relief — family residence Madhuli partially protected',                 '1997-05-30', TRUE),
(25, 41, 'CBI',                     '1999-12-01', 'Bombay High Court',      'CBI appeals conviction in case RC/7 — demands higher sentence than 5 years awarded',           'Appeal pending — not decided before Harshad death',                            NULL,         TRUE),
(26, 41, 'Harshad Shantilal Mehta', '2000-01-15', 'Supreme Court of India', 'Harshad appeals conviction in RC/7 — claims trial was biased and evidence tampered',           'Appeal pending — not decided before death — Dec 31 2001',                     NULL,         TRUE),
(27, 42, 'Harshad Shantilal Mehta', '2001-04-01', 'Bombay High Court',      'Challenges second conviction RC/8 — NHB case — claims double jeopardy in multi-case filing',  'Appeal filed — Harshad dies in custody before hearing',                        NULL,         TRUE),
(28, 62, 'Ashwin Mehta',            '2002-01-10', 'Bombay High Court',      'Ashwin appeals conviction after Harshad death — argues joint liability unfair',                 'Appeal admitted — proceedings ongoing',                                        NULL,         TRUE),
(29, 41, 'Jyoti Mehta',             '2002-03-15', 'Supreme Court of India', 'Harshad widow appeals property attachment — argues family assets were personal not scam proceeds','Partial relief granted — some assets returned to family',                    '2004-08-20', TRUE),
(30, 41, 'CBI',                     '2003-06-01', 'Supreme Court of India', 'CBI files writ to continue remaining 23 pending cases against Harshad estate',                  'Supreme Court rules pending cases abate on death — 23 cases closed',           '2003-11-15', TRUE);


-- ============================================================
-- TABLE 5: timeline_of_custody
-- The human cost — every arrest, release,
-- hospital visit, and the final day
-- ============================================================
DROP TABLE IF EXISTS timeline_of_custody;

CREATE TABLE timeline_of_custody (
    event_id          INT PRIMARY KEY,
    event_date        DATE,
    event_type        VARCHAR(100),
    location          VARCHAR(200),
    description       VARCHAR(300),
    harshad_condition VARCHAR(100),
    is_real           BOOLEAN
);

-- Noise: loop-generate 15 generic custody records
INSERT INTO timeline_of_custody (
    event_id, event_date, event_type, location,
    description, harshad_condition, is_real
)
SELECT
    n,
    '1993-01-01'::DATE + (n * 60 || ' days')::INTERVAL,
    'Court Appearance',
    'Sessions Court Bombay',
    'Routine court date — hearing adjourned No.' || n,
    'Stable',
    FALSE
FROM generate_series(1, 15) AS s(n);

-- Hard insert real custody timeline
INSERT INTO timeline_of_custody VALUES
(16, '1992-05-04', 'First Arrest',        'CBI Office, Bombay',                    'Harshad formally arrested by CBI — taken into custody after two weeks of raids',               'Healthy',         TRUE),
(17, '1992-05-04', 'Remand',              'Arthur Road Jail, Bombay',              'Judicial remand — Arthur Road Jail — first time behind bars',                                   'Shocked',         TRUE),
(18, '1992-07-04', 'Bail Rejected',       'Bombay High Court',                     'Second bail plea rejected — court cites flight risk and evidence scale',                        'Anxious',         TRUE),
(19, '1992-09-15', 'Bail Granted',        'Supreme Court of India',                'Supreme Court grants bail — ₹1 crore surety — first release from custody',                     'Relieved',        TRUE),
(20, '1993-11-10', 'Re-arrested',         'CBI Office, Bombay',                    'Re-arrested on fresh chargesheet — bail revoked for new cases added',                          'Distressed',      TRUE),
(21, '1994-09-20', 'Special Court',       'Special Court Mumbai',                  'Special Court Act upheld — Harshad now faces dedicated court for scam cases only',             'Resigned',        TRUE),
(22, '1996-08-14', 'Bail Again',          'Supreme Court of India',                'Supreme Court grants second bail — ₹2 crore — passport surrendered',                           'Determined',      TRUE),
(23, '1997-01-01', 'Stock Tips Website',  'Bombay Residence',                      'Harshad launches stock tips website while on bail — still predicting markets from home',       'Defiant',         TRUE),
(24, '1998-01-15', 'Market Tips Column',  'Bombay Residence',                      'Begins writing weekly stock market column — claims he predicted Sensex movements correctly',   'Confident',       TRUE),
(25, '1999-11-27', 'First Conviction',    'Special Court Mumbai',                  'Convicted in CBI/RC/7 — first guilty verdict — 5 years rigorous imprisonment',                 'Defeated',        TRUE),
(26, '2001-03-14', 'Second Conviction',   'Special Court Mumbai',                  'Convicted in CBI/RC/8 — NHB case — another 5 years added',                                    'Weakened',        TRUE),
(27, '2001-09-01', 'Final Custody',       'Thane Central Prison',                  'Bail revoked — taken to Thane prison for final case hearings — health deteriorating',          'Critical',        TRUE),
(28, '2001-09-30', 'Third Conviction',    'Special Court Mumbai',                  'Convicted in CBI/RC/9 — Bank of Karad case — 2 years added',                                  'Very Weak',       TRUE),
(29, '2001-11-26', 'Heart Attack',        'Thane Central Prison',                  'Harshad suffers cardiac arrest inside Thane prison — transferred to hospital',                 'Critical',        TRUE),
(30, '2001-12-31', 'Death',               'Thane Civil Hospital',                  'Harshad Shantilal Mehta dies aged 47 — 23 of 27 cases still pending — justice unfinished',    'Deceased',        TRUE);

-- ============================================================
-- CHAPTER 8: "The Comeback" (1996 - 2001)
-- ============================================================


-- ============================================================
-- TABLE 1: stock_predictions
-- Harshad's website predictions vs actual market
-- Noise: loop-generated wrong predictions
-- Real accurate calls hard inserted
-- ============================================================
DROP TABLE IF EXISTS stock_predictions;

CREATE TABLE stock_predictions (
    prediction_id     INT PRIMARY KEY,
    prediction_date   DATE,
    stock_name        VARCHAR(100),
    predicted_price   DECIMAL(10,2),
    actual_price      DECIMAL(10,2),
    prediction_source VARCHAR(100),
    was_accurate      BOOLEAN,
    accuracy_pct      DECIMAL(5,2),
    is_real           BOOLEAN
);

-- Noise: loop-generate 60 generic wrong predictions
INSERT INTO stock_predictions (
    prediction_id, prediction_date, stock_name,
    predicted_price, actual_price, prediction_source,
    was_accurate, accuracy_pct, is_real
)
SELECT
    n,
    '1997-01-01'::DATE + (n * 15 || ' days')::INTERVAL,
    CASE WHEN n % 6 = 0 THEN 'Reliance Industries'
         WHEN n % 6 = 1 THEN 'BHEL'
         WHEN n % 6 = 2 THEN 'Tata Steel'
         WHEN n % 6 = 3 THEN 'SBI'
         WHEN n % 6 = 4 THEN 'ONGC'
         ELSE 'Larsen and Toubro' END,
    ROUND((100 + n * 3)::NUMERIC, 2),
    ROUND((95  + n * 3)::NUMERIC, 2),
    'Generic Analyst Noise',
    FALSE,
    ROUND((70 + (n % 20))::NUMERIC, 2),
    FALSE
FROM generate_series(1, 60) AS s(n);

-- Hard insert real Harshad website predictions
INSERT INTO stock_predictions VALUES
(61,  '1997-04-10', 'Videocon',              180.00,  183.00,  'harshadmehta.com',  TRUE,  98.37, TRUE),
(62,  '1997-05-15', 'BPL',                   220.00,  228.00,  'harshadmehta.com',  TRUE,  96.49, TRUE),
(63,  '1997-06-20', 'Sterlite Industries',   145.00,  141.00,  'harshadmehta.com',  FALSE, 97.24, TRUE),
(64,  '1997-07-25', 'Himachal Futuristic',   95.00,   102.00,  'harshadmehta.com',  TRUE,  93.14, TRUE),
(65,  '1997-08-30', 'Pentafour Software',    320.00,  315.00,  'harshadmehta.com',  TRUE,  98.44, TRUE),
(66,  '1997-10-05', 'DSQ Software',          210.00,  224.00,  'harshadmehta.com',  TRUE,  93.75, TRUE),
(67,  '1997-11-10', 'Zee Telefilms',         280.00,  272.00,  'harshadmehta.com',  FALSE, 97.14, TRUE),
(68,  '1998-01-15', 'HFCL',                  175.00,  179.00,  'harshadmehta.com',  TRUE,  97.77, TRUE),
(69,  '1998-03-20', 'Sensex Index Call',     4200.00, 4180.00, 'harshadmehta.com',  TRUE,  99.52, TRUE),
(70,  '1998-05-25', 'Global Tele-Systems',   390.00,  401.00,  'harshadmehta.com',  TRUE,  97.26, TRUE),
(71,  '1998-07-10', 'Pentafour Software',    480.00,  465.00,  'harshadmehta.com',  FALSE, 96.88, TRUE),
(72,  '1998-09-15', 'SSI Ltd',               260.00,  258.00,  'harshadmehta.com',  TRUE,  99.23, TRUE),
(73,  '1999-01-20', 'Infosys Technologies',  1800.00, 1920.00, 'harshadmehta.com',  TRUE,  93.75, TRUE),
(74,  '1999-04-10', 'Wipro',                 1200.00, 1185.00, 'harshadmehta.com',  FALSE, 98.75, TRUE),
(75,  '1999-07-15', 'Sensex Bull Call',      4800.00, 4950.00, 'harshadmehta.com',  TRUE,  96.97, TRUE),
(76,  '2000-01-10', 'Sensex Peak Warning',   6000.00, 5933.00, 'harshadmehta.com',  TRUE,  98.88, TRUE),
(77,  '2000-03-20', 'IT Bubble Warning',     NULL,    NULL,    'harshadmehta.com',  TRUE,  NULL,  TRUE),
(78,  '2000-06-15', 'Satyam Computers',      450.00,  438.00,  'harshadmehta.com',  FALSE, 97.33, TRUE),
(79,  '2001-02-10', 'Sensex Recovery Call',  3800.00, 3720.00, 'harshadmehta.com',  FALSE, 97.89, TRUE),
(80,  '2001-08-20', 'Final Market Column',   NULL,    NULL,    'harshadmehta.com',  NULL,  NULL,  TRUE);


-- ============================================================
-- TABLE 2: media_interviews
-- Noise: loop-generated generic press interviews
-- Real Harshad comeback interviews hard inserted
-- ============================================================
DROP TABLE IF EXISTS media_interviews;

CREATE TABLE media_interviews (
    interview_id      INT PRIMARY KEY,
    interview_date    DATE,
    publication       VARCHAR(100),
    journalist        VARCHAR(100),
    key_claim         VARCHAR(300),
    harshad_tone      VARCHAR(50),
    public_reaction   VARCHAR(100),
    was_controversial BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 25 generic press interview records
INSERT INTO media_interviews (
    interview_id, interview_date, publication,
    journalist, key_claim, harshad_tone,
    public_reaction, was_controversial, is_real
)
SELECT
    n,
    '1996-01-01'::DATE + (n * 30 || ' days')::INTERVAL,
    CASE WHEN n % 4 = 0 THEN 'Financial Express'
         WHEN n % 4 = 1 THEN 'Business Standard'
         WHEN n % 4 = 2 THEN 'Hindustan Times'
         ELSE 'Economic Times' END,
    'Staff Reporter ' || n,
    'Generic market commentary No.' || n,
    'Neutral',
    'Low interest',
    FALSE,
    FALSE
FROM generate_series(1, 25) AS s(n);

-- Hard insert real comeback interviews
INSERT INTO media_interviews VALUES
(26, '1992-05-10', 'Press Conference',  'Self',             'I paid ₹1 crore to PM Narasimha Rao — he asked me to boost the market — I am a scapegoat',          'Defiant',     'Shock nationwide',             TRUE,  TRUE),
(27, '1992-07-01', 'India Today',       'Prabhu Chawla',    'The system used me and threw me away — banks knew everything — politicians knew everything',         'Angry',       'Divided — some sympathy',      TRUE,  TRUE),
(28, '1993-09-01', 'Business Today',    'Sanjay Suri',      'I will prove my innocence in court — the real scam is how the system protects the powerful',         'Defiant',     'Mixed',                        TRUE,  TRUE),
(29, '1996-03-15', 'Times of India',    'Ramesh Menon',     'I am still the best stock picker in India — give me a terminal and I will beat any analyst today',   'Confident',   'Amused and intrigued',         FALSE, TRUE),
(30, '1997-01-10', 'Business Today',    'Sanjay Suri',      'Launching harshadmehta.com — my predictions will prove I understood markets better than anyone',      'Confident',   'Skeptical but curious',        FALSE, TRUE),
(31, '1997-06-20', 'India Today',       'Prabhu Chawla',    'My website has 50000 subscribers — people trust my picks — the market knows who the real expert is', 'Triumphant',  'High — website traffic surged', FALSE, TRUE),
(32, '1998-04-15', 'Outlook Magazine',  'Vinod Mehta',      'I predicted the Sensex crash of 1992 too — nobody listened — history is repeating with IT stocks',  'Warning tone','Dismissed by establishment',   TRUE,  TRUE),
(33, '1999-03-01', 'Business Standard', 'Staff Reporter',   'My Infosys call at 1800 has already delivered 40 percent — show me one analyst who beat that',       'Triumphant',  'Grudging admiration',          FALSE, TRUE),
(34, '2000-01-05', 'Economic Times',    'ET Bureau',        'Sensex is overheated — IT bubble will burst — I am calling a top at 6000 — get out now',             'Warning tone','Widely mocked at the time',    TRUE,  TRUE),
(35, '2001-09-15', 'Times of India',    'Staff Reporter',   'Last known interview — I never stopped believing in India — the markets will recover — they always do','Resigned',  'Emotional nationwide',         FALSE, TRUE);


-- ============================================================
-- TABLE 3: comeback_trades
-- Harshad kept trading through relatives and associates
-- Noise: loop-generated generic trades
-- Real comeback era trades hard inserted
-- ============================================================
DROP TABLE IF EXISTS comeback_trades;

CREATE TABLE comeback_trades (
    trade_id          INT PRIMARY KEY,
    trade_date        DATE,
    stock_name        VARCHAR(100),
    trade_type        VARCHAR(10),
    quantity          INT,
    price_per_share   DECIMAL(10,2),
    routed_through    VARCHAR(150),
    profit_loss       DECIMAL(12,2),
    is_direct         BOOLEAN,
    is_real           BOOLEAN
);

-- Noise: loop-generate 50 generic comeback era trades
INSERT INTO comeback_trades (
    trade_id, trade_date, stock_name, trade_type,
    quantity, price_per_share, routed_through,
    profit_loss, is_direct, is_real
)
SELECT
    n,
    '1996-01-01'::DATE + (n * 20 || ' days')::INTERVAL,
    CASE WHEN n % 5 = 0 THEN 'Reliance Industries'
         WHEN n % 5 = 1 THEN 'Tata Steel'
         WHEN n % 5 = 2 THEN 'SBI'
         WHEN n % 5 = 3 THEN 'BHEL'
         ELSE 'Larsen and Toubro' END,
    CASE WHEN n % 2 = 0 THEN 'BUY' ELSE 'SELL' END,
    100 + (n * 20),
    ROUND((50 + n * 2)::NUMERIC, 2),
    'Generic Broker Firm ' || n,
    ROUND(((n % 2) * 2 - 1) * (n * 500)::NUMERIC, 2),
    FALSE,
    FALSE
FROM generate_series(1, 50) AS s(n);

-- Hard insert real comeback era trades
INSERT INTO comeback_trades VALUES
(51, '1997-03-15', 'Videocon',             'BUY',  5000,  175.00,  'Ashwin Mehta — brother account',         112500.00,  FALSE, TRUE),
(52, '1997-04-20', 'Videocon',             'SELL', 5000,  197.50,  'Ashwin Mehta — brother account',         112500.00,  FALSE, TRUE),
(53, '1997-06-10', 'BPL',                  'BUY',  8000,  215.00,  'Jyoti Mehta — wife account',              96000.00,  FALSE, TRUE),
(54, '1997-08-25', 'BPL',                  'SELL', 8000,  227.00,  'Jyoti Mehta — wife account',              96000.00,  FALSE, TRUE),
(55, '1997-10-01', 'Himachal Futuristic',  'BUY',  12000, 88.00,   'Sudhir Mehta — brother account',         168000.00,  FALSE, TRUE),
(56, '1997-12-15', 'Himachal Futuristic',  'SELL', 12000, 102.00,  'Sudhir Mehta — brother account',         168000.00,  FALSE, TRUE),
(57, '1998-02-10', 'HFCL',                 'BUY',  20000, 168.00,  'Associate broker — court permitted',     700000.00,  FALSE, TRUE),
(58, '1998-05-20', 'HFCL',                 'SELL', 20000, 203.00,  'Associate broker — court permitted',     700000.00,  FALSE, TRUE),
(59, '1999-01-15', 'Infosys Technologies', 'BUY',  500,   1750.00, 'Own account — court supervised',         350000.00,  TRUE,  TRUE),
(60, '1999-06-10', 'Infosys Technologies', 'SELL', 500,   2450.00, 'Own account — court supervised',         350000.00,  TRUE,  TRUE),
(61, '1999-08-20', 'Wipro',                'BUY',  1000,  1150.00, 'Jyoti Mehta — wife account',             250000.00,  FALSE, TRUE),
(62, '2000-01-05', 'Wipro',                'SELL', 1000,  1400.00, 'Jyoti Mehta — wife account',             250000.00,  FALSE, TRUE),
(63, '2000-02-15', 'Satyam Computers',     'BUY',  3000,  440.00,  'Sudhir Mehta — brother account',        -180000.00,  FALSE, TRUE),
(64, '2000-07-10', 'Satyam Computers',     'SELL', 3000,  380.00,  'Sudhir Mehta — brother account',        -180000.00,  FALSE, TRUE),
(65, '2001-03-01', 'Sensex Short Call',    'SELL', 10000, 4200.00, 'Associate broker — final major trade',   800000.00,  FALSE, TRUE);


-- ============================================================
-- TABLE 4: legal_victories
-- Cases Harshad won or got relief in
-- Noise: loop-generated minor procedural wins
-- Real victories hard inserted
-- ============================================================
DROP TABLE IF EXISTS legal_victories;

CREATE TABLE legal_victories (
    victory_id        INT PRIMARY KEY,
    victory_date      DATE,
    court_name        VARCHAR(150),
    case_reference    VARCHAR(100),
    victory_type      VARCHAR(100),
    description       VARCHAR(300),
    significance      VARCHAR(200),
    is_real           BOOLEAN
);

-- Noise: loop-generate 15 minor procedural wins
INSERT INTO legal_victories (
    victory_id, victory_date, court_name,
    case_reference, victory_type, description,
    significance, is_real
)
SELECT
    n,
    '1993-01-01'::DATE + (n * 90 || ' days')::INTERVAL,
    'Sessions Court Bombay',
    'PROC-' || LPAD(n::TEXT, 4, '0'),
    'Procedural relief',
    'Minor procedural order in favour — routine adjournment granted',
    'No material impact on main cases',
    FALSE
FROM generate_series(1, 15) AS s(n);

-- Hard insert real legal victories
INSERT INTO legal_victories VALUES
(16, '1993-09-15', 'Supreme Court of India', 'SLP/1992/HC-441',     'Bail granted',           'Supreme Court grants first bail — ₹1 crore surety — cites prolonged remand violation of Article 21', 'First major win — proved system cannot hold indefinitely without trial',  TRUE),
(17, '1994-09-20', 'Bombay High Court',       'CRI/1994/BHC-221',    'Jurisdiction challenge', 'High Court rejects Harshad challenge to Special Court — but process delay itself was a partial win',  'Delayed proceedings by 8 months — bought time for defence preparation',  TRUE),
(18, '1996-02-14', 'Supreme Court of India',  'WP/1995/SC-774',      'Constitutional challenge','Supreme Court upholds Special Court Act BUT reads down overbroad attachment provisions',               'Partial win — attachment of ALL property ruled excessive — some assets freed', TRUE),
(19, '1996-08-14', 'Supreme Court of India',  'SLP/1996/SC-902',     'Second bail granted',    'Second bail granted — ₹2 crore surety — court notes no trial has progressed in 4 years',             'Second release — court implicitly criticises slow prosecution',           TRUE),
(20, '1997-05-30', 'Supreme Court of India',  'CA/1996/SC-1104',     'Family property relief', 'Madhuli apartment partially protected — court holds wife and family share cannot be attached',        'Jyoti Mehta retains part of family home — first asset returned',          TRUE),
(21, '1997-06-01', 'Bombay High Court',        'CBI/PMO/DROP/97',     'Case dropped',           'CBI/RC/21 — PMO payment case dropped — insufficient evidence — biggest political case collapses',   'PM Narasimha Rao link case dropped — Harshad vindicated on this charge',  TRUE),
(22, '1998-03-20', 'Special Court Mumbai',     'CBI/RC/31/ACQ/98',    'Co-accused acquitted',   'S.K. Basu acquitted — court holds systemic pressure defence valid — weakens prosecution narrative',  'Systemic defence argument succeeds — opens door for similar arguments',   TRUE),
(23, '1999-01-15', 'Supreme Court of India',   'SLP/1998/SC-2201',    'Third bail granted',     'Post first-conviction bail — court grants bail pending appeal — notes age and health deterioration', 'Released again despite conviction — health argument accepted',            TRUE),
(24, '2003-11-15', 'Supreme Court of India',   'CRLMP/2003/SC-8801',  'Cases abated',           'Supreme Court rules all 23 pending cases abate upon death — cannot proceed against dead accused',    'Posthumous win — 23 cases permanently closed — family not liable',        TRUE),
(25, '2004-08-20', 'Supreme Court of India',   'CA/2002/SC-4401',     'Property returned',      'Widow Jyoti Mehta wins appeal — certain personal assets returned — scam attachment partially lifted','Family recovers some assets — 12 years after arrest',                    TRUE);


-- ============================================================
-- TABLE 5: legacy
-- The final table of the game —
-- What Harshad left behind: reforms, victims,
-- the system he broke and the system he built
-- ============================================================
DROP TABLE IF EXISTS legacy;

CREATE TABLE legacy (
    legacy_id         INT PRIMARY KEY,
    legacy_type       VARCHAR(100),
    description       VARCHAR(300),
    triggered_by      VARCHAR(200),
    year_implemented  INT,
    still_active      BOOLEAN,
    beneficiary       VARCHAR(150),
    is_positive       BOOLEAN
);

INSERT INTO legacy VALUES
(1,  'Regulatory Reform',  'SEBI given statutory powers — Securities and Exchange Board of India Act 1992 passed',                        '1992 scam exposed total absence of market regulator',              1992, TRUE,  'All Indian investors',                  TRUE),
(2,  'Banking Reform',     'Ready Forward deals permanently banned from Indian banking system by RBI',                                    'RF deal mechanism was the core scam instrument',                   1993, TRUE,  'All Indian banks and depositors',       TRUE),
(3,  'Market Reform',      'Dematerialisation of shares introduced — physical share certificates phased out over 1996-2001',             'Fake BR paper instrument exposed danger of physical securities',   1996, TRUE,  'All capital market participants',       TRUE),
(4,  'Banking Reform',     'Concurrent audit mandatory for all inter-bank transactions above ₹1 crore',                                  'RF deals went unaudited for years enabling fraud',                 1992, TRUE,  'All scheduled commercial banks',        TRUE),
(5,  'Market Reform',      'National Securities Depository Limited founded — electronic settlement of trades begins',                    'Scam showed settlement system was opaque and manipulable',         1996, TRUE,  'BSE and NSE participants',              TRUE),
(6,  'Regulatory Reform',  'SEBI mandated circuit breakers on stock exchanges — daily price movement limits introduced',                  'ACC moved from 200 to 9000 without any regulatory intervention',  1992, TRUE,  'Retail investors',                      TRUE),
(7,  'Human Cost',         'Estimated 50 lakh retail investors lost savings in 1992 crash — no compensation mechanism existed',          'Sensex crashed 40 percent within weeks of scam exposure',          1992, FALSE, 'Retail investors — no beneficiary',    FALSE),
(8,  'Human Cost',         'Bank of Karad depositors lost savings — only partial DICGC insurance cover available at ₹1 lakh per account','Bank of Karad liquidated — no full deposit protection existed',    1993, FALSE, 'Bank of Karad depositors',             FALSE),
(9,  'Political Impact',   'PM Narasimha Rao government weakened — coalition held on but lost moral authority — lost 1996 elections',    'Briefcase allegation and JPC report damaged ruling party image',   1996, FALSE, 'Indian democracy — systemic lesson',   FALSE),
(10, 'Cultural Impact',    'Harshad Mehta became the most recognised name in Indian financial history — textbook case in every B-school', 'Story too large and too dramatic to be forgotten',                 1992, TRUE,  'Financial education in India',          TRUE),
(11, 'Web Series',         'Scam 1992 — The Harshad Mehta Story — SonyLIV — directed by Hansal Mehta — starred Pratik Gandhi',          'Journalist Sucheta Dalal book The Scam adapted for screen',        2020, TRUE,  'Indian OTT audiences — 200M+ viewers', TRUE),
(12, 'Legal Reform',       'Special Court for securities offences established — dedicated fast-track court for financial fraud',          'Regular courts could not handle complexity of securities fraud',   1992, TRUE,  'Indian financial legal system',         TRUE),
(13, 'Market Reform',      'NSE founded 1992 — National Stock Exchange as BSE alternative — electronic trading begins 1994',            'BSE floor manipulation showed need for transparent exchange',       1992, TRUE,  'All Indian investors',                  TRUE),
(14, 'Human Cost',         'Harshad died aged 47 in judicial custody — 23 of 27 cases unresolved — family spent decades in courts',     'System that created him also consumed him before justice finished', 2001, FALSE, 'Mehta family — no beneficiary',        FALSE),
(15, 'Philosophical',      'The Big Bull question remains: was Harshad a criminal who exploited a broken system or a genius the system destroyed?', 'No final verdict — 23 cases died with him',            2001, TRUE,  'Indian public consciousness',           NULL);

