package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class ExHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String id = request.getParameter("id");
		System.out.println(id);
		MemberService service = new MemberService();
		MemberVo vo = service.getByMember(id);
		String flag = null;
		if(id.length() == 0) {
			System.out.println("1");
			flag = "no";
		}else {
			flag =(vo==null)? "true": "false";
		}
		System.out.println("handler-"+flag);

		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		String txt = obj.toJSONString();
		System.out.println(txt);
		return "responsebody/"+txt;
	}

}
