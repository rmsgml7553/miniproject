package handler.board;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import board_rep.Board_repService;
import board_rep.Board_repVo;
import handler.Handler;
import like_board.Like_BoardService;

public class DetailHandler implements Handler {

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
		
		int num = Integer.parseInt(request.getParameter("num")); //list에서 num값 가져옴.
		BoardService service = new BoardService();
		service.cnt(num); // num값에 해당하는 db의 조회수 증가시킴
		
		BoardVo vo = service.selectNum(num); // num값에 해당하는 vo를 가져와서 담음.
		request.setAttribute("vo", vo);
		
		
		Like_BoardService service2 = new Like_BoardService();
		int count = service2.selectByNum(num); // num에 해당하는 행의 총수를 뿌려줌.
		request.setAttribute("count", count);
		
		
		Board_repService rep_service = new Board_repService();
		ArrayList<Board_repVo> list = rep_service.select(num);
		request.setAttribute("list", list);

		return "/board/detail.jsp";
	}
}















