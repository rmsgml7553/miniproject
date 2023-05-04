package handler.member;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class JoinRHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if(request.getMethod().equals("GET")) {
			request.setAttribute("view", "/member/joinR.jsp");
			view = "/member/join.jsp";

		} else {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("sample3_address")+" ";
			String code = request.getParameter("code");
			String gender = request.getParameter("gender");
			String y = request.getParameter("year");
			String m = request.getParameter("month");
			String d = request.getParameter("day");
			String str = y+"/"+m+"/"+d;
			
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
				java.util.Date util;
				util = format.parse(str);
				java.sql.Date birth;
				birth =  new java.sql.Date(util.getTime());
				MemberService service = new MemberService();
				service.joinRMember(new MemberVo(id, pwd, name, phone, address, 1, code, gender, birth));
				System.out.println(new MemberVo(id, pwd, name, phone, address,0, code, gender, birth));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			view = "/member/joinComplete.jsp";
		}
		return view;
	}

}
