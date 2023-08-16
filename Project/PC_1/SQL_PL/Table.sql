clear screen;

DROP TABLE alumni_fragment1 CASCADE CONSTRAINTS;
DROP TABLE events_fragment1 CASCADE CONSTRAINTS;
DROP TABLE job_opportunities1 CASCADE CONSTRAINTS;
DROP TABLE fund_fragment1 CASCADE CONSTRAINTS;
DROP TABLE alumni_log CASCADE CONSTRAINTS;
CREATE TABLE alumni_fragment1 (
    alumni_id       NUMBER,
    first_name      VARCHAR2(50),
    last_name       VARCHAR2(50),
    graduation_year NUMBER,
    email           VARCHAR2(100),
    phone_number    VARCHAR2(20),
    address         VARCHAR2(200),
    department      VARCHAR2(100),
    job_title       VARCHAR2(100),
    company         VARCHAR2(100),
    social_media_handles VARCHAR2(200)
);

CREATE TABLE events_fragment1 (
    event_id          NUMBER,
    event_name        VARCHAR2(100),
    event_date        DATE,
    event_location    VARCHAR2(200),
    event_description VARCHAR2(500)
);

CREATE TABLE job_opportunities1 (
    job_id             NUMBER,
    job_title          VARCHAR2(100),
    job_description    VARCHAR2(500),
    job_location       VARCHAR2(200),
    company            VARCHAR2(100),
    job_posting_date   DATE
);

CREATE TABLE fund_fragment1 (
    fund_id           NUMBER,
    alumni_id         NUMBER,
    fund_amount       NUMBER,
    fund_date         DATE,
    fund_purpose      VARCHAR2(200)
);

-- Insert data 
INSERT INTO alumni_fragment1 VALUES (101, 'John', 'Doe', 2010, 'john.doe@example.com', '+1234567890', '123 Main St, City', 'Computer Science', 'Software Engineer', 'ABC Corp', 'john.doe.socialmedia');
INSERT INTO alumni_fragment1 VALUES (102, 'Jane', 'Smith', 2005, 'jane.smith@example.com', '+9876543210', '456 Oak Ave, Town', 'Electrical Engineering', 'Electrical Engineer', 'XYZ Corp', 'jane.smith.socialmedia');
INSERT INTO alumni_fragment1 VALUES (103, 'Michael', 'Johnson', 2012, 'michael.johnson@example.com', '+1112223334', '789 Pine Rd, Village', 'Mechanical Engineering', 'Mechanical Engineer', '123 Industries', 'michael.johnson.socialmedia');
-- Add more data as needed

-- Insert data 
INSERT INTO events_fragment1 VALUES (101, 'Historic Seminar', TO_DATE('2019-11-20', 'YYYY-MM-DD'), 'Historic Venue', 'Seminar that took place a couple of years ago.');
INSERT INTO events_fragment1 VALUES (102, 'Vintage Workshop', TO_DATE('2018-06-05', 'YYYY-MM-DD'), 'Old Workshop Hall', 'Workshop conducted a few years back.');
INSERT INTO events_fragment1 VALUES (103, 'Throwback Conference', TO_DATE('2017-10-12', 'YYYY-MM-DD'), 'Retrospective Center', 'A conference held a few years ago on various topics.');
-- Add more sample data as needed

INSERT INTO job_opportunities1 VALUES (101, 'Software Engineer', 'Looking for a skilled software engineer with experience in Java and web development.', 'City A', 'TechCo', TO_DATE('2023-07-30', 'YYYY-MM-DD'));
INSERT INTO job_opportunities1 VALUES (102, 'Data Analyst', 'Seeking a data analyst to analyze and interpret large datasets.', 'Town B', 'DataAnalytics Inc', TO_DATE('2023-08-15', 'YYYY-MM-DD'));
INSERT INTO job_opportunities1 VALUES (103, 'Marketing Specialist', 'Join our marketing team to promote our products and services.', 'City C', 'MarketTech', TO_DATE('2023-09-02', 'YYYY-MM-DD'));
INSERT INTO job_opportunities1 VALUES (201, 'Project Manager', 'Experienced project manager needed to oversee multiple projects.', 'Town E', 'Project Solutions', TO_DATE('2023-11-10', 'YYYY-MM-DD'));
INSERT INTO job_opportunities1 VALUES (202, 'Business Analyst', 'Join our team to analyze business processes and suggest improvements.', 'City F', 'Business Consultants', TO_DATE('2023-12-05', 'YYYY-MM-DD'));
INSERT INTO job_opportunities1 VALUES (203, 'HR Specialist', 'Seeking an HR specialist to handle employee recruitment and relations.', 'Town G', 'HR Solutions', TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO job_opportunities1 VALUES (204, 'Sales Representative', 'Sales representative needed to promote and sell our products.', 'City H', 'Sales Experts', TO_DATE('2024-02-28', 'YYYY-MM-DD'));
-- Add more sample data as needed

INSERT INTO fund_fragment1 VALUES (101, 101, 500, TO_DATE('2023-07-15', 'YYYY-MM-DD'), 'Education Fund');
INSERT INTO fund_fragment1 VALUES (102, 102, 1000, TO_DATE('2023-08-20', 'YYYY-MM-DD'), 'Medical Fund');
INSERT INTO fund_fragment1 VALUES (103, 103, 250, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'Charity Fund');
INSERT INTO fund_fragment1 VALUES (201, 201, 300, TO_DATE('2023-11-22', 'YYYY-MM-DD'), 'Community Development Fund');
INSERT INTO fund_fragment1 VALUES (202, 202, 800, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'Environmental Fund');
INSERT INTO fund_fragment1 VALUES (203, 203, 1500, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Healthcare Fund');
INSERT INTO fund_fragment1 VALUES (204, 204, 600, TO_DATE('2024-02-18', 'YYYY-MM-DD'), 'Disaster Relief Fund');
-- Add more sample data as needed


commit;