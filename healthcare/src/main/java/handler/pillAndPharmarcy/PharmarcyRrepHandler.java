package handler.pillAndPharmarcy;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import handler.Handler;
import p_rrep.P_rrepService;
import p_rrep.P_rrepVo;

public class PharmarcyRrepHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String txt = null;
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			int pNum = Integer.parseInt(request.getParameter("pnum"));
			String content = request.getParameter("newRrep");
			
			System.out.println("pNum : "+pNum+" content : "+ content);
			P_rrepService service = new P_rrepService();
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			System.out.println(id);
			if(request.getMethod().equals("POST")) {
				System.out.println("in post");
				service.insert(new P_rrepVo(0, pNum, id, content, null));
			}
			
			JSONArray arr = new JSONArray();
			ArrayList<P_rrepVo> list = new ArrayList<>();
			list = service.select(pNum);
			
			for(P_rrepVo vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", vo.getId());
				obj.put("pNum", vo.getpNum());
				obj.put("content", vo.getContent());
				obj.put("date", vo.getDate().toString());
				obj.put("num", vo.getNum());
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
