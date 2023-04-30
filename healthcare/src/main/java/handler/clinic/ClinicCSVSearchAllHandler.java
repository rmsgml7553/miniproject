package handler.clinic;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clinic.Vo;
import handler.Handler;


public class ClinicCSVSearchAllHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("clinicsearchall handler 도착");
		String path = request.getServletContext().getRealPath("/WEB-INF/files/clinicall2.txt");
		System.out.println("여기야 여기");
	
		// csv파일에서 전체 내용 읽어오기. ArrayList<Vo> list에 담음.
		try {
			FileInputStream fr = new FileInputStream(path);
			BufferedReader br = new BufferedReader(new InputStreamReader(fr,"utf-8"));
			
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			

			String search = request.getParameter("search");
			
			System.out.println(search);

			int i = 0;
			String line;
			ArrayList<Vo> list = new ArrayList<>();
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
					

					boolean tf = false;
					for (int z = 0; z < subjects.length; z++) {

						if (subjects[z].contains(search)) {
							tf = true;
						}
					}

					System.out.println(tf);
					if (vals[19].contains(search) || vals[21].contains(search) || vals[15].contains(search)
							|| vals[25].contains(search) || tf) {

						Vo vo = new Vo(num, vals[4], vals[10], vals[15], vals[19],vals[21], vals[25],
								vals[26], vals[27], subject);
								list.add(vo);

				}
				
				}
				i++;
			}
			
		
			request.setAttribute("list", list); //request에 담아 뷰페이지에 보내줌. 
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
		

		
		
		return "/clinic/cliniclist.jsp";
	}

}
