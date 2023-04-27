package handler.clinic;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clinicbookmark.C_BookmarkService;
import handler.Handler;

public class ClinicCSVBookmarkHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("bookmark핸들러 도착");
		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		String id = (String)session.getAttribute("loginId");
		String txt = null;
		
		System.out.println("id:" + id);

		C_BookmarkService service = new C_BookmarkService();
		boolean find;
		find = service.find(id, code);
		if(request.getMethod().equals("POST")) {
			
			if(id == null ) {
				txt ="NotLogin";
			}
			 else if (find == false) {
				txt = "Y";
			} else {
				service.delete(id, code);
				txt = "N";
			}
		}else {
			find = service.find(id, code);

			if (find == true) {
				txt = "Y";
			} else {
				txt = "N";
			}
		}

		return "responsebody/" + txt;
	}

}
