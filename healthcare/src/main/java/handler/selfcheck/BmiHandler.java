package handler.selfcheck;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import selfcheck.SelfCheckService;

public class BmiHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if (request.getMethod().equals("GET")) {//request.getMethod(): 요청 방식(get/post)값 반환
			HttpSession session = request.getSession();
			session.removeAttribute("height");
			session.removeAttribute("weight");
			session.removeAttribute("bmr");
			session.removeAttribute("amr");
			session.removeAttribute("bmi");
			session.removeAttribute("stress");
			session.removeAttribute("stressRs");
			session.removeAttribute("bmiRs");
			view = "/selfcheck/bmi.jsp";
		} else {
			int height = Integer.parseInt(request.getParameter("height"));
			int weight = Integer.parseInt(request.getParameter("weight"));
			String exer = request.getParameter("exer");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("loginId");
			SelfCheckService service = new SelfCheckService();
			double bmr = service.calBmr(height, weight, id);
			session.setAttribute("bmr", bmr);
			session.setAttribute("height", height);
			session.setAttribute("weight", weight);
			
			switch (exer) {
				case "1": 
					bmr *= 1.2;
					break;
				case "2": 
					bmr *= 1.375;
					break;
				case "3": 
					bmr *= 1.55;
					break;
				case "4": 
					bmr *= 1.725;
					break;
				case "5": 
					bmr *= 1.9;
					break;
				default:
					break;
			}
			double amr = bmr;
			session.setAttribute("amr", amr);
			double bmi = service.calBmi(height, weight);
			session.setAttribute("bmi", bmi);
			
			String rs;
			if(bmi < 18.5) {
				rs = "저체중";
			}else if(bmi < 23) {
				rs = "정상체중";
			}else if(bmi < 25) {
				rs = "과체중";
			}else if(bmi < 30) {
				rs = "1단계 비만";
			}else if(bmi < 35) {
				rs = "2단계 비만";
			}else {
				rs ="3단계 비만";
			}
			session.setAttribute("bmiRs", rs);

			view = "redirect:/selfcheck/stress.do";
		}
		return view;
	}

}
