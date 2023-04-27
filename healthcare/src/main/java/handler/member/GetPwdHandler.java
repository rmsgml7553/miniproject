package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class GetPwdHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String view = "";
		if(request.getMethod()=="GET") {
			request.setAttribute("view", "/member/getpwd.jsp");
		} else {
			String pwdcheck = request.getParameter("pwdcheck");
			HttpSession session = request.getSession(false);
			String id = (String) session.getAttribute("loginId");
			System.out.println(id);
			MemberService service = new MemberService();
			MemberVo vo = service.getByMember(id);
			request.setAttribute("vo", vo);
			view = "/member/editform.jsp";
		} 
	
	return view;
}
}
