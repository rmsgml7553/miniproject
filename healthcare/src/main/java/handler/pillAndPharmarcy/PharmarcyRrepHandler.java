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
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String tempHpid = request.getParameter("hpid");
		System.out.println(request.getParameter("pnum"));
		int pNum = Integer.parseInt(request.getParameter("pnum"));
		String content = request.getParameter("newRrep");
		System.out.println(content);
		P_rrepService service = new P_rrepService();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		service.insert(new P_rrepVo(0, pNum, id, content, null));
		return "redirect:/pharmarcy/pharmarcyDetail/load.do?hpid="+tempHpid;
	}

}
