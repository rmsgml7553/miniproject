package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import handler.Handler;
import like_board.Like_BoardService;
import like_board.Like_BoardVo;

public class Like_BoardHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 1. 좋아요를 누르면 로그인 id와 num 값을 가져온다.
		// 2. 가져온 num과 id가 이미 존재히면 delete를 수행하고, num과 id가 존재하지 않다면 insert를 수행하여 라이크보드의 db를 만든다.
		// 3. num 숫자에 해당하는 총 행수를 뽑아와서 뿌려준다. (변수 count에 담았다.)
		// @ 위에거 무조건 코드 확인하기.
		
	//1
	String txt = "";
	int num = Integer.parseInt(request.getParameter("num"));
	HttpSession session = request.getSession();
	String id = (String)session.getAttribute("loginId");
	JSONObject obj = new JSONObject();

	if(request.getMethod().equals("POST")) {
			
		//2 가져온 num과 id가 존재하지 않는다면 true로 insert를 수행하고, 이미 존재하면 false로 delete를 수행한다. (id당 최대 1개의 행을 추가할수 있으며, num으로 구분 가능하다.)
		Like_BoardService service = new Like_BoardService();
		Like_BoardVo vo = new Like_BoardVo(num, id);
		String tf;
		if(id == null) {
			tf = "NotLogin";
		}
		else if(service.selectByLike(vo)) { // true에 해당
			service.insert(vo);
			tf = "Y";
		} else {
			service.deleteLike(vo); //false에 해당. (해당하는 id와 num이 있는 경우 행 1개를 삭제한다)
			tf = "N";
		}
		
		//3
		int cnt = service.selectByNum(num); // num에 해당하는 수를 count에 담음
		request.setAttribute("cnt", cnt);
		request.setAttribute("tf", tf);
		obj.put("cnt", cnt);
		obj.put("tf", tf);
		
	//	String view="";
	//	//	if(request.getMethod().equals("GET")) {
	//		view="/board/detail.do"; 
	//		
		}else {
			Like_BoardService service = new Like_BoardService();
			Like_BoardVo vo = new Like_BoardVo(num, id);
			String tf;
			if(service.selectByLike(vo)) { // true에 해당
				tf = "N";
			} else {
				tf = "Y";
			}
			obj.put("tf", tf);
		}
	txt = obj.toJSONString(obj);
	System.out.println("txt : "+txt);
			
		return "responsebody/"+txt;
	}
		
	
}
