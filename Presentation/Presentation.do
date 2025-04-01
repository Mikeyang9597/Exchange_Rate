* 데이터 입력
clear
input str9 year students
"2003/04" 572509
"2004/05" 564766
"2006/07" 582984
"2007/08" 623805
"2008/09" 671616
"2009/10" 690923
"2010/11" 723277
"2011/12" 764495
"2012/13" 819644
"2013/14" 886052
"2014/15" 974926
"2015/16" 1043839
"2016/17" 1078822
"2017/18" 1095299
"2018/19" 1095299
"2019/20" 1075496
"2020/21" 914095
"2021/22" 948519
"2022/23" 1057188
end

* 시작 연도 숫자형 추출
gen start_year = real(substr(year, 1, 4))

* 정렬용 순서 변수 생성
gen year_order = _n

* 학생 수를 천 단위로 변환
gen students_k = students / 1000

* 시작 연도 라벨 정의
label define start_years ///
    1 "2003" 2 "2004" 3 "2006" 4 "2007" 5 "2008" ///
    6 "2009" 7 "2010" 8 "2011" 9 "2012" 10 "2013" ///
    11 "2014" 12 "2015" 13 "2016" 14 "2017" 15 "2018" ///
    16 "2019" 17 "2020" 18 "2021" 19 "2022"
label values year_order start_years

* 그래프: 얇은 선 + 각 포인트 동그라미 점 추가
twoway ///
    (line students_k year_order, lwidth(thin) lcolor(navy)) ///
    (scatter students_k year_order, mcolor(navy) msymbol(circle) msize(medium)), ///
    xtitle("Academic Year") ytitle("Number of Students (Thousands)") ///
    xlabel(1(2)19, valuelabel angle(45) labsize(small)) ///
    ylabel(, format(%9.0gc)) ///
    legend(off)
