package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import like_board.Like_BoardService;
import like_board.Like_BoardVo;

public class Like_BoardHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// 1. 좋아요를 누르면 id와 num 값을 가져간다.
		// 2. 가져온 num과 id가 존재한다면 delete를 수행하고, id가 존재하지 않다면 insert를 수행한다.
		// 3. num의 총 개수를 뽑아와서 뿌려준다. (변수 count에 담았다.)
		
	//1
	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("id");
	
	//2 가져온 num과 id가 이미 존재하면 false로 delete를 수행하고, num과 id가 존재하지 않는다면 true로 insert를 수행한다.
	Like_BoardService service = new Like_BoardService();
	Like_BoardVo vo = new Like_BoardVo(num, id);
	if(service.selectByLike(vo)) { // true에 해당
		service.insert(vo);
	} else {
		service.delete(num); //false에 해당
	}
	
	//3
	int count = service.selectByNum(num);
	request.setAttribute("count", count);
	
		
		
	String view="";
	if(request.getMethod().equals("GET")) {
		view="/board/detail.jsp";
	}
		return view;
	}
	

}
