<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
input, select{
height: 36px;
margin: 2px;
border: 1px solid #e2e2e2;
}
input:focus{
border: none;
outline: 1px solid #32E8E2;
}
body {
color:red;
font-size: 10px;
}
label{
color:black;
font-size:20px;
}
body{
	position: relative;
	height:1000px;
}
.inner{
	position: absolute;
	left:50%;
	transform: translate(-50%);
	padding-bottom:100px;
	width:700px;
}
</style>
<script>
function pwdFunction(){
	let pwd = document.getElementById("pwd").value;
	console.log(pwd);
	let pwdMsg = document.getElementById("pwdMsg");
// 	let RegExp = /([^가-힣\w\s]){4,12}/;
	let RegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_])[a-zA-Z\d\W_]{4,12}$/;
	let res = RegExp.test(pwd);
	
	let html = "";
	pwdMsg.innerHTML = " ";
	
	if(pwd == null){
		tf = false;
		html += "비밀번호를 입력해주세요.";
	} else if(!res){
		tf = false;
		html += "4~12자의 영문 대소문자와 숫자로만 입력해주세요.";
		pwd = "";
	}else if(res){
		html+="사용가능한 비밀번호입니다."
		tf = true;
	}
	pwdMsg.innerHTML = html;
	html = "";
	
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
		name = "";
	} else {
		html += "사용가능 합니다.";
	} 
	
	nameMsg.innerHTML = html;
	
}



</script>
</head>
<body>
<div class="inner">
	<form action="${pageContext.request.contextPath }/member/editform.do" method="post" name="f">
	<fieldset>
	<label for="id">아이디</label><br/>
	<input type="text" name="id" size="50" value="${vo.id }" readonly>
	<br/>
	<label for="pwd">비밀번호</label><br/>
	<input type="password" id="pwd" name="pwd" size="50" autofocus value="${vo.pwd }" onblur="pwdFunction()"><br/>
	<span class="error_next_box" id="pwdMsg" >필수정보입니다.</span><br /> 
	<label for="name">이름</label><br/>
	<input type="text" id="name" name="name" size="50" value="${vo.name }" onblur="nameFunction()"><br/>
	<span class="error_next_box" id="nameMsg" >필수정보입니다.</span><br /> 
	<label for="phone">전화번호</label><br/>
	<input type="text" name="phone" size="50" value="${vo.phone }"><br/>
	
	
	
	
	
	<label for="address">주소</label><br/>
	<input type="text" id="sample3_postcode" placeholder="우편번호" size="50">
	<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" name="sample3_address" id="sample3_address" placeholder="주소" size="50"><br>
	
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	<br/>
	
	<label for="mCode">코드</label><br/>
	<input type="number" name="mCode" value="${vo.mCode }" style="width:362px;" readonly><br/>
	
	<label for="code">코드번호</label><br/>
	<input type="text" name="code" size="50" value="${vo.code }" readonly><br/>
	
	
	<label for="gender">성별</label><br/>
	<input type="text" name="code" size="50" value="${vo.gender }" readonly><br/>
	
	<label for="birth">생년월일</label><br/>
	<input type="text" name="birth" size="50" value="${vo.birth }" readonly><br/>
	  					
	<input type="submit" value="수정" size="50">
	</fieldset>
	</form>
</div>
</body>
</html>