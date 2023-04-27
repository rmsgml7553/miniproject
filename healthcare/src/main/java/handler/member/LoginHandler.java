package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class LoginHandler implements Handler {

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
		String view = "/member/myinfo.do";
		boolean flag=false;
		if(request.getMethod()=="GET") {
			request.setAttribute("view", "/member/login.jsp");
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			MemberService service = new MemberService();
			MemberVo vo = service.getByMember(id);
			System.out.println(id);
			if(vo!=null && pwd.equals(vo.getPwd())) {
				HttpSession session= request.getSession();
				session.setAttribute("loginId", id);
				System.out.println(session);
				request.setAttribute("vo", vo);
				System.out.println(id);
				flag = true;
			}
		}
		request.setAttribute("flag", flag);
		return view;
	}

}