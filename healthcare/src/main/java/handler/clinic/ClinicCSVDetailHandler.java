package handler.clinic;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import c_rep.C_repService;
import c_rep.C_repVo;
import clinic.Vo;
import handler.Handler;
import member.MemberService;

public class ClinicCSVDetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("clinicdetail handler 도착");
	
		String path = request.getServletContext().getRealPath("/WEB-INF/files/clinicall2.txt");
		
		String code = request.getParameter("code");
		System.out.println(code);
		try {
			FileInputStream fr = new FileInputStream(path);
			BufferedReader br = new BufferedReader(new InputStreamReader(fr,"utf-8"));
		
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			
			int i = 0;
			String line;
			Vo vo = new Vo();
			ArrayList<String> subject;
			String num;
			while((line=br.readLine())!= null) {
				if(i!=0) {
					subject = new ArrayList<String>();
					String[] vals = line.split("\",\"");
					String[] subjects = vals[34].split(",");
					for(int j=0; j<subjects.length;j++) {
						subject.add(subjects[j]);
					}
					num = vals[0].substring(1);
				
					if(vals[4].equals(code)) {
						System.out.println("찾았다");
						 vo = new Vo(num, vals[4], vals[10], vals[15], vals[19],vals[21], vals[25],
								vals[26], vals[27], subject);
					}
				}
				i++;
				
			}
			C_repService service = new C_repService();
			ArrayList<C_repVo> rep = service.select(code);
			System.out.println(rep);
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("loginId");
			if(id != null) {
				MemberService memberSerivce = new MemberService();
				String memberCode = memberSerivce.getByMember(id).getCode();
				request.setAttribute("code", memberCode);
			}
			System.out.println("rep : " + rep);
			request.setAttribute("repList", rep);
			request.setAttribute("vo", vo); //request에 담아 뷰페이지에 보내줌. 
			br.close();
			fr.close(); //스트림 닫기
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "/clinic/detail.jsp";
	}

}
