clear screen;

DROP TABLE alumni_fragment1 CASCADE CONSTRAINTS;
DROP TABLE events_fragment1 CASCADE CONSTRAINTS;
DROP TABLE job_opportunities1 CASCADE CONSTRAINTS;
DROP TABLE fund_fragment1 CASCADE CONSTRAINTS;

CREATE TABLE alumni_fragment2 (
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

CREATE TABLE events_fragment2 (
    event_id          NUMBER,
    event_name        VARCHAR2(100),
    event_date        DATE,
    event_location    VARCHAR2(200),
    event_description VARCHAR2(500)
);

CREATE TABLE job_opportunities2 (
    job_id             NUMBER,
    job_title          VARCHAR2(100),
    job_description    VARCHAR2(500),
    job_location       VARCHAR2(200),
    company            VARCHAR2(100),
    job_posting_date   DATE
);

CREATE TABLE fund_fragment2 (
    fund_id           NUMBER,
    alumni_id         NUMBER,
    fund_amount       NUMBER,
    fund_date         DATE,
    fund_purpose      VARCHAR2(200)
);
INSERT INTO alumni_fragment2 VALUES (201, 'Emily', 'Brown', 2016, 'emily.brown@example.com', '+7778889999', '789 Oak St, Village', 'Civil Engineering', 'Civil Engineer', 'CivilTech', 'emily.brown.socialmedia');
INSERT INTO alumni_fragment2 VALUES (202, 'Daniel', 'Lee', 2017, 'daniel.lee@example.com', '+5556667777', '456 Maple Ave, Town', 'Electrical Engineering', 'Electrical Engineer', 'Electricity Inc', 'daniel.lee.socialmedia');
INSERT INTO alumni_fragment2 VALUES (203, 'Sophia', 'Wilson', 2019, 'sophia.wilson@example.com', '+2223334444', '123 Pine Rd, City', 'Computer Science', 'Software Developer', 'TechCo', 'sophia.wilson.socialmedia');
INSERT INTO alumni_fragment2 VALUES (204, 'Oliver', 'Martinez', 2020, 'oliver.martinez@example.com', '+9990001111', '987 Elm St, Hamlet', 'Mechanical Engineering', 'Mechanical Engineer', 'MechTech', 'oliver.martinez.socialmedia');
-- Add more sample data as needed


INSERT INTO events_fragment2 VALUES (201, 'Conference A', TO_DATE('2023-07-30', 'YYYY-MM-DD'), 'City Convention Center', 'Annual technology conference focusing on AI and emerging technologies.');
INSERT INTO events_fragment2 VALUES (202, 'Workshop B', TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Company Office, Town', 'Hands-on workshop on database management and optimization.');
INSERT INTO events_fragment2 VALUES (203, 'Seminar C', TO_DATE('2023-09-02', 'YYYY-MM-DD'), 'University Auditorium', 'Guest speakers discussing future trends in cybersecurity.');
INSERT INTO events_fragment2 VALUES (204, 'Exhibition D', TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'Art Gallery, Village', 'Art exhibition featuring local artists and their latest works.');
-- Add more sample data as needed

INSERT INTO job_opportunities2 VALUES (201, 'Project Manager', 'Experienced project manager needed to oversee multiple projects.', 'Town E', 'Project Solutions', TO_DATE('2023-11-10', 'YYYY-MM-DD'));
INSERT INTO job_opportunities2 VALUES (202, 'Business Analyst', 'Join our team to analyze business processes and suggest improvements.', 'City F', 'Business Consultants', TO_DATE('2023-12-05', 'YYYY-MM-DD'));
INSERT INTO job_opportunities2 VALUES (203, 'HR Specialist', 'Seeking an HR specialist to handle employee recruitment and relations.', 'Town G', 'HR Solutions', TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO job_opportunities2 VALUES (204, 'Sales Representative', 'Sales representative needed to promote and sell our products.', 'City H', 'Sales Experts', TO_DATE('2024-02-28', 'YYYY-MM-DD'));
-- Add more sample data as needed

INSERT INTO fund_fragment2 VALUES (201, 201, 300, TO_DATE('2023-11-22', 'YYYY-MM-DD'), 'Community Development Fund');
INSERT INTO fund_fragment2 VALUES (202, 202, 800, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'Environmental Fund');
INSERT INTO fund_fragment2 VALUES (203, 203, 1500, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Healthcare Fund');
INSERT INTO fund_fragment2 VALUES (204, 204, 600, TO_DATE('2024-02-18', 'YYYY-MM-DD'), 'Disaster Relief Fund');
-- Add more sample data as needed

commit;