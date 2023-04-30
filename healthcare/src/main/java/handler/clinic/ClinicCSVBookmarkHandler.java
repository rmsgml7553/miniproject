package handler.clinic;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import clinicbookmark.C_BookmarkService;
import clinicbookmark.C_BookmarkVo;
import handler.Handler;

public class ClinicCSVBookmarkHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("bookmark핸들러 도착");
		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String id = (String)session.getAttribute("loginId");
		String tf = null;
		
		System.out.println("id:" + id);

		C_BookmarkService service = new C_BookmarkService();
		boolean find;
		find = service.find(id, code);
		if(request.getMethod().equals("POST")) {
			
			if(id == null ) {
				tf ="NotLogin";
			}
			 else if (find == false) {
				service.insert(new C_BookmarkVo(id, code, name));
				tf = "Y";
			} else {
				service.delete(id, code);
				tf = "N";
			}
		}else {
			find = service.find(id, code);

			if (find == true) {
				tf = "Y";
			} else {
				tf = "N";
			}
		}
		JSONObject obj = new JSONObject();
		System.out.println(obj);
		obj.put("txt", tf);
		String txt = obj.toJSONString(obj);
		
		return "responsebody/" + txt;
	}

}
