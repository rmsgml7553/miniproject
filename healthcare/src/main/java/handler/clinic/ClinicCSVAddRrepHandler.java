package handler.clinic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import c_rrep.C_rrepService;
import c_rrep.C_rrepVo;
import handler.Handler;

public class ClinicCSVAddRrepHandler implements Handler{

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
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		String tempHpid = request.getParameter("hpid");
		int pNum = Integer.parseInt(request.getParameter("cnum"));
		String content = request.getParameter("newRrep");
		System.out.println(request.getParameter("cnum"));
		System.out.println(content);
		C_rrepService service = new C_rrepService();
		service.insert(new C_rrepVo(0, pNum, id, content, null));
		return "redirect:/clinic/detail.do?code="+tempHpid;
	}

}
