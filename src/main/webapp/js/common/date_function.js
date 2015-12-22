//현재 날짜와 매계변수 날짜의 차이를 구함.
function getBetweenDay(targetDate)
{
	var today = new Date();
	var dateString = targetDate;
	var dateArray = dateString.split("-");
	var dateObject = new Date(parseInt(dateArray[0]), parseInt(dateArray[1])-1, parseInt(dateArray[2]));
	var betweenDay = (today.getTime() - dateObject.getTime())/1000/60/60/24;
	
	return betweenDay;
}

//현재 날짜와 매계변수 날짜의 시간 차이를 구함.
function isBetweenDay(targetDate)
{
	var today = new Date();
	var targetDate = new Date(targetDate);
	var betweenTime = (today.getTime() - targetDate.getTime()) /1000/60/60;
	
	if (betweenTime < 24)
	{
		return true;
	}
	return false;
}

function getDateString(){
	var now = new Date();
	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var date = now.getDate()>9 ? '' + now.getDate() : '0' + now.getDate();
	var day = now.getDay();
	
	if(day == 0){
		day = "일요일";
	} else if(day == 1){
		day = "월요일";
	} else if(day == 2){
		day = "화요일";
	} else if(day == 3){
		day = "수요일";
	} else if(day == 4){
		day = "목요일";
	} else if(day == 5){
		day = "금요일";
	} else{
		day = "토요일";
	}
	
	return year + "년 " + mon + "월 " + date + "일 " + day;
}
