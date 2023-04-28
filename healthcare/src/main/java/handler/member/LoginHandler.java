package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
		String flag = "";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession(false);
		MemberService service = new MemberService();
		MemberVo vo = service.getByMember(id);

		System.out.println(id);
		System.out.println(vo);

		// String view = "/index.jsp";
		JSONObject obj = new JSONObject();
		String txt = "";

		if (vo != null) {
			if (pwd.equals(vo.getPwd())) {
				session.setAttribute("loginId", id);
				System.out.println(session);
				request.setAttribute("vo", vo);
				System.out.println(id);
				flag = "로그인 완료";
				obj.put("flag", flag);

			} else {

				flag = "비밀번호가 틀렸습니다.";
				obj.put("flag", flag);

			}
		} else {
			if (vo == null) {
				flag = "없는 아이디 입니다.";
				obj.put("flag", flag);

			}

		}

		txt = obj.toJSONString();
		return "responsebody/" + txt;
	}

}
