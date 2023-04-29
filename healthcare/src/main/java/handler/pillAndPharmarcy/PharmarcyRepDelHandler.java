package handler.pillAndPharmarcy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import p_rep.P_repService;

public class PharmarcyRepDelHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if(request.getMethod().equals("POST")) {
			int num = Integer.parseInt(request.getParameter("num"));
			P_repService service = new P_repService();
			service.delete(num);
		}
		
		return "/pharmarcy/pharmarcyDetail/load.do";
	}

}
