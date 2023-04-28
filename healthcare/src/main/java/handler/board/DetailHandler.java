package handler.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardService service = new BoardService();
		
		service.cnt(num);
		
		BoardVo vo = service.selectNum(num);
		request.setAttribute("vo", vo);
		String view = "";
		
		if(request.getMethod().equals("GET")) {
			view="/board/detail.jsp";
		}
		return view;
	}
}
