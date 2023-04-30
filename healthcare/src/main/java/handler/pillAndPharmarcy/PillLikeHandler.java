package handler.pillAndPharmarcy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import handler.Handler;
import pillLike.PillLikeDao;
import pillLike.PillLikeService;

public class PillLikeHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		PillLikeService service = new PillLikeService();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		String itemSeq = request.getParameter("itemSeq");
		String name = request.getParameter("name");
		System.out.println("itemSeq : " + itemSeq);
		String tf;
		System.out.println("find " + service.find(id, itemSeq));
		if (request.getMethod().equals("POST")) {
			// 눌렀을 때(post) 즐겨찾기에 있다면 삭제, 없으면 삽입.
			if (id == null) {
				tf = "NotLogin";
			} else if (service.find(id, itemSeq) != null) {
				service.delete(id, itemSeq);
				tf = "N";
			} else {
				service.input(id, itemSeq, name);
				tf = "Y";
			}
		} else {
			// detail.jsp 들어왔을 때 (get) 있으면 y 업으면 n 반환.
			if (service.find(id, itemSeq) != null) {
				tf = "Y";
			} else {
				tf = "N";
			}
		}
		JSONObject obj = new JSONObject();
		obj.put("tf", tf);
		String txt = obj.toJSONString();
		System.out.println("txt : " + txt);
		return "responsebody/" + txt;
	}

}
