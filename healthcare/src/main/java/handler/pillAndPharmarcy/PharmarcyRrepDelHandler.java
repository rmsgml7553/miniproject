package handler.pillAndPharmarcy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import p_rrep.P_rrepService;

public class PharmarcyRrepDelHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("in handler");
		String tempHpid = request.getParameter("hpid");
		int num = Integer.parseInt(request.getParameter("num"));
		P_rrepService service = new P_rrepService();
		service.delete(num);

		return "redirect:/pharmarcy/pharmarcyDetail/load.do?hpid="+tempHpid;
	}

}
