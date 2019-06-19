-- ajax.sql

-- 설문 조사
create table tblResearch (
    seq number primary key,                 --PK
    question varchar2(500) not null,    --질문
    item1 varchar2(300) not null,         -- 항목1~4
    item2 varchar2(300) not null,
    item3 varchar2(300) not null,
    item4 varchar2(300) not null,
    cnt1 number default 0 not null,     --선택1~4
    cnt2 number default 0 not null,
    cnt3 number default 0 not null,
    cnt4 number default 0 not null
);









