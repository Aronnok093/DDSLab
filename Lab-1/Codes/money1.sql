clear screen;
drop table money1;

create table money1(id number, name varchar2(20), taka number);

select * from money1;

insert into money1 values(1, 'A', 400);
insert into money1 values(2,'B',510);
insert into money1 values(4,'D',200);


select * from money1;

commit;        