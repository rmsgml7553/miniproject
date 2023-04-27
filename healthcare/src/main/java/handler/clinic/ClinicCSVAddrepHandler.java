package handler.clinic;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import c_rep.C_repService;
import c_rep.C_repVo;
import handler.Handler;

public class ClinicCSVAddrepHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("addrephandler 도착");
		String id = request.getParameter("id");
		
		String content = request.getParameter("content");
		String code = request.getParameter("code");
		
		C_repService service = new C_repService();
		C_repVo vo = new C_repVo(0,id,content,code, null);
		service.insert(vo);
		
	
		ArrayList<C_repVo> reps = service.select(code);
		JSONArray arr = new JSONArray();
		for(C_repVo temp:reps) {
		
			SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd"); 
			JSONObject obj = new JSONObject();
			obj.put("id", temp.getId());
			obj.put("content", temp.getContent());
			obj.put("date",fmt.format(temp.getDate()));
			arr.add(obj);
		}
		String txt = arr.toString();

		return "responsebody/"+txt;
	}
	
}
