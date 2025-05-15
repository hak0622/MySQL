#학생테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/ 동아리방을 출력하세요.
select a.stdName,a.addr,b.clubName,c.roomNo
from stdtbl a, stdclubtbl b, clubtbl c
where a.stdName = b.stdName and b.clubName = c.clubName
order by a.stdName;
#동아리를 기준으로 가입한 학생의 목록을 출력하세요.
select a.stdName,a.addr,b.clubName,c.roomNo
from stdtbl a, stdclubtbl b, clubtbl c
where a.stdName = b.stdName and b.clubName = c.clubName
order by c.clubName;
#앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요
select a.emp as '부하직원', b.emp as '직속상관',b.empTel as '직속상관연락처'
from emptbl a, emptbl b
where a.emp = b.manager and b.emp = '우대리';
#현재 재직 중인 직원의 정보를 출력하세요.
#출력 항목 : emp_no, first_name, last_name,title
select a.emp_no,a.first_name,a.last_name,b.title
from employees a,titles b
where a.emp_no = b.emp_no and b.to_date = '9999-01-01';
#현재 재직 중인 직원 정보를 출력하세요
#출력 항목 : 직원의 기본 정보 모두, title, salary
select a.*,b.title,c.salary
from employees a,titles b,salaries c
where a.emp_no = b.emp_no and a.emp_no = c.emp_no and b.to_date = '9999-01-01' and c.to_date = '9999-01-01';
#현재 재직중인 직원의 정보를 출력하세요
#출력 항목 : emp_no,first_name,last_name, department
#정렬 : emp_no 오름차순
select a.emp_no,a.first_name,a.last_name,c.dept_name
from employees a,dept_emp b, departments c
where a.emp_no = b.emp_no and b.dept_no = c.dept_no and b.to_date = '9999-01-01'
order by emp_no asc;
#부서별 재직중인 직원의 수를 출력하세요
#출력 항목 : 부서 번호, 부서명, 인원수
select a.dept_no, a.dept_name,count(b.emp_no)
from departments a, dept_emp b
where a.dept_no = b.dept_no and b.to_date = '9999-01-01'
group by a.dept_no,a.dept_name
order by dept_no asc;
#직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요
#출력 항목  : emp_no,first_name,last_name,dept_name,from_date,to_date
select a.emp_no, a.first_name, a.last_name, c.dept_name, b.from_date, b.to_date
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no and b.dept_no = c.dept_no and a.emp_no = 10209
order by b.from_date;
