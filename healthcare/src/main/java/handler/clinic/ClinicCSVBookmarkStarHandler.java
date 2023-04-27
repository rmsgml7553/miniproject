package handler.clinic;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;

import clinicbookmark.C_BookmarkService;
import handler.Handler;

public class ClinicCSVBookmarkStarHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String code = request.getParameter("code");
		
		C_BookmarkService service = new C_BookmarkService();
		boolean mark = service.find(id,code);
		JSONObject obj = new JSONObject();
		String txt;
	if(mark == true) {
			
			txt = "Y";
	}else {
		txt = "N";
	}
		
		
		return "responsebody/"+txt;
	}

}
