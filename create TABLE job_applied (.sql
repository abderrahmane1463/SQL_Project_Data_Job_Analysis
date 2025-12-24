create TABLE job_applied (
job_id INT ,
application_sent_date date , 
custom_resume boolean , 
resume_file_name varchar(225), 
cover_later_sent boolean , 
cover_later_file_name varchar(225),
status varchar(50)

);

select * 
from job_applied; 


INSERT INTO job_applied (
job_id  ,
application_sent_date , 
custom_resume , 
resume_file_name , 
cover_later_sent , 
cover_later_file_name ,
status 
)
values (1,
'2024-02-01',
true,
'resume_01.pdf',
true,
'cover_later_01.pdf',
'submitted'),(
    2,
'2024-02-02',
false,
'resume_02.pdf',
false,
'cover_later_02.pdf',
null
),(
 3,
'2024-02-03',
true,
'resume_03.pdf',
true,
'cover_later_03.pdf',
'ghosted'    
),(
4,
'2024-02-04',
false,
'resume_04.pdf',
true,
'cover_later_04.pdf',
'rejected' 
);

select*
from job_applied ;

ALTER TABLE job_applied
add contact varchar(50);

UPDATE job_applied
SET contact = 'Erlish Bashman'
WHERE job_id = 1 ;
UPDATE job_applied
SET contact = 'Houssam Ch'
WHERE job_id = 2 ;
UPDATE job_applied
SET contact = 'Sinwar Sinwr'
WHERE job_id = 3 ;
UPDATE job_applied
SET contact = 'Fir9a 4'
WHERE job_id = 4 ;


ALTER TABLE job_applied 
rename column contact to contact_name ;

ALTER TABLE job_applied 
ALTER column contact_name type text ;

ALTER TABLE job_applied 
drop column  contact_name ;

drop TABLE job_applied ; 