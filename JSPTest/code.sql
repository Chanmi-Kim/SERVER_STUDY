-- JSPTest > code.sql

-- 수업(공부) 때 기억해야 할 코드+설명 저장
-- 과목 테이블
create table tblCategory (
    seq number primary key, --식별자(PK)
    name varchar2(50) not null,
    color varchar2(20) not null
);

insert into tblCategory values (1, 'Java', 'cornflowerblue');
insert into tblCategory values (2, 'SQL', 'gold');
insert into tblCategory values (3, 'JDBC', 'tomato');
insert into tblCategory values (4, 'HTML', '#5BC45B');
insert into tblCategory values (5, 'CSS', '#AAAEEB');
insert into tblCategory values (6, 'JavaScript', '#404040');
insert into tblCategory values (7, 'Servlet', '#BF5B16');
insert into tblCategory values (8, 'JSP', '#CF7C89');

commit;

select * from tblCategory;

-- 코드 테이블
create table tblCode (
    seq number primary key, --번호(PK)
    subject varchar2(500) not null, --제목
    description varchar2(2000) not null, --설명
    code varchar2(2000) not null, --프로그래밍 코드
    category number not null references tblCategory(seq), --과목(FK)
    regdate date default sysdate not null --등록시각
);

create sequence code_seq;

select * from tblCode;



select seq, subject, category, (select name from tblCategory where seq = c.category) as categoryName
, regdate from tblCode c order by regdate desc;







select * from tblAddress;










