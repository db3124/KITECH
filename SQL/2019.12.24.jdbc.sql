-- Open Project
-- ȸ�� ���̺� : Member

create table opmember (
    idx number(4) constraint member_idx_pk primary key,
    uemail VARCHAR2(100) unique not null, 
    uname VARCHAR2(100) unique not null, 
    upw VARCHAR2(20) not null,
    gender char(1) check (gender='m' or gender='w') not null,
    byear number(4),
    uphoto varchar2(200)
);

drop table opmember;

create sequence member_idx_seq;
insert into opmember values (member_idx_seq.nextval, 'test@test.com', 'tester', '1111', 'w', '1990', null);
insert into opmember values (member_idx_seq.nextval, ?, ?, ?, ?, ?, ?);

select * from opmember;