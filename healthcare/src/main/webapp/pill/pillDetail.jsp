<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}

.conversation {
  padding: 0 !important;
  margin: 0 !important;
  height: 100%;
  width: 100%;
  border-left: 1px solid rgba(0, 0, 0, .08);
  overflow-y: auto;
}

.message {
  padding: 0 !important;
  margin: 0 !important;
 
  background-size: cover;
  overflow-y: auto;
  border: 1px solid #f7f7f7;
  height: calc(100% - 120px);
}
.message-previous {
  margin : 0 !important;
  padding: 0 !important;
  height: auto;
  width: 100%;
}
.previous {
  font-size: 15px;
  text-align: center;
  padding: 10px !important;
  cursor: pointer;
}

.previous a {
  text-decoration: none;
  font-weight: 700;
}

.message-body {
  margin: 0 !important;
  padding: 0 !important;
  width: auto;
  height: auto;
}

.message-main-receiver {
  /*padding: 10px 20px;*/
  max-width: 60%;
}

.message-main-sender {
  padding: 3px 20px !important;
  margin-left: 40% !important;
  max-width: 60%;
}

.message-text {
  margin: 0 !important;
  padding: 5px !important;
  word-wrap:break-word;
  font-weight: 200;
  font-size: 14px;
  padding-bottom: 0 !important;
}

.message-time {
  margin: 0 !important;
  margin-left: 50px !important;
  font-size: 12px;
  text-align: right;
  color: #9a9a9a;

}

.receiver {
  width: auto !important;
  padding: 4px 10px 7px !important;
  border-radius: 10px 10px 10px 0;
  background: #ffffff;
  font-size: 16px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  word-wrap: break-word;
  display: inline-block;
}

.sender {
  float: right;
  width: auto !important;
  background: #dcf8c6;
  border-radius: 10px 10px 0 10px;
  padding: 4px 10px 7px !important;
  font-size: 16px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
  display: inline-block;
  word-wrap: break-word;
}
</style>
<script>
function change(){
	let star = document.getElementsByClassName("material-symbols-outlined")[0];
	const xhttp = new XMLHttpRequest();
	console.log("change");
	xhttp.onload = function() {
		let txt = xhttp.responseText;
		console.log(txt);
		let obj = JSON.parse(txt);
		if(obj.tf == "Y"){
			star.style.color = "#ffcc00";
		}else if(obj.tf == "N"){
			star.style.color = "gray";
		}else if(obj.tf =="NotLogin"){
			alert("login 후 이용해주세요");
		}
	}
	xhttp.open("POST","${pageContext.request.contextPath}/pill/pillLike/load.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8")
	xhttp.send("itemSeq=${PillXMLVo.itemSeq}&name=${PillXMLVo.itemName }");
}

window.onload = function(){
	let star = document.getElementsByClassName("material-symbols-outlined")[0];
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		console.log(txt)
		let obj = JSON.parse(txt);
		if(obj.tf == "Y"){
			star.style.color = "#ffcc00";
		}else if(obj.tf == "N"){
			star.style.color = "gray";
		}
	}
	xhttp.open("GET","${pageContext.request.contextPath}/pill/pillLike/load.do?itemSeq=${PillXMLVo.itemSeq}");
	xhttp.send();
}
</script>
</head>
<body>

	회사명
	${PillXMLVo.entpName }
	<span class="material-symbols-outlined" style="color:gray" onclick="change()"> star </span>
	제품명
	${PillXMLVo.itemName }
	<img src = "${PillXMLVo.itemImage }" style="width:100ox; height:100px;" alt ="현재 제공된 약 사진이 없습니다.">
  <hr class="d-sm-none">
	${sessionScope.loginId }
	<div class = "chat" style="background-color:#f7f7f7; border : black solid 1px; border-radius:20px;">
		<div class="message" id="conversation">
	        <div class="row message-previous">
	          <div class="col-sm-12 previous">
	            <a onclick="previous(this)" id="ankitjain28" name="20">
					약 정보를 확인하세요!
					<c:if test = "${not empty PillXMLVo.updateDe }">
					<br>마지막 수정 날짜 : ${PillXMLVo.updateDe }
					</c:if>
	            </a>
	          </div>
	        </div>
	      </div>
	      
	      <c:if test = "${not empty PillXMLVo.efcyQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약의 효능은 무엇입니까?
	              </div>
	              <span class="message-time pull-right">
	                ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.efcyQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>
	      
	      <c:if test = "${not empty PillXMLVo.useMethodQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약은 어떻게 사용합니까?
	              </div>
	              <span class="message-time pull-right">
	                ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.useMethodQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>


	      <c:if test = "${not empty PillXMLVo.atpnWarnQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?
	              </div>
	              <span class="message-time pull-right">
	                ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.atpnWarnQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>


	      <c:if test = "${not empty PillXMLVo.atpnQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약의 사용상 주의사항은 무엇입니까?
	              </div>
	              <span class="message-time pull-right">
	                ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.atpnQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>


	      <c:if test = "${not empty PillXMLVo.intrcQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?
	              </div>
	              <span class="message-time pull-right">
	               ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.intrcQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>


	      <c:if test = "${not empty PillXMLVo.seQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약은 어떤 이상반응이 나타날 수 있습니까?
	              </div>
	              <span class="message-time pull-right">
	                ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.seQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>


	      <c:if test = "${not empty PillXMLVo.depositMethodQesitm }">
	      <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-sender">
	            <div class="sender">
	              <div class="message-text">
					이 약은 어떻게 보관합니까?
	              </div>
	              <span class="message-time pull-right">
	                ${sessionScope.loginId }
	              </span>
	            </div>
	          </div>
	        </div>
	      </div>
		  <div class = "message">
	        <div class="row message-body">
	          <div class="col-sm-12 message-main-receiver">
	            <div class="receiver">
	              <div class="message-text">
	               ${PillXMLVo.depositMethodQesitm }
	              </div>
	              <span class="message-time pull-right">
	                ${PillXMLVo.entpName }
	              </span>
	            </div>
	          </div>
	        </div>
		  </div>
	      </c:if>
	</div>
</body>
</html>