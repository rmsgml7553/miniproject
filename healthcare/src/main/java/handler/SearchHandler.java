package handler;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String search = request.getParameter("search");
		String sel = request.getParameter("institution");
		System.out.println("sel : " + sel + "search : " + search);
		String path = "";
		if (sel.equals("clinic") || sel.equals("pharmarcy")) {
			if (sel.equals("clinic")) {
				path = "/clinic/search.do";
				System.out.println("clinic");
			} else {
				path = "/pharmarcy/pharmarcyList/load.do";
			}
		} else {
			path = "/pill/pillList/load.do";
			if (sel.equals("pillItem")) {
				request.setAttribute("itemName", search);
				System.out.println("item");
			}else {
				request.setAttribute("entpName", search);
				System.out.println("entp");
			}
		}

		return path;
	}

}
