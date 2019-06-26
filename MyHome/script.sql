-- MyHome > script.sql

-- 회원 테이블
create table tblMember (
    id varchar2(50) primary key, --아이디(PK)
    name varchar2(50) not null, --이름
    pw varchar2(50) not null, --암호
    point number default 1000 not null, --포인트
    lv number(1) not null, --일반회원(1), 관리자(2)
    nick varchar2(50) not null, --별칭
    regdate date default sysdate not null, --가입일
    pic varchar2(50) default 'nopic.png' not null --프로필 사진
);

select * from tblMember;

-- 이순신(admin - 1111)

update tblMember set lv = 2 where id = 'admin';
commit;


-- 게시판 테이블
create table tblBoard (
    seq number primary key, --글번호(PK)
    id varchar2(50) not null references tblMember(id), --아이디(FK)
    subject varchar2(500) not null, --제목
    content varchar2(4000) not null, --내용
    regdate date default sysdate not null, --시각
    readcount number default 0 not null, --조회수
    userip varchar2(15) not null, --접속 IP 주소
    tag varchar2(1) not null check(tag in ('y', 'n')) --글내용에 HTML 태그 허용
); 
create sequence board_seq;

    
select * from tblMember;
select * from tblBoard;












select seq, subject, id, (select name from tblMember where id = b.id) as name, regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap from tblBoard b order by seq desc
0.004490740740740740740740740740740740740741
8





select seq, subject, id, (select name from tblMember where id = b.id) as name
    , regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap 
        from tblBoard b where content like '%테스트%' order by seq desc;

select seq, subject, id, (select name from tblMember where id = b.id) as name
    , regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap 
        from tblBoard b where name like '%길동%' order by seq desc;

select * from vwBoard where name like '%길동%' order by seq desc;
select * from vwBoard where content like '%테스트%' order by seq desc;

select 절 --3
from 절 -- 1
where 절 --2



create or replace view vwBoard
as
select seq, subject, id, (select name from tblMember where id = b.id) as name
    , regdate, readcount, round((sysdate - regdate) * 24 * 60) as gap
    , content
        from tblBoard b;


-- 검색어 수집 테이블
create table tblSearch (   
    seq number primary key, --PK
    columnName varchar2(30) not null, --컬럼명
    word varchar2(200) not null, --검색어
    regdate date default sysdate not null, --검색시각
    id varchar2(30) references tblMember(id) null --FK
);
create sequence search_seq;

select * from tblSearch;

-- 댓글 테이블
create table tblComment (
    seq number primary key, --댓글 번호(PK)
    content varchar2(2000) not null, --댓글 내용
    id varchar2(30) not null references tblMember(id), --댓글 작성자 id
    regdate date default sysdate not null, --작성 시각
    pseq number not null references tblBoard(seq) --부모글번호
);

















