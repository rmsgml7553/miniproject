package handler.clinic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import c_rep.C_repService;
import handler.Handler;

public class ClinicCSVDelrepHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String tempHpid = request.getParameter("hpid");
		if(request.getMethod().equals("POST")) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			C_repService service = new C_repService();
			service.delete(num);
		}
		
		return "redirect:/clinic/detail.do?code="+tempHpid;
	}

}
