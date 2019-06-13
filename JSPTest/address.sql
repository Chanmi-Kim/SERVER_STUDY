-- address.sql
create table tblAddress (
    seq number primary key,
    name varchar2(30) not null,
    age number(3) not null,
    tel varchar2(15) not null,
    gender varchar2(1) not null,
    address varchar2(100) not null,
    regdate date default sysdate not null
);

create sequence address_seq;

insert into tblAddress (seq, name, age, tel, gender, address)
    values (address_seq.nextval, '홍길동', 20, '010-1234-5678', 'm', '서울시 강남구 역삼동');

select * from tblAddress;



















