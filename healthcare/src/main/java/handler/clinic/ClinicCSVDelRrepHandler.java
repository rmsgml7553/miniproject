package handler.clinic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import c_rrep.C_rrepService;
import handler.Handler;

public class ClinicCSVDelRrepHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("in handler");
		String tempHpid = request.getParameter("hpid");
		int num = Integer.parseInt(request.getParameter("num"));
		C_rrepService service = new C_rrepService();
		service.delete(num);

		return "redirect:/clinic/detail.do?code="+tempHpid;
	}

}
