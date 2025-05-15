#sqldb 데이터베이스에서 다음 조건을 처리하세요.
#사용자별로 구매 이력을 출력함
select userID,prodName
from buytbl
order by userID;
#모든 컬럼을 출력함
select *
from buytbl;
#구매 이력이 없는 정보는 출력하지 않음
select *
from buytbl
where prodName is not null;
#앞의 결과에서 userID가 'JYP'인 데이터만 출력하세요.
select *
from buytbl
where userID = 'JYP';
#sqldb 데이터베이스에서 다음 조건을 처리하세요.
#각 사용자별로 구매 이력을 출력하세요.
#연결 컬럼은 userID로 함
#결과를 userID를 기준으로 오름차순으로 정렬함
#구매이력이 없는 사용자도 출력하세요
#userID,name,prodName,addr,연락처를 다음과 같이 출력함
select a.userID,a.name,b.prodName,a.addr,concat(a.mobile1,a.mobile2) as '연락처'
from usertbl a left outer join buytbl b
on a.userID = b.userID
order by a.userID;
#sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요
select *
from usertbl
where mobile1 is not null;
#sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력하세요
select *
from usertbl
where mobile1 is null;