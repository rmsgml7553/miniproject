package handler.selfcheck;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import selfcheck.SelfCheckService;
import selfcheck.SelfCheckVo;

public class ChartsHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		// request.getMethod(): 요청 방식(get/post)값 반환
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("loginId");
		SelfCheckService service = new SelfCheckService();
		String amr = null;
		String bmr = null;
		String bmi = null;
		String stress = null;
		SelfCheckVo vo = service.selectSelfcheck(id);
		if(vo != null) {
			amr = Double.toString(vo.getAmr());
			bmr = Double.toString(vo.getBmr());
			bmi = Double.toString(vo.getBmi());
			stress = Double.toString(vo.getStress());
		}
		
		System.out.println("amr : " + amr);
		System.out.println("bmr : " + bmr);
		System.out.println("bmi : " + bmi);
		System.out.println("stress : " + stress);
		
		request.setAttribute("amr", amr);
		request.setAttribute("bmr", bmr);
		request.setAttribute("bmi", bmi);
		request.setAttribute("stress", stress);
		view = "/selfcheck/charts.jsp";
		return view;
	}

}
