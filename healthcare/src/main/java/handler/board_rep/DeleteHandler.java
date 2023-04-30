package handler.board_rep;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_rep.Board_repService;
import handler.Handler;

public class DeleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num_d = Integer.parseInt(request.getParameter("num_d"));
		int num = Integer.parseInt(request.getParameter("num"));
		Board_repService service = new Board_repService();
		service.delete(num_d);
		
		return "redirect:/board/detail.do?num="+num;
	}

}
