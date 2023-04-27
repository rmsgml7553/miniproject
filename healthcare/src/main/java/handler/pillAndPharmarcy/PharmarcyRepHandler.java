package handler.pillAndPharmarcy;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import p_rep.P_repService;
import p_rep.P_repVo;

public class PharmarcyRepHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String txt = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			session.setAttribute("id", "jwon");
			String id = (String)session.getAttribute("id");
			String hpid = request.getParameter("hpid");
			ArrayList<P_repVo> list = new ArrayList<>();
			P_repService service = new P_repService();
			
			
			if(request.getMethod().equals("POST")) {
				String newRep = request.getParameter("newRep");
				service.insert(new P_repVo(0, id, newRep, null, hpid));
			}
			
			JSONArray arr = new JSONArray();
			list = service.select(hpid);
			for(P_repVo vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("num", vo.getNum());
				obj.put("id", vo.getId());
				obj.put("content", vo.getContent());
				obj.put("date", vo.getDate().toString());
				arr.add(obj);
			}
			txt = arr.toJSONString();
			System.out.println(txt);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "responsebody/"+txt;
	}

}
