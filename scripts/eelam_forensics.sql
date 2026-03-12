-- ==============================================================================
-- SQL War: Round 3 - The Echoes of Eelam (Intelligence Forensics)
-- Step 1: Schema and Relations Setup
-- Database: PostgreSQL
-- ==============================================================================

-- Create the designated schema
--CREATE SCHEMA IF NOT EXISTS EELAM_FORENSICS;
--SET search_path TO EELAM_FORENSICS;

-- 1. DROP EXISTING TABLES (Reverse order of dependencies to avoid foreign key conflicts)
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

-- ==============================================================================
-- 2. CREATE TABLES
-- ==============================================================================

-- Table 1: Historical Command Structure (Based on LTTE organizational chart)
CREATE TABLE historical_command_structure (
    division_id SERIAL PRIMARY KEY,
    wing_name VARCHAR(100) NOT NULL,
    historical_commander VARCHAR(100),
    current_status VARCHAR(50) 
);

-- Table 2: Known Operatives (Historical members and current suspects)
CREATE TABLE known_operatives (
    operative_id SERIAL PRIMARY KEY,
    alias VARCHAR(100) NOT NULL,
    real_name VARCHAR(150),
    prior_wing_id INT REFERENCES historical_command_structure(division_id),
    status VARCHAR(50) 
);

-- Table 3: Amnesty Records (Tracking the 2024 Presidential pardons)
CREATE TABLE amnesty_records (
    record_id SERIAL PRIMARY KEY,
    operative_id INT REFERENCES known_operatives(operative_id),
    pardon_date DATE NOT NULL,
    release_location VARCHAR(100),
    monitoring_status VARCHAR(50) 
);

-- Table 4: Diaspora Fronts (International organizations and funding sources)
CREATE TABLE diaspora_fronts (
    front_id SERIAL PRIMARY KEY,
    organization_name VARCHAR(150) NOT NULL,
    country_of_operation VARCHAR(100),
    public_mission TEXT,
    risk_level VARCHAR(50) 
);

-- Table 5: Financial Ledger (Hawala networks, crypto, and wire transfers)
CREATE TABLE financial_ledger (
    transaction_id SERIAL PRIMARY KEY,
    sender_front_id INT REFERENCES diaspora_fronts(front_id),
    receiver_alias VARCHAR(100), 
    amount_usd NUMERIC(15, 2) NOT NULL,
    transfer_method VARCHAR(50), 
    transaction_date DATE NOT NULL
);

-- Table 6: Smuggling Routes (Tracking arms and narcotics movement)
CREATE TABLE smuggling_routes (
    route_id SERIAL PRIMARY KEY,
    origin_location VARCHAR(100) NOT NULL,
    destination_location VARCHAR(100) NOT NULL,
    cargo_type VARCHAR(100), 
    intercepted_flag BOOLEAN DEFAULT FALSE
);

-- Table 7: Arrest Records (Recent NIA crackdowns in Tamil Nadu)
CREATE TABLE arrest_records (
    arrest_id SERIAL PRIMARY KEY,
    operative_id INT REFERENCES known_operatives(operative_id),
    arresting_agency VARCHAR(100), 
    date_of_arrest DATE NOT NULL,
    charges TEXT NOT NULL
);

-- Table 8: Communication Intercepts (Digital surveillance logs)
CREATE TABLE communication_intercepts (
    intercept_id SERIAL PRIMARY KEY,
    sender_ip VARCHAR(45),
    receiver_ip VARCHAR(45),
    encrypted_message_hash TEXT,
    date_intercepted TIMESTAMP NOT NULL,
    keyword_match VARCHAR(100) 
);

-- Table 9: Safe Houses (Locations used by operatives)
CREATE TABLE safe_houses (
    house_id SERIAL PRIMARY KEY,
    location_city VARCHAR(100) NOT NULL,
    last_known_activity DATE,
    owner_operative_id INT REFERENCES known_operatives(operative_id)
);

-- Table 10: Intelligence Reports (Aggregated claims and global intelligence)
CREATE TABLE intelligence_reports (
    report_id SERIAL PRIMARY KEY,
    agency VARCHAR(100) NOT NULL,
    related_operative_id INT REFERENCES known_operatives(operative_id),
    claim_summary TEXT NOT NULL,
    credibility_score INT CHECK (credibility_score BETWEEN 1 AND 10),
    date_filed DATE NOT NULL
);

-- ==============================================================================
-- POPULATE TABLE 1: historical_command_structure
-- Grounded in actual LTTE military and political divisions.
-- ==============================================================================

INSERT INTO historical_command_structure (wing_name, historical_commander, current_status) VALUES
('Military Secretariat', 'Velupillai Prabhakaran', 'Dismantled'),
('Intelligence Wing (TOSIS)', 'Pottu Amman', 'Dismantled'),
('Sea Tigers (Naval Wing)', 'Thillaiyampalam Sivanesan (Soosai)', 'Dismantled'),
('Air Tigers (Air Wing)', 'Achchuthan', 'Dismantled'),
('Black Tigers (Suicide Wing)', 'Various (First: Captain Miller)', 'Unknown'),
('Political Wing', 'S. P. Thamilselvan / Nadesan', 'Dismantled'),
('International Secretariat / Procurement', 'Kumaran Pathmanathan (KP)', 'Rebranding'),
('Charles Anthony Special Brigade', 'Balraj / Amithab', 'Dismantled'),
('Jeyanthan Brigade', 'Col. Jeyam', 'Dismantled'),
('Imran Pandian Regiment', 'Rada', 'Dismantled'),
('Radha Anti-Aircraft Regiment', 'Col. Ramanan', 'Dismantled'),
('Malathi Women''s Regiment', 'Vidusha', 'Dismantled'),
('Sothiya Women''s Regiment', 'Durga', 'Dismantled'),
('Kittu Artillery Brigade', 'Bhanu', 'Dismantled'),
('Victor Anti-Armor Brigade', 'Ilango', 'Dismantled'),
('Ponnamman Mining Unit', 'Ponnamman', 'Dismantled'),
('Finance Wing', 'Thamilendi', 'Dismantled'),
('Media and Broadcasting (Voice of Tigers)', 'Nidarshan', 'Dismantled'),
('Medical Wing', 'Dr. Thileepan', 'Dismantled'),
('Eelam Police', 'B. Nadesan', 'Dismantled');

-- Verify the insertion
-- SELECT * FROM historical_command_structure;

-- ==============================================================================
-- POPULATE TABLE 2: known_operatives
-- Grounded in actual historical LTTE leadership and recent NIA arrest records.
-- Note: prior_wing_id maps directly to the SERIAL IDs generated in Table 1.
-- ==============================================================================

INSERT INTO known_operatives (alias, real_name, prior_wing_id, status) VALUES
-- THE HISTORICAL GHOSTS (Legacy Leadership)
('Thambi', 'Velupillai Prabhakaran', 1, 'Deceased'),
('Pottu Amman', 'Shanmugalingam Sivashankar', 2, 'Deceased'),
('Soosai', 'Thillaiyampalam Sivanesan', 3, 'Deceased'),
('KP', 'Kumaran Pathmanathan', 7, 'Pardoned'),
('Karuna Amman', 'Vinayagamoorthy Muralitharan', 9, 'Pardoned'),
('Pillayan', 'Sivanesathurai Chandrakanthan', 8, 'Pardoned'),
('Thamilselvan', 'S. P. Thamilselvan', 6, 'Deceased'),
('Thamilendi', 'Unknown', 17, 'Deceased'),

-- THE 2014 RESURGENCE ATTEMPT
('Gopi', 'Gopithasan', 2, 'Deceased'),
('Theiveegan', 'Unknown', 5, 'Deceased'),

-- THE MODERN NEXUS (Recent NIA Arrests: 2021 - 2024)
('Sabesan', 'Satkunam', 2, 'Arrested'),           -- 2021: Chennai arms/drugs kingpin
('Mary', 'Mary Francisco', 17, 'Arrested'),        -- 2022: Chennai Airport, hawala & dormant accounts
('Guna', 'C. Gunashekharan', 7, 'Arrested'),       -- 2022: Tiruchirappalli camp drug/arms mafia
('Pookutti Kanna', 'Pushparajah', 7, 'Arrested'),  -- 2022: Tiruchirappalli camp mafia associate
('Suresh', 'Suresh Raj', 3, 'Arrested'),           -- 2021: Arrested off Arabian Sea with AK-47s
('Adi Lingam', 'Lingam A.', 17, 'Arrested'),       -- 2023: Arrested in Chennai for funding revival
('Sanjay', 'Sanjay Prakash', 1, 'Arrested'),       -- 2022: Omalur Arms Case (May 18 plot)
('Naveen', 'Naveen Chakravarthy', 1, 'Arrested'),  -- 2022: Omalur Arms Case (May 18 plot)
('Kabilan', 'A. Kabilar', 1, 'Arrested'),          -- 2022: Gun manufacturer for Omalur plot

-- THE UNKNOWN/ACTIVE THREATS (For our fictional May 18th plot)
('Nilan', 'Nilavan P.', 5, 'Active'),              -- Suspected Black Tiger regrouping
('Kannan', 'Kannan V.', 7, 'Active');              -- Suspected new Procurement lead

-- Verify the insertion
-- SELECT * FROM known_operatives;

-- ==============================================================================
-- POPULATE TABLE 3: amnesty_records & ADDING NOISE TO TABLE 2
-- Context: Mixing historical high-profile amnesties with the January 2024 
-- Presidential pardons, plus some decoy operatives.
-- ==============================================================================

-- First, let's insert a few "Noise" operatives into Table 2 so we have 
-- low-level individuals to pardon who aren't part of the main conspiracy.
INSERT INTO known_operatives (alias, real_name, prior_wing_id, status) VALUES
('Selvam', 'Selvanayagam V.', 14, 'Pardoned'), -- Noise
('Bala', 'Balakrishnan M.', 16, 'Pardoned'),   -- Noise
('Maran', 'Maran T.', 13, 'Pardoned'),         -- Noise
('Anbu', 'Anbarasan K.', 10, 'Pardoned');      -- Noise

-- Now populate Table 3 with real historical timelines and recent news.
-- Operative IDs 4, 5, 6 correspond to KP, Karuna, and Pillayan from Table 2.
-- The newly inserted IDs (22-25) will be our recent 2024 pardons.
INSERT INTO amnesty_records (operative_id, pardon_date, release_location, monitoring_status) VALUES
-- THE HISTORICAL INTEGRATIONS
(4, '2012-10-01', 'Kilinochchi', 'Cleared'),    -- KP (Kumaran Pathmanathan)
(5, '2007-04-15', 'Colombo', 'Cleared'),        -- Karuna Amman
(6, '2008-10-01', 'Batticaloa', 'Cleared'),     -- Pillayan

-- THE 2024 PRESIDENTIAL PARDONS (Mix of monitored and absconded)
(22, '2024-01-14', 'Jaffna', 'Monitored'),      -- Noise (Low level)
(23, '2024-01-14', 'Trincomalee', 'Monitored'), -- Noise (Low level)
(24, '2023-12-25', 'Vavuniya', 'Absconded'),    -- Decoy: Absconded, but not part of the plot
(25, '2024-01-14', 'Colombo', 'Cleared');       -- Noise (Low level)


-- ==============================================================================
-- POPULATE TABLE 4: diaspora_fronts
-- Context: Real-world organizations historically investigated for fundraising, 
-- mixed with completely fictional decoy NGOs.
-- ==============================================================================

INSERT INTO diaspora_fronts (organization_name, country_of_operation, public_mission, risk_level) VALUES
-- THE REAL-WORLD INVESTIGATED FRONTS (Historically tracked by global intelligence)
('Transnational Government of Tamil Eelam (TGTE)', 'USA', 'Political Advocacy & Lobbying', 'High'),
('World Tamil Movement (WTM)', 'Canada', 'Community Support & Fundraising', 'Critical'),
('Tamil Rehabilitation Organization (TRO)', 'Global', 'Disaster Relief & Orphanages', 'Critical'),
('British Tamil Forum (BTF)', 'UK', 'Human Rights Lobbying', 'High'),
('Tamil Coordinating Committee (TCC)', 'Norway', 'Cultural Events & Diaspora Unity', 'High'),
('National Council of Canadian Tamils (NCCT)', 'Canada', 'Diaspora Representation', 'Medium'),

-- THE FICTIONAL DECOYS / NOISE (To confuse participants doing basic keyword searches)
('South Asian Refugee Coalition', 'Switzerland', 'Asylum & Visa Support', 'Low'),
('Geneva Tamil Heritage Society', 'Switzerland', 'Cultural Preservation & Arts', 'Low'),
('Colombo Unity Foundation', 'Sri Lanka', 'Post-War Reconciliation Programs', 'Low'),
('Global South Medical Aid', 'Australia', 'Medical Supply Distribution', 'Low'),
('Eelam Arts & Literature Guild', 'France', 'Publishing & Literature Translation', 'Medium'),

-- THE MODERN SYNDICATE FRONT (Our fictionalized front for the current game plot)
('Oceanic Logistics NGO', 'Malaysia', 'Shipping & Maritime Coordination', 'Critical');

-- Verify the insertions
-- SELECT * FROM amnesty_records;
-- SELECT * FROM diaspora_fronts;

-- ==============================================================================
-- POPULATE TABLE 5: financial_ledger (The Money Trail)
-- Generating 5,000 noise transactions, then inserting the actual syndicate plot.
-- ==============================================================================

-- 1. Generate 500 "Noise" Transactions (Low level wire transfers, legitimate aid)
INSERT INTO financial_ledger (sender_front_id, receiver_alias, amount_usd, transfer_method, transaction_date)
SELECT 
    -- Randomly assign to one of the 12 diaspora fronts
    floor(random() * 12 + 1)::INT, 
    -- Random decoy aliases
    (ARRAY['Kumar', 'Rajan', 'Maran', 'Selvam', 'Anbu', 'Decoy_A', 'Relief_Worker', 'Civilian'])[floor(random() * 8 + 1)],
    -- Random small amounts between $100 and $2,000
    round((random() * 1900 + 100)::numeric, 2),
    -- Mostly legitimate transfers, rarely Hawala/Crypto
    (ARRAY['Wire', 'Wire', 'Bank Transfer', 'Credit', 'Crypto', 'Hawala'])[floor(random() * 6 + 1)],
    -- Random dates between Jan 2023 and Dec 2025
    timestamp '2023-01-01 00:00:00' + random() * (timestamp '2025-12-31 00:00:00' - timestamp '2023-01-01 00:00:00')
FROM generate_series(1, 500);

-- 2. Insert the "Signal" (The real hawala network funding the May 18th Resurgence Plot)
-- These tie back to the real-world NIA arrests (Sabesan, Mary, Guna, Sanjay)
INSERT INTO financial_ledger (sender_front_id, receiver_alias, amount_usd, transfer_method, transaction_date) VALUES
(2, 'Mary', 150000.00, 'Hawala', '2024-03-15'),      -- WTM Canada funding Mary (Dormant accounts plot)
(3, 'Sabesan', 250000.00, 'Crypto', '2024-08-10'),   -- TRO funding Sabesan (Drugs/Arms plot)
(12, 'Guna', 400000.00, 'Hawala', '2024-11-22'),     -- Oceanic Logistics funding Guna (Tiruchirappalli camp)
(12, 'Pookutti Kanna', 120000.00, 'Hawala', '2024-12-05'), 
(1, 'Sanjay', 85000.00, 'Crypto', '2025-02-18'),     -- TGTE funding the Omalur arms case 
(1, 'Naveen', 60000.00, 'Crypto', '2025-03-01'),     -- Omalur plot (Leading up to May 18)
(3, 'Nilan', 500000.00, 'Hawala', '2025-04-10');     -- Massive funding right before Mullivaikkal day


-- ==============================================================================
-- POPULATE TABLE 8: communication_intercepts (The Digital Footprint)
-- Generating 10,000 noise pings, then inserting the actual plot communications.
-- ==============================================================================

-- 1. Generate 1000 "Noise" Intercepts (Everyday internet traffic, harmless keywords)
INSERT INTO communication_intercepts (sender_ip, receiver_ip, encrypted_message_hash, date_intercepted, keyword_match)
SELECT 
    -- Generate random IP-like strings
    concat(floor(random() * 255)::text, '.', floor(random() * 255)::text, '.1.100'),
    concat('10.0.', floor(random() * 255)::text, '.', floor(random() * 255)::text),
    md5(random()::text),
    timestamp '2023-01-01 00:00:00' + random() * (timestamp '2025-12-31 00:00:00' - timestamp '2023-01-01 00:00:00'),
    (ARRAY['family', 'visa', 'ticket', 'transfer', 'medical', 'school', NULL, NULL])[floor(random() * 8 + 1)]
FROM generate_series(1, 1000);

-- 2. Insert the "Signal" (The encrypted chatter intercepted by the NIA/Intelligence)
-- Note: The IP '192.168.99.1' will act as the "Master Node" for the plot. We will tie this to a Safe House later!
INSERT INTO communication_intercepts (sender_ip, receiver_ip, encrypted_message_hash, date_intercepted, keyword_match) VALUES
('192.168.99.1', '10.0.5.55', md5('sabesan_drop'), '2024-08-11 02:15:00', 'Shipment'),
('192.168.99.1', '10.0.8.22', md5('guna_camp'), '2024-11-23 04:30:00', 'Procurement'),
('172.16.0.45', '192.168.99.1', md5('sanjay_omalur'), '2025-02-19 23:45:00', 'Explosives'),
('192.168.99.1', '10.0.12.88', md5('may18_prep'), '2025-04-15 01:00:00', 'Mullivaikkal'),
('192.168.99.1', '10.0.12.88', md5('nilan_strike'), '2025-05-17 23:59:00', 'Mullivaikkal');

-- Verify the insertions (DO NOT SELECT * on 15,000 rows, use COUNT instead!)
-- SELECT COUNT(*) FROM financial_ledger;
-- SELECT COUNT(*) FROM communication_intercepts;

-- ==============================================================================
-- POPULATE TABLE 6: smuggling_routes
-- Context: Mixing legitimate shipping routes with actual intercepted arms/drugs routes.
-- ==============================================================================

INSERT INTO smuggling_routes (origin_location, destination_location, cargo_type, intercepted_flag) VALUES
-- The Noise (Legitimate or unverified routes)
('Chennai Port', 'Colombo Port', 'Textiles', FALSE),
('Tuticorin', 'Maldives', 'Agricultural Goods', FALSE),
('Kochi', 'Dubai', 'Spices', FALSE),
('Nagapattinam', 'Jaffna', 'Fishing Supplies', FALSE),

-- The Signal (The Syndicate's Routes)
('Rameswaram, India', 'Mannar, Sri Lanka', 'Narcotics (Heroin)', TRUE),       -- Linked to Sabesan's network
('Karachi, Pakistan', 'Arabian Sea (Intercepted)', 'Arms (AK-47s)', TRUE),    -- Linked to Suresh Raj
('Chennai, India', 'Jaffna, Sri Lanka', 'Hawala Cash & Gold', FALSE),         -- Linked to Mary Francisco
('Tiruchirappalli, India', 'Colombo, Sri Lanka', 'Narcotics', FALSE),         -- Linked to Guna's camp
('Salem, India', 'Trincomalee, Sri Lanka', 'Manufactured Firearms', FALSE);   -- Linked to the Omalur plot


-- ==============================================================================
-- POPULATE TABLE 7: arrest_records
-- Context: Tying directly to the real-world NIA arrests in Tamil Nadu.
-- Note: operative_ids match the sequence generated in Table 2.
-- Sabesan(11), Mary(12), Guna(13), Pookutti(14), Suresh(15), Lingam(16), Sanjay(17), Naveen(18), Kabilan(19)
-- ==============================================================================

INSERT INTO arrest_records (operative_id, arresting_agency, date_of_arrest, charges) VALUES
(11, 'NIA', '2021-10-05', 'Running international arms and drugs syndicate to fund LTTE revival'),
(15, 'ATS & NIA', '2021-08-16', 'Intercepted in Arabian Sea with AK-47s and 300kg heroin'),
(12, 'Q Branch CID / NIA', '2022-01-15', 'Using fake Indian passports to access dormant LTTE bank accounts'),
(17, 'Tamil Nadu Police', '2022-05-19', 'Omalur Case: Manufacturing firearms for May 18th strikes'),
(18, 'Tamil Nadu Police', '2022-05-19', 'Omalur Case: Co-conspirator in illegal arms manufacturing'),
(19, 'NIA', '2022-07-25', 'Supplying materials for illicit gun manufacturing in Salem'),
(13, 'NIA', '2022-12-20', 'Operating drug mafia from Tiruchirappalli Special Camp'),
(14, 'NIA', '2022-12-20', 'Assisting Guna in Tiruchirappalli Special Camp network'),
(16, 'NIA', '2023-08-10', 'Key hawala operator funneling money from diaspora to LTTE cadres');


-- ==============================================================================
-- POPULATE TABLE 9: safe_houses
-- Context: Real locations of arrests, plus the active hideout for the fictional plot.
-- ==============================================================================

INSERT INTO safe_houses (location_city, last_known_activity, owner_operative_id) VALUES
('Valasaravakkam, Chennai', '2021-10-01', 11),       -- Sabesan's old base
('Anna Nagar, Chennai', '2022-01-10', 12),           -- Mary Francisco's base
('Tiruchirappalli Special Camp', '2022-12-15', 13),  -- Guna's base
('Omalur, Salem', '2022-05-18', 17),                 -- Sanjay's gun manufacturing facility

-- THE ACTIVE TARGETS (The un-arrested operatives orchestrating the current threat)
('Ramanathapuram Coastal Hut', '2025-05-16', 20),    -- Nilan (Black Tiger)
('Madurai Suburbs', '2025-05-17', 21);               -- Kannan (Procurement)


-- ==============================================================================
-- POPULATE TABLE 10: intelligence_reports
-- Context: The narrative clues that tie the IP addresses and money to the physical locations.
-- ==============================================================================

INSERT INTO intelligence_reports (agency, related_operative_id, claim_summary, credibility_score, date_filed) VALUES
('Sri Lankan MoD', NULL, 'General alert regarding May 18th Mullivaikkal Remembrance Day protests. Activity deemed low risk.', 3, '2025-04-01'),
('Interpol', 12, 'Alert: Diasporic fronts in Canada and Europe attempting to reactivate dormant LTTE bank accounts.', 9, '2024-02-10'),
('RAW (India)', 13, 'Intelligence confirms Tiruchirappalli camp inmates are coordinating with Pakistani cartels for drug drops.', 8, '2024-09-15'),
('Tamil Nadu Q Branch', 17, 'Raid at Omalur safe house uncovered blueprints for explosive devices intended for May 18th.', 10, '2022-05-20'),
('NIA Cyber Forensics', NULL, 'Critical: Encrypted traffic originating from IP 192.168.99.1 has spiked. Geolocation ping traces it to the Ramanathapuram district.', 10, '2025-05-10'),
('NIA Field Intel', 20, 'Informants state former Black Tiger cadre "Nilan" has been seen moving equipment near the Ramanathapuram coast.', 8, '2025-05-15');

-- Verification
-- SELECT * FROM arrest_records;
-- SELECT * FROM intelligence_reports;