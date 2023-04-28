<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type= "text/javascript">



function joinform_check(){
	alert('회원가입 누름');
	
	
	
	let f = document.f;

	
	

	
	let id = document.querySelector("input[name='id']").value;

	let pwd = document.querySelector("input[name='pwd']").value;
	let pwd2 = document.querySelector("input[name='pwd2']").value;
	let name = document.querySelector("input[name='name']").value;
	let phone = document.querySelector("input[name='phone']").value;
	let sample3_address = document.querySelector("input[name='sample3_address']").value;
	let sample3_detailAddress = document.querySelector("input[name='sample3_detailAddress']").value;
	let mCode = document.querySelector("input[name='mCode']").value;
	let code = document.querySelector("input[name='code']").value;
	let gender = document.querySelector("select[name='gender']").value;
	let year = document.querySelector("input[name='year']").value;
	let month = document.querySelector("select[name='month']").value;
	let day = document.querySelector("select[name='day']").value;
	
	
	let str = year+month+day;
	let birth = parse(str);
	let address = sample3_address+" " + sample3_detailAddress;
	
	if(id == ""){
		alert("아이디를 입력하세요.");
		
		return false;
	}
	
	if(pwd != pwd2){
		pwd.focus();
		pwd.select();
		pwd2 = "";
		alert("비밀번호가 서로 다릅니다.");
		return false;
	}

	
	if(name == ""){
		alert("이름을 입력하세요.");
		name.focus();
		return false;
	}
	
	if(year == ""){
		alert("년도를 입력하세요.");
		year.focus();
		return false;
	} 
	
	else if(!(year >= 1900 && year <= 2050)){
		alert("년도를 정확하게 입력해주세요.");
		year.focus();
		return false;
	}
	
	if(month == ""){
		alert("달을 선택해주세요.");
		month.focus();
		return false;
	}
	
	if(day == ""){
		alert("일을 선택해주세요.");
		day.focus();
		return false;
	}
	f.submit();
}
function parse(str){
	let y = str.substr(0, 4);
	let m = str.substr(4, 2);
	let d = str.substr(6, 2);
	return new Date(y, m-1, d);
}


function myFunction(){
	let x = document.getElementById("id").value;
	console.log(x);
	let idMsg = document.getElementById("idMsg");
	
	idMsg.style.display = "";
	let html = "";
	
	idMsg.innerHTML = " ";
	
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				let obj = xhttp.responseText;
				let arr = JSON.parse(obj);
				console.log(arr);
					if(arr.flag == "no"){
						html += "아이디를 입력해주세요.";
					}
					else if(arr.flag =="true"){
							html += "사용가능한 아이디입니다.";
					} else {
						html += "중복된 아이디입니다.";
					} 
		    idMsg.innerHTML = html;	
		}
			let param = "id="+x	;
			xhttp.open("get", "${pageContext.request.contextPath}/member/ex.do?"+param);
			xhttp.send();
}

function pwdFunction(){
	let pwd = document.getElementById("pwd").value;
	let pwd2 = document.getElementById("pwd2").value;
	console.log(pwd);
	console.log(pwd2);
	let pwdMsg = document.getElementById("pwdMsg");
	let pwdMsg2 = document.getElementById("pwdMsg2");
	let RegExp =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,12}$/;
	let res = RegExp.test(pwd);
	let res2 = RegExp.test(pwd2);
	
	
	let html = "";
	
	pwdMsg.innerHTML = " ";
	pwdMsg2.innerHTML = " ";
	
	if(pwd == null){
		html += "비밀번호를 입력해주세요.";
	} else {
		html += "4~12자의 영문 대소문자와 숫자로만 입력해주세요.";
	}
	pwdMsg.innerHTML = html;
	html = "";
	
	if(pwd2 == null){
		html += "비밀번호를 입력해주세요.";
	} else {
		if(!res2){
			html += "4~12자의 영문 대소문자와 숫자로만 입력해주세요.";
		} else if(res){
			if(res.equals(res2)){
				html += "사용가능한 비밀번호 입니다.";
			} else {
				html += "비밀번호가 다릅니다. 다시 입력해주세요.";
			}
		}
	}
	pwdMsg2.innerHTML = html;
}


function nameFunction(){
	let name = document.getElementById("name").value;
	console.log(name);
	let nameMsg = document.getElementById("nameMsg");
	let RegExp =  /^(?=.*[가-힣a-z-A-Z])$/;
	let res = RegExp.test(name);
	
	
	
	nameMsg.style.display = "";
	let html = "";
	
	nameMsg.innerHTML = " ";
	
	if(!res){
		html += "한글과 영문만 입력이 가능합니다.";
	} else {
		html += "사용가능 합니다.";
	} 
	
	nameMsg.innerHTML = html;
		
	
}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/joinN.do"
		method="post" name="f">
		<fieldset>
			<label for="id">아이디</label><br /> 
			<input type="text" name="id" id="id" size="50" autofocus required onblur="myFunction()"><br/>
			<span class="error_next_box" id="idMsg" >필수정보입니다.</span><br /> 
				<label for="pwd">비밀번호</label><br /> 
				<input type="password" id="pwd" name="pwd" size="50" required placeholder="4~12자의 영문 대소문자와 숫자로만 입력" onblur="pwdFunction()"><br />
			<span class="error_next_box" id="pwdMsg" >필수정보입니다.</span><br /> 
			<label for="pwd2">비밀번호 재확인</label><br /> 
			<input type="password" id="pwd2" name="pwd2" size="50" required placeholder="4~12자의 영문 대소문자와 숫자로만 입력" onblur="pwdFunction()"><br />
			<span class="error_next_box" id="pwdMsg2" >필수정보입니다.</span><br /> 
			<label for="name">이름</label><br /> 
			<input type="text" name="name" id="name" size="50" required placeholder="이름을 입력해주세요."
				onblur="nameFunction()"><br /> <span class="error_next_box" id="nameMsg">필수정보 입니다.</span><br /> 
				<label for="phone">전화번호</label><br /> 
			<input type="text" name="phone" size="50" autofocus><br /> 
			<label for="address">주소</label><br />
			<input type="text" id="sample3_postcode" placeholder="우편번호" size="50">
			<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br> 
			<input type="text" name="sample3_address" id="sample3_address" placeholder="주소" size="50"><br> 
			<input type="text"
				name="sample3_detailAddress" id="sample3_detailAddress"
				placeholder="상세주소" size="22"> <input type="text"
				id="sample3_extraAddress" placeholder="참고항목" size="22">

			<div id="wrap"
				style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
					id="btnFoldWrap"
					style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
					onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>

			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>

			<br /> <label for="gender">성별</label><br /> <select name="gender"
				id="gender" style="width: 366px; height: 40px;">
				<option value="m">남자</option>
				<option value="f">여자</option>
			</select><br /> <label for="birth">생년월일</label><br /> <input type="text"
				name="year" size="18" maxlength="4" placeholder="년(4자)"> <select
				name="month" id="month" style="width: 100px; height: 40px">
				<option value="">월</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select> <select name="day" id="day" style="width: 100px; height: 40px">
				<option value="">일</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select><br /> <input type="button" value="회원가입" size="50"
				onclick="joinform_check()">
		</fieldset>
	</form>
</body>
</html>