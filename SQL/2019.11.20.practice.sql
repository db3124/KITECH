/*
    2019.11.20 Practice
*/

-- 1. 덧셈연산자를 이용하여 모든 사원에 대해서
-- $300의 급여 인상을 계산한 후
-- 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename, sal as "급여", sal+300 as "인상된 급여"
from emp;

-- 2. 사원의 이름, 급여, 연간 총 수입을
-- 총 수입이 많은 것부터 작은 순으로 출력하시오, 
-- 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ename, sal as "급여", sal*12+100 as "연간 총 수입"
from emp
order by sal*12+100 desc
;

-- 3. 급여가 2000을 넘는 사원의 이름과 급여를 표현,
-- 급여가 많은 것부터 작은 순으로 출력하시오.
select ename, sal from emp where sal>2000 order by sal desc;

-- 4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ename, deptno from emp where empno=7788
;

-- 5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
-- (문제의 의미를 급여 2000이상 3000이하로 전제)
select ename, sal from emp where sal<2000 or sal>3000;

-- 6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한
-- 사원의 이름, 담당업무, 입사일을 출력하시오.
-- (문제의 의미를 81/2/20~81/5/1로 전제)
select ename, job, hiredate
from emp
where hiredate between '1981.2.20' and '1981.5.1'
;

-- 7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력,
-- 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select ename, deptno
from emp
where deptno=20 or deptno=30
order by ename
;

-- 8. 사원의 급여가 2000에서 3000사이에 포함되고
-- 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력,
-- 이름순(오름차순)으로 출력하시오.
-- (문제의 의미를 급여 2000이상 3000이하로 전제)
select ename, sal, deptno
from emp
where (sal>=2000 and sal<=3000) and (deptno=20 or deptno=30)
order by ename
;

-- 9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오.
-- (like 연산자와 와일드카드 사용)
select ename, hiredate
from emp
where hiredate like '81/%'
;

-- 10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select ename, job
from emp
where mgr is null
;

-- 11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되
-- 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
-- (comm=0인 경우 자격은 있으나 받지 못하는 것으로 전제)
select ename, sal, comm
from emp
where comm is not null
order by sal desc, comm desc
;

-- 12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ename
from emp
where ename like '__R%'
;

-- 13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ename
from emp
where (ename like '%A%E%') or (ename like '%E%A%')
;

-- 14. 담당업무가 CLERK, 또는 SALESMAN이면서
-- 급여가 $1600, $950 또는 $1300이 아닌
-- 사원의 이름, 담당업무, 급여를 출력하시오.
select ename, job, sal
from emp
where (job='CLERK' or job='SALESMAN') and (not sal in(1600,950,1300))
;

-- 15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
select ename, sal, comm
from emp
where comm>=500
;

-- 16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select SUBSTR(hiredate,0,5) as "입사연월"
from emp
;

-- 17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select *
from emp
where substr(hiredate,0,5) like '___04'
;

-- 18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select *
from emp
where mod(empno,2)=0
;

-- 19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고
-- 요일은 약어 (DY)로 지정하여 출력하시오.
select to_char(hiredate,'YY/MM (DY)') as "입사일"
from emp
;

-- 20. 올해 며칠이 지났는지 출력하시오. 
-- 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고
-- TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
select trunc(sysdate-to_date('2019/01/01', 'YYYY/MM/DD'))
from dual
;

-- 21. 사원들의 상관 사번을 출력하되 
-- 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select nvl(mgr, 0) as "상관의 사번"
from emp
;

-- 22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 
-- 직급이 ‘ANALIST'인 사원은 200, ‘SALESMAN’인 사원은 180,
-- ‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.
select ename, job, sal,
       decode(job, 'ANALIST', sal+200,
                   'SALESMAN', SAL+180,
                   'MANAGER', SAL+150,
                   'CLERK', SAL+100
              )
       as "UpSAL"
from emp
;

-- 23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오.
-- 평균에 대해서는 정수로 반올림하시오.
select max(sal), min(sal), sum(sal), round(avg(sal),0)
from emp
;

-- 24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하시오.
-- 평균에 대해서는 정수로 반올림 하시오.
select job, max(sal), min(sal), sum(sal), round(avg(sal))
from emp
group by job
;

-- 25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select distinct job, count(job)
from emp
group by job
;

-- 26. 관리자 수를 나열하시오.
select count(distinct mgr) as "관리자 수"
from emp
;

-- 27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal)-min(sal)
from emp
;

-- 28. 직급별 사원의 최저 급여를 출력하시오.
-- 관리자를 알 수 없는 사원의 최저 급여가 2000 미만인 그룹은 제외시키고
-- 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
-- (위 서술을 이해하지 못해서…'관리자를 알 수 없는 사원이 속한 그룹+최저 급여가 2000 미만인 그룹 제외'로 풀었습니다.)
select job, min(sal), count(mgr)
from emp
group by job
having min(sal)>=2000 and count(mgr)<>0
order by min(sal) desc
;

select job, min(sal)
from emp
where mgr is not null
group by job
having min(sal)>=2000
;

-- 29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 
-- 평균 급여를 출력하시오.
-- 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno, count(*), round(avg(sal),2)
from emp
group by deptno
;

-- 30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 
-- 부서내의 모든 사원의 평균 급여를 출력하시오. 
-- 평균 급여는 정수로 반올림 하시오. DECODE 사용.
select deptno as "부서번호",
       decode(deptno, 10, 'ACCOUNTING',
                      20, 'RESEARCH',
                      30, 'SALES',
                      40, 'OPERATIONS'
       ) as "부서명",
       decode(deptno, 10, 'NEW YORK',
                      20, 'DALLAS',
                      30, 'CHICAGO',
                      40, 'BOSTON'
       ) as "지역명",
       count(*) as "사원수", round(avg(sal),0) as "평균 급여"
from emp
group by deptno,
         decode(deptno, 10, 'ACCOUNTING',
                        20, 'RESEARCH',
                        30, 'SALES',
                        40, 'OPERATIONS'
        ),
        decode(deptno, 10, 'NEW YORK',
                       20, 'DALLAS',
                       30, 'CHICAGO',
                       40, 'BOSTON'
        )
order by deptno
;

-- 31. 업무를 표시한 다음 해당 업무에 대해 부서 번호별 급여 및
-- 부서 10, 20, 30의 급여 총액을 각각 출력하시오.
-- 별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오. ( hint. Decode, group by )
select job, deptno as "DNO",
       decode(deptno, 10, avg(sal)
       ) as "부서 10",
       decode(deptno, 20, avg(sal)
       ) as "부서 20",
       decode(deptno, 30, avg(sal)
       ) as "부서 30",
       sum(sal) as "총액"
from emp
group by job, deptno
order by deptno
;
