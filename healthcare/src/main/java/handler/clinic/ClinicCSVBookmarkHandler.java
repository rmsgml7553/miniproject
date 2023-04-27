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

import org.json.simple.JSONObject;

import clinicbookmark.C_BookmarkService;
import clinicbookmark.C_BookmarkVo;
import handler.Handler;

public class ClinicCSVBookmarkHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("bookmark핸들러 도착");
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		String txt = null;

		String path = request.getServletContext().getRealPath("/WEB-INF/files/clinicall2.txt");

		try {
			FileInputStream fr = new FileInputStream(path);
			BufferedReader br = new BufferedReader(new InputStreamReader(fr, "utf-8"));

			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");

			int i = 0;
			String line;

			C_BookmarkService service = new C_BookmarkService();
			C_BookmarkVo vo = new C_BookmarkVo();
			ArrayList<String> subject;
			String num;

			boolean find = service.find(id, code);

			if (find == false) {

				while (((line = br.readLine()) != null)) {
					if (i != 0) {
						subject = new ArrayList<String>();
						String[] vals = line.split("\",\"");

						if (vals[4].equals(code)) {

							vo = new C_BookmarkVo(id, code);
							service.insert(vo);
							txt = "Y";
						}

					}
					i++;
				}
			} else {
				
				service.delete(id, code);
				txt = "N";
			}

			br.close();
			fr.close();


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

		return "responsebody/" + txt;
	}

}
