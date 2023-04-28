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
			view="/board/add.jsp";
		}else {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String path = request.getParameter("path"); 
			String content = request.getParameter("content");
			
			BoardVo vo = new BoardVo(0, id, title, content, 0, path, null);
			BoardService service = new BoardService();
			service.addBoard(vo);
			view="redirect:/board/list.do";
		}
		return view;
	}

}
