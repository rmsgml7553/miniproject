package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;

public class InstitutionAroundMeHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		MemberService service = new MemberService();
		String address = service.getByMember(id).getAddress();
		request.setAttribute("address", address);
		return "/member/InstitutionsAroundMe.jsp";
	}

}
