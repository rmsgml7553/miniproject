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

		if(request.getMethod().equals("GET")) {
			String chk = request.getParameter("chk");
			request.setAttribute("chk", chk);
			view = "/member/getpwd.jsp?chk=chk";
		} else {
		
		
			System.out.println("getpwd 포스트방식 ");
			String pwdcheck = request.getParameter("pwdcheck");
			System.out.println(pwdcheck);
			String chk = request.getParameter("chk");
			System.out.println(chk);
			HttpSession session = request.getSession(false);
			String id = (String) session.getAttribute("loginId");
			MemberService service = new MemberService();
			MemberVo vo = service.getByMember(id);
		
			if(pwdcheck.equals(vo.getPwd())) {				
				if(chk.equals("수정")) {
					view = "redirect:/member/editform.do";
				} else if(chk.equals("탈퇴")) {
					view = "redirect:/member/out.do";
				}
			} else {
				view = "";
			}
		}
	return view;
}
}
