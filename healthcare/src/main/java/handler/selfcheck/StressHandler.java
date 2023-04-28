package handler.selfcheck;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import selfcheck.SelfCheckService;
import selfcheck.SelfCheckVo;
import selfcheck.StressVo;

public class StressHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String view = "";
		if (request.getMethod().equals("GET")) {
			view = "/selfcheck/stress.jsp";
			String path = request.getServletContext().getRealPath("/WEB-INF/files/stress.txt");
			try {
				FileReader fr = new FileReader(path);
				char[] buf = new char[10000];
				fr.read(buf);

				String str = new String(buf);
				String[] data = str.split("\n");
				ArrayList<StressVo> list = new ArrayList<>();
				for (int i = 0; i < data.length; i++) {
					String[] vals = data[i].split("\t");
					if (vals.length < 3) {
						continue;
					}
					list.add(new StressVo(vals[0], vals[1]));
					request.setAttribute("list", list);
					request.setAttribute("cnt", list.get(list.size() - 1).getArg1());
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {// post
			double cnt = Integer.parseInt(request.getParameter("linecnt"));
			double sum = 0;
			for (int i = 1; i <= cnt; i++) {
				sum += Integer.parseInt(request.getParameter(Integer.toString(i)));
			}
			int stress = (int) Math.round(sum / 3 / cnt * 100);
			HttpSession session = request.getSession();
			session.setAttribute("stress", stress);

			SelfCheckService service = new SelfCheckService();
			String rs = service.calStress(sum);

			session.setAttribute("stressRs", rs);
			
//     		String id = (String) idsession.getAttribute("loginId");
			String id = "aaa";
			int height = (int) session.getAttribute("height");
			System.out.println(height);
			int weight = (int) session.getAttribute("weight");
			double bmr =  (double) session.getAttribute("bmr");
			double amr = (double) session.getAttribute("amr");
			double bmi = (double) session.getAttribute("bmi");
			NumberFormat numberFormat = NumberFormat.getInstance();
			String bmr1 = numberFormat.format((int) Math.round(bmr));
			String amr1 = numberFormat.format((int) Math.round(amr));
			String bmi1 = numberFormat.format((int) Math.round(bmi));
			session.setAttribute("bmr1", bmr1);
			session.setAttribute("amr1", amr1);
			session.setAttribute("bmi1", bmi1);

			service.addSelfCh(new SelfCheckVo(id, null, height, weight, bmr, amr, bmi, stress));
			
			LocalDate now = LocalDate.now();
			session.setAttribute("now", now);
	       
	
			view = "redirect:/selfcheck/result.jsp";		
		
		}
		return view;
	}

}
