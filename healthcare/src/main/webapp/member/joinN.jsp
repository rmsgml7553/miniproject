<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function id_check(){
	let win = open('idcheck.jsp', 'win', 'width=70,hegiht=100,top=300,lefth=300');
	
}



function joinform_check(){
	alert('ȸ������ ����');
	
	let f = document.f;

	
	

	
	let id = document.querySelector("input[name='id']").value;

	let pwd = document.querySelector("input[name='pwd']").value;
	let pwd2 = document.querySelector("input[name='pwd2']").value;
	let name = document.querySelector("input[name='name']").value;
	let phone = document.querySelector("input[name='phone']").value;
	let sample3_address = document.querySelector("input[name='sample3_address']").value;
	let sample3_detailAddress = document.querySelector("input[name='sample3_detailAddress']").value;
	let mCode = document.querySelector("input[name='mCode']").value;
	let gender = document.querySelector("select[name='gender']").value;
	let year = document.querySelector("input[name='year']").value;
	let month = document.querySelector("select[name='month']").value;
	let day = document.querySelector("select[name='day']").value;
	
	let str = year+month+day;
	let birth = parse(str);
	let address = sample3_address+" " + sample3_detailAddress;
	
	if(id == ""){
		alert("���̵� �Է��ϼ���.");
		id.focus();
		return false;
	}
	
	if(pwd != pwd2){
		pwd.focus();
		pwd.select();
		pwd2 = "";
		alert("��й�ȣ�� ���� �ٸ��ϴ�.");
		return false;
	}

	
	if(name == ""){
		alert("�̸��� �Է��ϼ���.");
		name.focus();
		return false;
	}
	
	
	
	if(year == ""){
		alert("�⵵�� �Է��ϼ���.");
		year.focus();
		return false;
	} 
	
	else if(!(year >= 1900 && year <= 2050)){
		alert("�⵵�� ��Ȯ�ϰ� �Է����ּ���.");
		year.focus();
		return false;
	}
	
	if(month == ""){
		alert("���� �������ּ���.");
		month.focus();
		return false;
	}
	
	if(day == ""){
		alert("���� �������ּ���.");
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
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/member/joinN.do" method="post" name="f">
<fieldset>
<label for="id">���̵�</label><br/>
<input type="text" name="id" size="50" autofocus required placeholder="���̵� �Է����ּ���.">
<input type="button" onclick="id_check()" value="�ߺ�Ȯ��">
<br/>
�ʼ����� �Դϴ�.<br/>
<label for="pwd">��й�ȣ</label><br/>
<input type="password" name="pwd" size="50" autofocus required placeholder="��й�ȣ�� �Է����ּ���."><br/>
�ʼ����� �Դϴ�.<br/>
<label for="pwd2">��й�ȣ ��Ȯ��</label><br/>
<input type="password" name="pwd2" size="50" autofocus required placeholder="��й�ȣ�� �Է����ּ���."><br/>
�ʼ����� �Դϴ�.<br/>
<label for="name">�̸�</label><br/>
<input type="text" name="name" size="50" autofocus required placeholder="�̸��� �Է����ּ���."><br/>
�ʼ����� �Դϴ�.<br/>
<label for="phone">��ȭ��ȣ</label><br/>
<input type="text" name="phone" size="50" autofocus><br/>




<label for="address">�ּ�</label><br/>
<input type="text" id="sample3_postcode" placeholder="�����ȣ" size="50">
<input type="button" onclick="sample3_execDaumPostcode()" value="�����ȣ ã��"><br>
<input type="text" name="sample3_address" id="sample3_address" placeholder="�ּ�" size="50"><br>
<input type="text" name="sample3_detailAddress" id="sample3_detailAddress" placeholder="���ּ�" size="22">
<input type="text" id="sample3_extraAddress" placeholder="�����׸�" size="22">

<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="���� ��ư">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // �����ȣ ã�� ã�� ȭ���� ���� element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // ���� scroll ��ġ�� �����س��´�.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample3_detailAddress").focus();

                // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
                // (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
                element_wrap.style.display = 'none';

                // �����ȣ ã�� ȭ���� ���̱� �������� scroll ��ġ�� �ǵ�����.
                document.body.scrollTop = currentScroll;
            },
            // �����ȣ ã�� ȭ�� ũ�Ⱑ �����Ǿ����� ������ �ڵ带 �ۼ��ϴ� �κ�. iframe�� ���� element�� ���̰��� �����Ѵ�.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe�� ���� element�� ���̰� �Ѵ�.
        element_wrap.style.display = 'block';
    }
</script>

<br/>


<label for="gender">����</label><br/>
					<select name="gender" id="gender" style="width:366px;height:40px;">
						<option value="m">����</option>
						<option value="f">����</option>
					</select><br/>
<label for="birth">�������</label><br/>
<input type="text" name="year" size="18" maxlength="4" placeholder="��(4��)">
  					<select name="month" id="month" style="width:100px;height:40px">
                        <option value = "">��</option>
                        <option value = "1">1</option>
                        <option value = "2">2</option>
                        <option value = "3">3</option>
                        <option value = "4">4</option>
                        <option value = "5">5</option>
                        <option value = "6">6</option>
                        <option value = "7">7</option>
                        <option value = "8">8</option>
                        <option value = "9">9</option>
                        <option value = "10">10</option>
                        <option value = "11">11</option>
                        <option value = "12">12</option>
                    </select>
                    <select name="day" id="day" style="width:100px;height:40px">
                        <option value = "">��</option>
                        <option value = "1">1</option>
                        <option value = "2">2</option>
                        <option value = "3">3</option>
                        <option value = "4">4</option>
                        <option value = "5">5</option>
                        <option value = "6">6</option>
                        <option value = "7">7</option>
                        <option value = "8">8</option>
                        <option value = "9">9</option>
                        <option value = "10">10</option>
                        <option value = "11">11</option>
                        <option value = "12">12</option>
                        <option value = "13">13</option>
                        <option value = "14">14</option>
                        <option value = "15">15</option>
                        <option value = "16">16</option>
                        <option value = "17">17</option>
                        <option value = "18">18</option>
                        <option value = "19">19</option>
                        <option value = "20">20</option>
                        <option value = "21">21</option>
                        <option value = "22">22</option>
                        <option value = "23">23</option>
                        <option value = "24">24</option>
                        <option value = "25">25</option>
                        <option value = "26">26</option>
                        <option value = "27">27</option>
                        <option value = "28">28</option>
                        <option value = "29">29</option>
                        <option value = "30">30</option>
                        <option value = "31">31</option>
                    </select><br/>
<input type="button" value="ȸ������" size="50" onclick="joinform_check()">
</fieldset>
</form>
</body>
</html>