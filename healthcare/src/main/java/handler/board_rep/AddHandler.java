package handler.board_rep;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board_rep.Board_repService;
import board_rep.Board_repVo;
import handler.Handler;

public class AddHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	
		Board_repService service = new Board_repService();
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		service.insert(new Board_repVo(0,num,id,content,null));
		
		ArrayList<Board_repVo> list = service.select(num);
		
		return "redirect:/board/detail.do?num="+num;
	}

}
