package handler.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clinicbookmark.C_BookmarkService;
import clinicbookmark.C_BookmarkVo;
import handler.Handler;
import pharmarcyLike.PharmarcyLikeService;
import pharmarcyLike.PharmarcyLikeVo;
import pillLike.PillLikeService;
import pillLike.PillLikeVo;

public class LikeListHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		
		PillLikeService pillService = new PillLikeService();
		PharmarcyLikeService pharmarcyService = new PharmarcyLikeService();
		C_BookmarkService clinicService = new C_BookmarkService();
		ArrayList<PillLikeVo> pillList = pillService.listById(id);
		ArrayList<PharmarcyLikeVo> pharmarcyList = pharmarcyService.listById(id);
		ArrayList<C_BookmarkVo> clinicList = clinicService.select(id);
		System.out.println("pill : " + pillList);
		System.out.println("pharmarcy: " + pharmarcyList);
		System.out.println("clinic : " + clinicList);
		request.setAttribute("clinicList", clinicList);
		request.setAttribute("pillList", pillList);
		request.setAttribute("pharmarcyList", pharmarcyList);
		
		return "/member/likeList.jsp";
	}

}
