#tabledb 데이터베이스를 생성하세요.
#만일, 이미 존재한다면 삭제하세요.
drop database if exists tabledb;
create database tabledb;
#다음 컬럼을 가지는 usertbl테이블을 만드세요.
drop table if exists usertbl;

create table usertbl(
    userID char(8) not null primary key,
    name varchar(10) not null,
    birthYear int not null,
    addr char(20) not null,
    mobile1 char (3) null,
    mobile2 char(8) null,
    height smallint null,
    mDate date null
);
#다음 컬럼 가지는 buytbl 테이블을 만드세요.
drop table if exists buytbl;

create table buytbl(
    num int auto_increment not null primary key ,
    userid char(8) not null,
    prodName char(6) not null,
    groupName char(4) null,
    price int not null,
    amount smallint not null,
    foreign key (userid) references usertbl(userID)
);
#회원 테이블에 다음 데이터를 입력하세요.
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
#구매테이블에 다음 데이터를 입력하세요.
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
-- 오류 발생 : userid 컬럼이 참조하는 usertbl테이블의 userID 컬럼에 'JYP'가 없음
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
#다음 컬럼을 가지는 usertbl을 정의하세요.
#기존 usertbl이 존재하는 경우 삭제함
#기본키는 테이블 레벨에서 정의하고 제약조건명을 함께 지정함
drop table if exists usertbl;

create table usertbl(
    userID char(8) not null,
    name varchar(10) not null,
    birthYear int not null,
    constraint primary key PK_userTBL_userID(userID)
);
#다음 컬럼을 가지는 prodTbl을 정의하세요.
#기존 prodTbl이 존재하는 경우 삭제함
drop table if exists prodtbl;

create table prodTbl(
    prodCdoe char(3) not null,
    prodID char(4) not null,
    prodDate datetime not null,
    prodCur char(10) null,
    constraint PK_prodTbl_proCode_prodID
        primary key (prodCdoe,prodID)
);
#usertbl과 buytbl을 바탕으로 다음 결과가 나오는 뷰를 정의하세요.
create view v_userbuytbl
as
select U.userid,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) as '연락처'
from usertbl U, buytbl B
where U.userid = B.userid
#위에서 정의한 뷰에서 userid가 '김범수'인 데이터만 출력하세요.
select *
from v_userbuytbl
where name = '김범수';