#다음 결과과 나오도록 buytbl에 대한 SQL문을 각각 작성하세요.
select userID as '사용자 아이디',sum(amount) as '총 구매 개수'
from buytbl
group by userID;

select userID as '사용자 아이디',sum(price*amount) '총 구매액'
from buytbl
group by userID;

#다음 결과가 나오도록 buytbl에 대한 SQL문을 각각 작성하세요.
select avg(amount) as '평균 구매 개수'
from buytbl;

select userID, avg(amount) as '평균 구매 개수'
from buytbl
group by userID;

#다음 결과가 나오도록 usertbl에 대한 SQL문을 작성하시오.
# 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
select name,height
from usertbl
where height = (select MAX(height)
                from usertbl)
      or height = (select MIN(height)
                   from usertbl);

#다음 결과가 나오도록 usertbl에 대한 SQL문을 작성하세요.
select count(mobile1) as '휴대폰이 있는 사용자'
from usertbl;

#buytbl 테이블로 다음을 처리하세요.
#사용자별 총 구매액을 출력하세요.
select userID as '사용자',sum(price*amount) as '총구매액'
from buytbl
group by userID;
#총 구매액이 1,000이상인 사용자만 출력하시오.
select userID, sum(price*amount) as '총 구매액'
from buytbl
group by userID
having sum(price*amount)>=1000;

#city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.
select sum(Population)
from city
where CountryCode = 'KOR';
#city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오.
#단 결과를 나타내는 테이블의 필드는 '최소값'으로 표시하시오.
select min(Population) as '최소값'
from city
where CountryCode = 'KOR';
#city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오.
select avg(Population)
from city
where CountryCode = 'KOR';
#city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오.
#단 결과를 나타내는 테이블의 필드는 '최대값'으로 표시하시오.
select max(Population) as '최대값'
from city
where CountryCode = 'KOR';
#country 테이블 각 레코드의 Name 컬럼의 글자수를 표시하시오.
select name,length(name) as'글자수'
from country;
#country 테이블의 나라명(Name 컬럼)을 세글자만 대문자로 표시하시오.
select upper(left(name,3)) as 대문자
from country;
#country 테이블의 기대수명을 소수점 첫째자리에서 반올림해서 표시하시오.
select round(LifeExpectancy,1)
from country;
#employees db에서 각 부서별 관리자를 출력하세오.
select dept_no,dept_name
from departments
group by dept_no;
#부서번호 d005 부서의 현재 관리자 정보를 출력하세오.
select *
from dept_manager
where dept_no = 'd005';
#employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다. 다음 조건하에서 8번 페이지의 데이터를 출력하세요.
#입사일을 내림차순으로 정렬한다.
#한 페이지당 20명의 정보를 출력한다.
select *
from employees
order by hire_date desc
limit 20 offset 140;
#employees db에서 재직자의 총 수를 구하시오.
#재직자의 to_date값은 '9999-01-01'로 저장되어있음
SELECT COUNT(DISTINCT emp_no) AS 재직자수
FROM titles
WHERE to_date = '9999-01-01';
#employees db에서 재직자의 평균 급여를 출력하시오.
select avg(salary)
from salaries
where to_date = '9999-01-01';
#employees db에서 각 부서별 재직자의 수를 구하시오.
#부서 번호를 구분하고, 부서 번호로 오름차순 정렬하여 출력한다.
select dept_no, count(*) AS 재직자수
from dept_emp
where to_date = '9999-01-01'
group by dept_no
order by dept_no asc;
