package handler.pillAndPharmarcy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import handler.Handler;
import pharmarcyLike.PharmarcyLikeDao;
import pharmarcyLike.PharmarcyLikeService;
import pillLike.PillLikeDao;

public class PharmarcyLikeHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PharmarcyLikeService service = new PharmarcyLikeService();
		HttpSession session = request.getSession();
		session.setAttribute("id", "jwon");
		String id = (String)session.getAttribute("id");
		String hpid = request.getParameter("hpid");
		String tf;
		System.out.println(hpid);
		System.out.println("find "+service.find(id, hpid));
		if(request.getMethod().equals("POST")) { 
			// 눌렀을 때(post) 즐겨찾기에 있다면 삭제, 없으면 삽입.
			
			System.out.println("pull");
			if(service.find(id, hpid) != null) {
				service.delete(id, hpid);
				tf = "N";
			}else {
				service.input(id, hpid);
				tf = "Y";
			}
		}else {
			// detail.jsp 들어왔을 때 (get) 있으면 y 업으면 n 반환.
			if(service.find(id, hpid) != null) {
				tf = "Y";
			}else {
				tf = "N";
			}
		}
		JSONObject obj = new JSONObject();
		obj.put("tf", tf);
		String txt = obj.toJSONString();

		return "responsebody/"+txt;
	}

}
