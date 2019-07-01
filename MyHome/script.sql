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
    , (select count(*) from tblComment where pseq = b.seq) as commentcount
    , notice
    , filename
    , thread
    , depth
        from tblBoard b;

select * from
    (select rownum as rnum, a.* from
        (select * from vwBoard where subject like '%아메리카노' order by seq desc) a)
            where rnum between 1 and 10 ;



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
create sequence comment_seq;



select * from tblComment;




-- 게시판 테이블 + 공지사항
create table tblBoard (
    seq number primary key, --글번호(PK)
    id varchar2(50) not null references tblMember(id), --아이디(FK)
    subject varchar2(500) not null, --제목
    content varchar2(4000) not null, --내용
    regdate date default sysdate not null, --시각
    readcount number default 0 not null, --조회수
    userip varchar2(15) not null, --접속 IP 주소
    tag varchar2(1) not null check(tag in ('y', 'n')), --글내용에 HTML 태그 허용
    notice varchar2(1) default 0 not null check(notice in ('1', '0')) --공지사항(1), 일반글(0)
); 

drop table tblBoard;
drop table tblComment;




select seq, notice from tblBoard order by seq desc;





select 0, a.* from vwBoard a where notice = 1 union
기존 sQL;



-- 게시판 테이블 + 첨부 파일
create table tblBoard (
    seq number primary key, --글번호(PK)
    id varchar2(50) not null references tblMember(id), --아이디(FK)
    subject varchar2(500) not null, --제목
    content varchar2(4000) not null, --내용
    regdate date default sysdate not null, --시각
    readcount number default 0 not null, --조회수
    userip varchar2(15) not null, --접속 IP 주소
    tag varchar2(1) not null check(tag in ('y', 'n')), --글내용에 HTML 태그 허용
    notice varchar2(1) default 0 not null check(notice in ('1', '0')), --공지사항(1), 일반글(0)
    filename varchar2(100) null, --첨부파일명(저장될 물리명)
    orgfilename varchar2(100) null, --첨부파일명(사용자 올린 파일명)
    downloadcount number default 0 null --다운로드 횟수
); 

drop table tblComment;
drop table tblBoard;

select * from tblBoard;
    

-- 게시판 테이블 + 답변쓰기
create table tblBoard (
    seq number primary key, --글번호(PK)
    id varchar2(50) not null references tblMember(id), --아이디(FK)
    subject varchar2(500) not null, --제목
    content varchar2(4000) not null, --내용
    regdate date default sysdate not null, --시각
    readcount number default 0 not null, --조회수
    userip varchar2(15) not null, --접속 IP 주소
    tag varchar2(1) not null check(tag in ('y', 'n')), --글내용에 HTML 태그 허용
    notice varchar2(1) default 0 not null check(notice in ('1', '0')), --공지사항(1), 일반글(0)
    filename varchar2(100) null, --첨부파일명(저장될 물리명)
    orgfilename varchar2(100) null, --첨부파일명(사용자 올린 파일명)
    downloadcount number default 0 null, --다운로드 횟수
    thread number not null, --정렬 기준
    depth number not null --출력(들여쓰기)
); 

select * from tblBoard;

delete from tblBoard;
commit;



-- 해시 태그 테이블
create table tblHash (
    seq number primary key,
    tag varchar2(100) not null
    --pseq number not null references tblBoard(seq)
);

-- 게시판 & 해시 사용 테이블
create table tblHashBoard (
    seq number primary key,
    pseq number not null references tblBoard(seq),
    hseq number not null references tblHash(seq)
);

create sequence hash_seq;
create sequence hashboard_seq;

select * from tblHash;
select * from tblHashBoard;
select * from tblBoard;

select h.tag from tblBoard b
    inner join tblHashBoard hb
        on b.seq = hb.pseq
            inner join tblHash h
                on h.seq = hb.hseq
                    where b.seq = 1821;


select * from vwBoard
    where seq in (select pseq from tblHashBoard 
                                    where hseq = (select seq from tblHash where tag = '맛집'));




select * from tblInsa;

-- 전체 직원 > 부서별
-- x : 입사월
-- y : 사원수

create or replace view vwChart
as
select to_char(ibsadate, 'mm') as mon, count(*) as cnt
    from tblInsa 
        group by to_char(ibsadate, 'mm')
            order by to_char(ibsadate, 'mm');






create table tblMonth (
    mon varchar2(2) not null primary key
);
insert into tblMonth values ('01');
insert into tblMonth values ('02');
insert into tblMonth values ('03');
insert into tblMonth values ('04');
insert into tblMonth values ('05');
insert into tblMonth values ('06');
insert into tblMonth values ('07');
insert into tblMonth values ('08');
insert into tblMonth values ('09');
insert into tblMonth values ('10');
insert into tblMonth values ('11');
insert into tblMonth values ('12');



select to_char(i.ibsadate, 'mm') as mon, count(*) as cnt
    from (select * from tblInsa where buseo = '홍보부') i
        right outer join tblMonth m
            on to_char(i.ibsadate, 'mm') = m.mon
                    group by to_char(i.ibsadate, 'mm')
                        order by m.mon;


select m.mon, count(num) as cnt, buseo
    from (select * from tblInsa where buseo = '홍보부') i
        right outer join tblMonth m
            on to_char(i.ibsadate, 'mm') = m.mon
                group by m.mon, i.buseo
                    order by m.mon asc;

select m.mon, count(num) as cnt, nvl(buseo, '홍보부')
    from (select * from tblInsa where buseo = '홍보부') i
        right outer join tblMonth m
            on to_char(i.ibsadate, 'mm') = m.mon
                group by m.mon, i.buseo
                    order by m.mon asc;
