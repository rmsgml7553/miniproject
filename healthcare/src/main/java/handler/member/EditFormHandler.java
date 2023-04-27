package handler.member;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class EditFormHandler implements Handler {

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
			request.setAttribute("view", "/member/editform.jsp");
		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			System.out.println(pwd);
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("sample3_address")+" " +request.getParameter("sample3_detailAddress");
			System.out.println(address);
			MemberService service = new MemberService();
			MemberVo vo = new MemberVo();
			
			vo = new MemberVo(id, pwd, name, phone, address, 0, null, null, null);
			service.editMember(vo);
			request.setAttribute("vo", vo);
			view = "/member/myinfo.do";
		} 
	
	return view;
}
	}


