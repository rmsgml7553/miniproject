package handler.board;

import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;

public class EditHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		BoardService service = new BoardService();
		
		String view = "";
		if(request.getMethod().equals("GET")) {
			 int num = Integer.parseInt(request.getParameter("num"));// edit 페이지로 보내는 num
			
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			System.out.println("id : " + id);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			request.setAttribute("num", num);
			request.setAttribute("id", id);
			request.setAttribute("title", title);
			request.setAttribute("content", content);
			
			view="/board/edit.jsp";	
		} else { //post 방식
			System.out.println("edit 핸들러 도착");
			
		
			int num = Integer.parseInt(request.getParameter("num"));
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			System.out.println("id: " + id);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			
		
			
			// 수정 후 detail.jsp로 보낸다.
			BoardVo vo = new BoardVo(num,null,title,content,0,null,null);// 새로운 생성자를 생성하고 그 vo를 넣는다.
			service.update(vo);
			

			
			view="redirect:/board/list.do";
		}
		return view;
	}
}


