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





















