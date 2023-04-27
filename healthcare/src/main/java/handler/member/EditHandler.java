package handler.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class EditHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String view = "/member/edit.jsp";
		HttpSession session =request.getSession(false);
		String id = (String)session.getAttribute("loginId");
		
		if(request.getMethod().equals("GET")) {
			
			MemberService service = new MemberService();
			MemberVo m = service.getByMember(id);
			request.setAttribute("m", m);
			view = "/member/edit.jsp";
		} else {
			MemberService service = new MemberService();
			
			view = "redirect:/member/getpwd.do";
		}
		return view;
	}

}
