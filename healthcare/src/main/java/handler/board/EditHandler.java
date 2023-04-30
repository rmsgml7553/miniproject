package handler.board;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class EditHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		
		BoardService service = new BoardService();
		
		String view = "";
		if(request.getMethod().equals("GET")) {
			 int num = Integer.parseInt(request.getParameter("num"));// edit 페이지로 보내는 num
			
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("title", title);
			request.setAttribute("content", content);
			
			view="/board/edit.jsp";	
		} else { //post 방식
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			// 수정 후 detail.jsp로 보낸다.
			BoardVo vo = new BoardVo(num,null,title,content,0,null,null);// 새로운 생성자를 생성하고 그 vo를 넣는다.
			service.update(vo);
			
//			vo = service.selectNum(num);
//			request.setAttribute("vo", vo);
			
			view="redirect:/board/list.do";
		}
		return view;
	}
}

//private int num;
//private String id;
//private String title;
//private String content;
//private int cnt;
//private String path;
//private Date w_date;
