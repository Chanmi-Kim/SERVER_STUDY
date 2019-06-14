-- auth.sql

drop table tblUser cascade constraint;

select * from tblUser;

create table tblUser (
    id varchar2(30) primary key, --아이디(PK)
    pw varchar2(30) not null, --암호
    name varchar2(30) not null, --이름
    lv number(1) not null --등급(1 - 일반, 2 - 관리자)
);

insert into tblUser values ('hong', '1234', '홍길동', 1);
insert into tblUser values ('test', '1234', '테스트', 1);
insert into tblUser values ('admin', '1234', '관리자', 2);

commit;





