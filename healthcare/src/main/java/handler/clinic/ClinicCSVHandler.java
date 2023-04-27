package handler.clinic;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import clinic.Vo;
import handler.Handler;



//csv파일 파싱해서 웹 페이지에 데이터를 출력
public class ClinicCSVHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("clinic handler 도착");
		//웹에서 사용될 실제 주소로 변경
		String path = request.getServletContext().getRealPath("/WEB-INF/files/clinic2.txt");
		try {
			//문자 단위로 읽는 스프림 생성
			FileInputStream fr = new FileInputStream(path);
			BufferedReader br = new BufferedReader(new InputStreamReader(fr,"utf-8"));
			
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");

			int i = 0;
			String line;
			ArrayList<Vo> list = new ArrayList<>();
			ArrayList<String> subject;
			String num;
			while((line=br.readLine())!= null) {
				if(i!=0) {
					subject = new ArrayList<String>();
				String[] vals = line.split("\",\"");
				 System.out.println("vals[0] = " + vals[0]);
				 System.out.println("vals[34] = " + vals[34]);
				num = vals[0].substring(1);
			
				String[] subjects = vals[34].split(", ");
				System.out.println("subject[2]: " + subjects[2]);
				 for(int j=0; j<subjects.length;j++) {
					
					 System.out.println(subjects[j]);
					 subject.add(subjects[j]);
				 
			
				 }
				Vo vo = new Vo(num, vals[4], vals[10], vals[15], vals[19],vals[21], vals[25],
						vals[26], vals[27], subject);
				
				list.add(vo);
				System.out.println("vo : " + vo);
				} 
				 
				i++;
			}
			
			
						
//			String[] str = new String[6];
//			int i =0;
//			ArrayList<Vo> list = new ArrayList<>();
//			
//			for(i=0; i<6;i++) { // readLine() : 파일에 개행된 한 줄을 읽어옴
//				str[i]=br.readLine();
//				
//				 String[] vals = str[i].split("\",\"");
////				 System.out.println("vals[0] = " + vals[0]);
////				 System.out.println("vals[4] = " + vals[4]);
////				 System.out.println("vals[10] = " + vals[10]);
////				 System.out.println("vals[15] = " + vals[15]);
////				 System.out.println("vals[19] = " + vals[19]);
////				 System.out.println("vals[21] = " + vals[21]);
////				 System.out.println("vals[34] = " + vals[34]);
//				 if(i == 34) {
//					 ArrayList<SubjectVo> subject = new ArrayList<SubjectVo>(); 
//					
//					 String[] subjects = subject[i].split(",");
//				 }
//				 
//				 
//				 Vo vo = new Vo(vals[0], vals[4], vals[10], vals[15], vals[19],vals[21], vals[25],
//							vals[26], vals[27],  subject);
//				 list.add(vo); // csv파일의 한줄이 하나의 객체가 됨
//				 System.out.println(vo);
//				 
//			}
			request.setAttribute("list", list); //request에 담아 뷰페이지에 보내줌. 
			br.close();
			fr.close(); //스트림 닫기
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("servlet으로 가야지");
		return "/clinic/list.jsp";
	}

}
