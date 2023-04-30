package handler.pillAndPharmarcy;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import handler.Handler;
import p_rep.P_repService;
import p_rep.P_repVo;

public class PharmarcyRepHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("loginId");
			String tempHpid = request.getParameter("hpid");
			System.out.println("id : "+id+" tempHpid : " + tempHpid);
			String newRep = request.getParameter("newRep");
			System.out.println("RepHandler");
			P_repService service = new P_repService();
			service.insert(new P_repVo(0, id, newRep, null, tempHpid, null));
			
			
		return "redirect:/pharmarcy/pharmarcyDetail/load.do?hpid="+tempHpid;

	}
}
