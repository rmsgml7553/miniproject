package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;

public class OutHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("탈퇴 핸들러");
		String id = (String)session.getAttribute("loginId");
		MemberService service = new MemberService();
		service.delMember(id);

		session.invalidate();
		return "redirect:/index.jsp";
	}

}
