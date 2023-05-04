package handler.member;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clinicbookmark.C_BookmarkService;
import clinicbookmark.C_BookmarkVo;
import handler.Handler;
import member.MemberService;
import member.MemberVo;
import pharmarcyLike.PharmarcyLikeService;
import pharmarcyLike.PharmarcyLikeVo;
import pillLike.PillLikeService;
import pillLike.PillLikeVo;
import selfcheck.SelfCheckService;
import selfcheck.SelfCheckVo;

public class LoginCompleteHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		MemberService service = new MemberService();
		
		MemberVo vo = service.getByMember(id);
		
		SelfCheckService selfChk = new SelfCheckService();
		
		SelfCheckVo selfVo = selfChk.selectSelfcheck(id);
		if(selfVo != null) {
			request.setAttribute("amr", selfVo.getAmr());
			request.setAttribute("bmr", selfVo.getBmr());
			request.setAttribute("bmi", selfVo.getBmi());
			request.setAttribute("stress", selfVo.getStress());
		}
		
		
		
		String address = service.getByMember(id).getAddress();
		request.setAttribute("address", address);
		
		PharmarcyLikeService pharmservice = new PharmarcyLikeService();
		ArrayList<PharmarcyLikeVo> phlvo = pharmservice.listById(id); 
		System.out.println("logincomhandler"+phlvo);
		
		request.setAttribute("phlvo", phlvo);
		C_BookmarkService cservice = new C_BookmarkService();
		ArrayList<C_BookmarkVo> clvo = cservice.select(id);
		
		request.setAttribute("clvo", clvo);
		PillLikeService pillservice = new PillLikeService();
		ArrayList<PillLikeVo> plvo = pillservice.listById(id);
		
		request.setAttribute("plvo", plvo);
		System.out.println("add : " +address);
		view = "/member/mypage.jsp";
		return view;
	}

}
