<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/demo/resources/css/calendar.css">
	<script src="/demo/resources/js/jquery-1.12.4.js"></script>
</head>
<body>
	 <div id="frame">
        <div class="subFrame">
            <div id="date">
                <div>⦁기간</div>
                <div class="inputBox">
                    <input type="date" class="input">
                    <button class="btn">D</button>
                </div>
                <span> ~ </span>
                <div class="inputBox">
                    <input type="date" class="input">
                    <button class="btn">D</button>
                </div>
                <button id="search">조회</button>
            </div>
            <div id="dateOut">
                <span id="year"></span><span>년</span>
                <span id="month"></span>
            </div>
            <div id="calendar">
                <table>
                    <tr>
                        <td>Sun</td>
                        <td>Mon</td>
                        <td>Tue</td>
                        <td>Wed</td>
                        <td>Thu</td>
                        <td>Fri</td>
                        <td>Sat</td>
                    </tr>
                    <tr>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                    </tr>
                    <tr>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                    </tr>
                    <tr>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                    </tr>
                    <tr>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                    </tr>
                    <tr>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                        <td class="day"></td>
                    </tr>
                </table>
            </div>
            <div id="clickBtn">
                <div>
                    <button id="pre">◀</button>
                    <span>Pre</span>
                </div>
                <div>
                    <button id="next">▶</button>
                    <span>Next</span>
                </div>
            </div>
            <div id="outBtn">
                선택된 일자 : 
                <span id="selectDay"></span>(요일)  <span id="selectYear"></span>년<span id="selectMonth"></span>월<span id="selectDays"></span>일
                <br>
                <button id="apply">적용</button>
            </div>
        </div>
        <div class="subFrame">
            <div id="output">
                <table>
                    <tr>
                        <td>일자</td>
                        <td>요일</td>
                        <td>국경일</td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="outDate">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    
	<script>

        var Month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var selectDay = ["일", "월", "화", "수", "목", "금", "토"];
        var clickDate = "";
        var clickYear = "";
        var clickMonth = "";
        var num = 0;

        var day = "";
        var start = "";
        var end = "";

        var getMonth = "";

        $("#search").click(function() {
            $(".day").text("");
            var startDate = $(".input:eq(0)").val();
            var endDate = $(".input:eq(1)").val();

            var startDay = startDate.replace(/-/gi, ",");
            var endDay = endDate.replace(/-/gi, ",");

            start = new Date(startDay);
            end = new Date(endDay);

            getMonth = start.getMonth();

            $("#year").text(start.getFullYear());
            $("#month").text(Month[start.getMonth()]);

            clickYear = start.getFullYear();
            clickMonth = start.getMonth();

            day = start.getDay();

            if(start.getMonth()+1 == end.getMonth()+1) {
            for(var i=start.getDate(); i<=end.getDate(); i++) {
                $(".day:eq("+day+")").text(i);
                day++;
            }
            } else {
                var lastDay = new Date(start.getFullYear(), start.getMonth()+1, 0);
                for(var i=start.getDate(); i<=lastDay.getDate(); i++) {
                    $(".day:eq("+day+")").text(i);
                    day++;
                }
            }
        });

        $("#pre").click(function() {
            $(".day").text("");
            getMonth = getMonth-1;
            var preMonth = new Date(start.getFullYear(), getMonth, 1);
            if(preMonth.getMonth()+1 < start.getMonth()+1) {
                alert("입력한 달보다 작습니다.");
            }

            if(preMonth.getMonth()+1 >= start.getMonth()+1) {
                $("#month").text(Month[preMonth.getMonth()]);
                day = preMonth.getDay();
                clickYear = preMonth.getFullYear();
                clickMonth = preMonth.getMonth();
                var lastDay = new Date(preMonth.getFullYear(), preMonth.getMonth()+1, 0);
                for(var i=start.getDate(); i<=lastDay.getDate(); i++) {
                $(".day:eq("+day+")").text(i);
                day++;
                }
            } 
            
        });

        $("#next").click(function() {

            $(".day").text("");
            getMonth = getMonth+1;
            var nextMonth = new Date(start.getFullYear(), getMonth, 1);
            if(nextMonth.getMonth()+1 > end.getMonth()+1) {
                alert("입력한 달보다 큽니다.");
            }

            if(nextMonth.getMonth()+1 < end.getMonth()+1) {
                $("#month").text(Month[nextMonth.getMonth()]);
                day = nextMonth.getDay();
                clickYear = nextMonth.getFullYear();
                clickMonth = nextMonth.getMonth();
                var lastDay = new Date(nextMonth.getFullYear(), nextMonth.getMonth()+1, 0);
                for(var i=nextMonth.getDate(); i<=lastDay.getDate(); i++) {
                $(".day:eq("+day+")").text(i);
                day++;
            }
            
            } else if (nextMonth.getMonth()+1 == end.getMonth()+1){
                $("#month").text(Month[nextMonth.getMonth()]);
                day = nextMonth.getDay();
                clickYear = nextMonth.getFullYear();
                clickMonth = nextMonth.getMonth();
                var lastDay = new Date(nextMonth.getFullYear(), nextMonth.getMonth()+1, 0);
                for(var i=nextMonth.getDate(); i<=end.getDate(); i++) {
                $(".day:eq("+day+")").text(i);
                day++;
                }
            }   
            
        });


        $(".day").click(function() {
            
            clickDate = new Date(clickYear, getMonth, $(this).text());

            $("#selectDay").text(selectDay[clickDate.getDay()]);
            $("#selectYear").text(clickDate.getFullYear());
            $("#selectMonth").text(clickDate.getMonth()+1);
            $("#selectDays").text($(this).text());

        });

        $("#apply").click(function() {
            var clickMonth = "";
            var clickDay = "";
            if((clickDate.getMonth()+1) < 10) {
                clickMonth = "0"+(clickDate.getMonth()+1);
            } else {
                clickMonth = (clickDate.getMonth()+1);
            }
            if((clickDate.getDate()) < 10) {
                clickDay = "0"+clickDate.getDate();
            }else {
                clickDay = clickDate.getDate();
            }
            var outDate = clickDate.getFullYear()+"-"+clickMonth+"-"+clickDay;
            var outDay = selectDay[clickDate.getDay()]+"요일";
            $(".outDate:eq("+num+")"+" > td:nth-child(1)").text(outDate);
            $(".outDate:eq("+num+")"+" > td:nth-child(2)").text(outDay);
            $(".outDate:eq("+num+")"+" > td:nth-child(3)").text("아니오");
            if(clickDate.getDay() == 6) {
                $(".outDate:eq("+num+")"+" > td").css("color", "blue");
            } else if(clickDate.getDay() == 0) {
                $(".outDate:eq("+num+")"+" > td").css("color", "red");
            };
            num++;

        });


    </script>
</body>
</html>