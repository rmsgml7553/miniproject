package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import handler.Handler;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if(request.getMethod().equals("GET")) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			BoardService service = new BoardService();
			service.delBoard(num);
			
			view="redirect:/board/list.do"; 
		}
		
		return view;
	}

}
