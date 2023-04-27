package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class ExHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		System.out.println(id);
		MemberService service = new MemberService();
		MemberVo vo = new MemberVo();
		String view = "";
		String msg = "";
		vo = service.getByMember(id);
		
		if(vo.getmCode() > 0) {
			msg = ("이미 존재하는 아이디입니다.");
		} else {
			msg = ("사용가능한 아이디 입니다.");
		}
		
		return null;
	}

}
