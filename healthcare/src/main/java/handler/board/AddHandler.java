package handler.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String view = "";
		
		if(request.getMethod().equals("GET")) {
			String id = request.getParameter("loginId");
			view="/board/add.jsp";
		}else {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String path = request.getParameter("path"); 
			String content = request.getParameter("content");
			
			BoardVo vo = new BoardVo(0, id, title, content, 0, path, null); // 맨앞과 뒤는 시퀀스와 sysdate로 자동으로 들어가고, 5번째는 cnt이다. cnt는 게시글 번호만 가져와서 1 증가시킨다.
			BoardService service = new BoardService();
			service.addBoard(vo);// 게시판에 값이 저장됨
			
			//  like 게시판에도 num값이 저장됨.
			view="redirect:/board/list.do";
		}
		return view;
	}

}
