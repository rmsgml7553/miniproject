package handler.clinic;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import c_rep.C_repService;
import c_rep.C_repVo;
import handler.Handler;

public class ClinicCSVAddrepHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		String tempHpid = request.getParameter("hpid");
		String newRep = request.getParameter("newRep");
		C_repService service = new C_repService();
		service.insert(new C_repVo(0, id, newRep, tempHpid, null, null));
		
		return "redirect:/clinic/detail.do?code="+tempHpid;
	}
	
}
