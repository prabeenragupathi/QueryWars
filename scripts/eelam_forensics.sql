DROP TABLE IF EXISTS intelligence_reports CASCADE;
DROP TABLE IF EXISTS safe_houses CASCADE;
DROP TABLE IF EXISTS communication_intercepts CASCADE;
DROP TABLE IF EXISTS arrest_records CASCADE;
DROP TABLE IF EXISTS smuggling_routes CASCADE;
DROP TABLE IF EXISTS financial_ledger CASCADE;
DROP TABLE IF EXISTS diaspora_fronts CASCADE;
DROP TABLE IF EXISTS amnesty_records CASCADE;
DROP TABLE IF EXISTS known_operatives CASCADE;
DROP TABLE IF EXISTS historical_command_structure CASCADE;
CREATE TABLE historical_command_structure (
    division_id SERIAL PRIMARY KEY,
    wing_name VARCHAR(100) NOT NULL,
    historical_commander VARCHAR(100),
    current_status VARCHAR(50)
);
CREATE TABLE known_operatives (
    operative_id SERIAL PRIMARY KEY,
    alias VARCHAR(100) NOT NULL,
    real_name VARCHAR(150),
    prior_wing_id INT REFERENCES historical_command_structure(division_id),
    status VARCHAR(50)
);
CREATE TABLE amnesty_records (
    record_id SERIAL PRIMARY KEY,
    operative_id INT REFERENCES known_operatives(operative_id),
    pardon_date DATE NOT NULL,
    release_location VARCHAR(100),
    monitoring_status VARCHAR(50)
);
CREATE TABLE diaspora_fronts (
    front_id SERIAL PRIMARY KEY,
    organization_name VARCHAR(150) NOT NULL,
    country_of_operation VARCHAR(100),
    public_mission TEXT,
    risk_level VARCHAR(50)
);
CREATE TABLE financial_ledger (
    transaction_id SERIAL PRIMARY KEY,
    sender_front_id INT REFERENCES diaspora_fronts(front_id),
    receiver_alias VARCHAR(100),
    amount_usd NUMERIC(15, 2) NOT NULL,
    transfer_method VARCHAR(50),
    transaction_date DATE NOT NULL
);
CREATE TABLE smuggling_routes (
    route_id SERIAL PRIMARY KEY,
    origin_location VARCHAR(100) NOT NULL,
    destination_location VARCHAR(100) NOT NULL,
    cargo_type VARCHAR(100),
    intercepted_flag BOOLEAN DEFAULT FALSE
);
CREATE TABLE arrest_records (
    arrest_id SERIAL PRIMARY KEY,
    operative_id INT REFERENCES known_operatives(operative_id),
    arresting_agency VARCHAR(100),
    date_of_arrest DATE NOT NULL,
    charges TEXT NOT NULL
);
CREATE TABLE communication_intercepts (
    intercept_id SERIAL PRIMARY KEY,
    sender_ip VARCHAR(45),
    receiver_ip VARCHAR(45),
    encrypted_message_hash TEXT,
    date_intercepted TIMESTAMP NOT NULL,
    keyword_match VARCHAR(100)
);
CREATE TABLE safe_houses (
    house_id SERIAL PRIMARY KEY,
    location_city VARCHAR(100) NOT NULL,
    last_known_activity DATE,
    owner_operative_id INT REFERENCES known_operatives(operative_id)
);
CREATE TABLE intelligence_reports (
    report_id SERIAL PRIMARY KEY,
    agency VARCHAR(100) NOT NULL,
    related_operative_id INT REFERENCES known_operatives(operative_id),
    claim_summary TEXT NOT NULL,
    credibility_score INT CHECK (
        credibility_score BETWEEN 1 AND 10
    ),
    date_filed DATE NOT NULL
);
INSERT INTO historical_command_structure (wing_name, historical_commander, current_status)
VALUES (
        'Military Secretariat',
        'Velupillai Prabhakaran',
        'Dismantled'
    ),
    (
        'Intelligence Wing (TOSIS)',
        'Pottu Amman',
        'Dismantled'
    ),
    (
        'Sea Tigers (Naval Wing)',
        'Thillaiyampalam Sivanesan (Soosai)',
        'Dismantled'
    ),
    (
        'Air Tigers (Air Wing)',
        'Achchuthan',
        'Dismantled'
    ),
    (
        'Black Tigers (Suicide Wing)',
        'Various (First: Captain Miller)',
        'Unknown'
    ),
    (
        'Political Wing',
        'S. P. Thamilselvan / Nadesan',
        'Dismantled'
    ),
    (
        'International Secretariat / Procurement',
        'Kumaran Pathmanathan (KP)',
        'Rebranding'
    ),
    (
        'Charles Anthony Special Brigade',
        'Balraj / Amithab',
        'Dismantled'
    ),
    ('Jeyanthan Brigade', 'Col. Jeyam', 'Dismantled'),
    ('Imran Pandian Regiment', 'Rada', 'Dismantled'),
    (
        'Radha Anti-Aircraft Regiment',
        'Col. Ramanan',
        'Dismantled'
    ),
    (
        'Malathi Women''s Regiment',
        'Vidusha',
        'Dismantled'
    ),
    (
        'Sothiya Women''s Regiment',
        'Durga',
        'Dismantled'
    ),
    ('Kittu Artillery Brigade', 'Bhanu', 'Dismantled'),
    (
        'Victor Anti-Armor Brigade',
        'Ilango',
        'Dismantled'
    ),
    (
        'Ponnamman Mining Unit',
        'Ponnamman',
        'Dismantled'
    ),
    ('Finance Wing', 'Thamilendi', 'Dismantled'),
    (
        'Media and Broadcasting (Voice of Tigers)',
        'Nidarshan',
        'Dismantled'
    ),
    ('Medical Wing', 'Dr. Thileepan', 'Dismantled'),
    ('Eelam Police', 'B. Nadesan', 'Dismantled');
INSERT INTO known_operatives (alias, real_name, prior_wing_id, status)
VALUES (
        'Thambi',
        'Velupillai Prabhakaran',
        1,
        'Deceased'
    ),
    (
        'Pottu Amman',
        'Shanmugalingam Sivashankar',
        2,
        'Deceased'
    ),
    (
        'Soosai',
        'Thillaiyampalam Sivanesan',
        3,
        'Deceased'
    ),
    ('KP', 'Kumaran Pathmanathan', 7, 'Pardoned'),
    (
        'Karuna Amman',
        'Vinayagamoorthy Muralitharan',
        9,
        'Pardoned'
    ),
    (
        'Pillayan',
        'Sivanesathurai Chandrakanthan',
        8,
        'Pardoned'
    ),
    (
        'Thamilselvan',
        'S. P. Thamilselvan',
        6,
        'Deceased'
    ),
    ('Thamilendi', 'Unknown', 17, 'Deceased'),
    ('Gopi', 'Gopithasan', 2, 'Deceased'),
    ('Theiveegan', 'Unknown', 5, 'Deceased'),
    ('Sabesan', 'Satkunam', 2, 'Arrested'),
    ('Mary', 'Mary Francisco', 17, 'Arrested'),
    ('Guna', 'C. Gunashekharan', 7, 'Arrested'),
    ('Pookutti Kanna', 'Pushparajah', 7, 'Arrested'),
    ('Suresh', 'Suresh Raj', 3, 'Arrested'),
    ('Adi Lingam', 'Lingam A.', 17, 'Arrested'),
    ('Sanjay', 'Sanjay Prakash', 1, 'Arrested'),
    ('Naveen', 'Naveen Chakravarthy', 1, 'Arrested'),
    ('Kabilan', 'A. Kabilar', 1, 'Arrested'),
    ('Nilan', 'Nilavan P.', 5, 'Active'),
    ('Kannan', 'Kannan V.', 7, 'Active');
INSERT INTO known_operatives (alias, real_name, prior_wing_id, status)
VALUES ('Selvam', 'Selvanayagam V.', 14, 'Pardoned'),
    ('Bala', 'Balakrishnan M.', 16, 'Pardoned'),
    ('Maran', 'Maran T.', 13, 'Pardoned'),
    ('Anbu', 'Anbarasan K.', 10, 'Pardoned');
INSERT INTO amnesty_records (
        operative_id,
        pardon_date,
        release_location,
        monitoring_status
    )
VALUES (4, '2012-10-01', 'Kilinochchi', 'Cleared'),
    (5, '2007-04-15', 'Colombo', 'Cleared'),
    (6, '2008-10-01', 'Batticaloa', 'Cleared'),
    (22, '2024-01-14', 'Jaffna', 'Monitored'),
    (23, '2024-01-14', 'Trincomalee', 'Monitored'),
    (24, '2023-12-25', 'Vavuniya', 'Absconded'),
    (25, '2024-01-14', 'Colombo', 'Cleared');
INSERT INTO diaspora_fronts (
        organization_name,
        country_of_operation,
        public_mission,
        risk_level
    )
VALUES (
        'Transnational Government of Tamil Eelam (TGTE)',
        'USA',
        'Political Advocacy & Lobbying',
        'High'
    ),
    (
        'World Tamil Movement (WTM)',
        'Canada',
        'Community Support & Fundraising',
        'Critical'
    ),
    (
        'Tamil Rehabilitation Organization (TRO)',
        'Global',
        'Disaster Relief & Orphanages',
        'Critical'
    ),
    (
        'British Tamil Forum (BTF)',
        'UK',
        'Human Rights Lobbying',
        'High'
    ),
    (
        'Tamil Coordinating Committee (TCC)',
        'Norway',
        'Cultural Events & Diaspora Unity',
        'High'
    ),
    (
        'National Council of Canadian Tamils (NCCT)',
        'Canada',
        'Diaspora Representation',
        'Medium'
    ),
    (
        'South Asian Refugee Coalition',
        'Switzerland',
        'Asylum & Visa Support',
        'Low'
    ),
    (
        'Geneva Tamil Heritage Society',
        'Switzerland',
        'Cultural Preservation & Arts',
        'Low'
    ),
    (
        'Colombo Unity Foundation',
        'Sri Lanka',
        'Post-War Reconciliation Programs',
        'Low'
    ),
    (
        'Global South Medical Aid',
        'Australia',
        'Medical Supply Distribution',
        'Low'
    ),
    (
        'Eelam Arts & Literature Guild',
        'France',
        'Publishing & Literature Translation',
        'Medium'
    ),
    (
        'Oceanic Logistics NGO',
        'Malaysia',
        'Shipping & Maritime Coordination',
        'Critical'
    );
INSERT INTO financial_ledger (
        sender_front_id,
        receiver_alias,
        amount_usd,
        transfer_method,
        transaction_date
    )
SELECT floor(random() * 12 + 1)::INT,
    (
        ARRAY ['Kumar', 'Rajan', 'Maran', 'Selvam', 'Anbu', 'Decoy_A', 'Relief_Worker', 'Civilian']
    ) [floor(random() * 8 + 1)],
    round((random() * 1900 + 100)::numeric, 2),
    (
        ARRAY ['Wire', 'Wire', 'Bank Transfer', 'Credit', 'Crypto', 'Hawala']
    ) [floor(random() * 6 + 1)],
    timestamp '2023-01-01 00:00:00' + random() * (
        timestamp '2025-12-31 00:00:00' - timestamp '2023-01-01 00:00:00'
    )
FROM generate_series(1, 500);
INSERT INTO financial_ledger (
        sender_front_id,
        receiver_alias,
        amount_usd,
        transfer_method,
        transaction_date
    )
VALUES (2, 'Mary', 150000.00, 'Hawala', '2024-03-15'),
    (3, 'Sabesan', 250000.00, 'Crypto', '2024-08-10'),
    (12, 'Guna', 400000.00, 'Hawala', '2024-11-22'),
    (
        12,
        'Pookutti Kanna',
        120000.00,
        'Hawala',
        '2024-12-05'
    ),
    (1, 'Sanjay', 85000.00, 'Crypto', '2025-02-18'),
    (1, 'Naveen', 60000.00, 'Crypto', '2025-03-01'),
    (3, 'Nilan', 500000.00, 'Hawala', '2025-04-10');
INSERT INTO communication_intercepts (
        sender_ip,
        receiver_ip,
        encrypted_message_hash,
        date_intercepted,
        keyword_match
    )
SELECT concat(
        floor(random() * 255)::text,
        '.',
        floor(random() * 255)::text,
        '.1.100'
    ),
    concat(
        '10.0.',
        floor(random() * 255)::text,
        '.',
        floor(random() * 255)::text
    ),
    md5(random()::text),
    timestamp '2023-01-01 00:00:00' + random() * (
        timestamp '2025-12-31 00:00:00' - timestamp '2023-01-01 00:00:00'
    ),
    (
        ARRAY ['family', 'visa', 'ticket', 'transfer', 'medical', 'school', NULL, NULL]
    ) [floor(random() * 8 + 1)]
FROM generate_series(1, 1000);
INSERT INTO communication_intercepts (
        sender_ip,
        receiver_ip,
        encrypted_message_hash,
        date_intercepted,
        keyword_match
    )
VALUES (
        '192.168.99.1',
        '10.0.5.55',
        md5('sabesan_drop'),
        '2024-08-11 02:15:00',
        'Shipment'
    ),
    (
        '192.168.99.1',
        '10.0.8.22',
        md5('guna_camp'),
        '2024-11-23 04:30:00',
        'Procurement'
    ),
    (
        '172.16.0.45',
        '192.168.99.1',
        md5('sanjay_omalur'),
        '2025-02-19 23:45:00',
        'Explosives'
    ),
    (
        '192.168.99.1',
        '10.0.12.88',
        md5('may18_prep'),
        '2025-04-15 01:00:00',
        'Mullivaikkal'
    ),
    (
        '192.168.99.1',
        '10.0.12.88',
        md5('nilan_strike'),
        '2025-05-17 23:59:00',
        'Mullivaikkal'
    );
INSERT INTO smuggling_routes (
        origin_location,
        destination_location,
        cargo_type,
        intercepted_flag
    )
VALUES (
        'Chennai Port',
        'Colombo Port',
        'Textiles',
        FALSE
    ),
    (
        'Tuticorin',
        'Maldives',
        'Agricultural Goods',
        FALSE
    ),
    ('Kochi', 'Dubai', 'Spices', FALSE),
    (
        'Nagapattinam',
        'Jaffna',
        'Fishing Supplies',
        FALSE
    ),
    (
        'Rameswaram, India',
        'Mannar, Sri Lanka',
        'Narcotics (Heroin)',
        TRUE
    ),
    (
        'Karachi, Pakistan',
        'Arabian Sea (Intercepted)',
        'Arms (AK-47s)',
        TRUE
    ),
    (
        'Chennai, India',
        'Jaffna, Sri Lanka',
        'Hawala Cash & Gold',
        FALSE
    ),
    (
        'Tiruchirappalli, India',
        'Colombo, Sri Lanka',
        'Narcotics',
        FALSE
    ),
    (
        'Salem, India',
        'Trincomalee, Sri Lanka',
        'Manufactured Firearms',
        FALSE
    );
INSERT INTO arrest_records (
        operative_id,
        arresting_agency,
        date_of_arrest,
        charges
    )
VALUES (
        11,
        'NIA',
        '2021-10-05',
        'Running international arms and drugs syndicate to fund LTTE revival'
    ),
    (
        15,
        'ATS & NIA',
        '2021-08-16',
        'Intercepted in Arabian Sea with AK-47s and 300kg heroin'
    ),
    (
        12,
        'Q Branch CID / NIA',
        '2022-01-15',
        'Using fake Indian passports to access dormant LTTE bank accounts'
    ),
    (
        17,
        'Tamil Nadu Police',
        '2022-05-19',
        'Omalur Case: Manufacturing firearms for May 18th strikes'
    ),
    (
        18,
        'Tamil Nadu Police',
        '2022-05-19',
        'Omalur Case: Co-conspirator in illegal arms manufacturing'
    ),
    (
        19,
        'NIA',
        '2022-07-25',
        'Supplying materials for illicit gun manufacturing in Salem'
    ),
    (
        13,
        'NIA',
        '2022-12-20',
        'Operating drug mafia from Tiruchirappalli Special Camp'
    ),
    (
        14,
        'NIA',
        '2022-12-20',
        'Assisting Guna in Tiruchirappalli Special Camp network'
    ),
    (
        16,
        'NIA',
        '2023-08-10',
        'Key hawala operator funneling money from diaspora to LTTE cadres'
    );
INSERT INTO safe_houses (
        location_city,
        last_known_activity,
        owner_operative_id
    )
VALUES ('Valasaravakkam, Chennai', '2021-10-01', 11),
    ('Anna Nagar, Chennai', '2022-01-10', 12),
    ('Tiruchirappalli Special Camp', '2022-12-15', 13),
    ('Omalur, Salem', '2022-05-18', 17),
    ('Ramanathapuram Coastal Hut', '2025-05-16', 20),
    ('Madurai Suburbs', '2025-05-17', 21);
INSERT INTO intelligence_reports (
        agency,
        related_operative_id,
        claim_summary,
        credibility_score,
        date_filed
    )
VALUES (
        'Sri Lankan MoD',
        NULL,
        'General alert regarding May 18th Mullivaikkal Remembrance Day protests. Activity deemed low risk.',
        3,
        '2025-04-01'
    ),
    (
        'Interpol',
        12,
        'Alert: Diasporic fronts in Canada and Europe attempting to reactivate dormant LTTE bank accounts.',
        9,
        '2024-02-10'
    ),
    (
        'RAW (India)',
        13,
        'Intelligence confirms Tiruchirappalli camp inmates are coordinating with Pakistani cartels for drug drops.',
        8,
        '2024-09-15'
    ),
    (
        'Tamil Nadu Q Branch',
        17,
        'Raid at Omalur safe house uncovered blueprints for explosive devices intended for May 18th.',
        10,
        '2022-05-20'
    ),
    (
        'NIA Cyber Forensics',
        NULL,
        'Critical: Encrypted traffic originating from IP 192.168.99.1 has spiked. Geolocation ping traces it to the Ramanathapuram district.',
        10,
        '2025-05-10'
    ),
    (
        'NIA Field Intel',
        20,
        'Informants state former Black Tiger cadre "Nilan" has been seen moving equipment near the Ramanathapuram coast.',
        8,
        '2025-05-15'
    );