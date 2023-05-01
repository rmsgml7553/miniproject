package handler.pillAndPharmarcy;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import handler.Handler;
import member.MemberService;
import p_rep.P_repService;
import p_rep.P_repVo;
import p_rrep.P_rrepService;
import xmlVo.PharmarcyXMLVo;

public class PharmarcyDetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String urlstr = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyBassInfoInqire?pageNo=1&numOfRows=1000&servicekey=";
		String key = "bqTgmGj7ItAbq2DiNASFtZc1bLpVOnmxgQP2mIiFcd0LjXFFPBUKTpUTfxkXmItZ0FFLutJ2Jzqu5Cr0gzM5PQ%3D%3D";
		StringBuilder sb = new StringBuilder();
		System.out.println(request.getMethod());
		try {
			request.setCharacterEncoding("utf-8");
			String requestHpid = request.getParameter("hpid");

			sb.append(urlstr).append(key).append("&HPID=").append(requestHpid);
			String temp = sb.toString();
			System.out.println(temp);
			URL url = new URL(temp);
			URLConnection conn = url.openConnection();

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(conn.getInputStream());

			Element root = doc.getDocumentElement();
			Element item = (Element) root.getElementsByTagName("item").item(0);
			PharmarcyXMLVo tempVo;
			String dutyAddr = item.getElementsByTagName("dutyAddr").item(0).getTextContent();
			String dutyName = item.getElementsByTagName("dutyName").item(0).getTextContent();
			String dutyTel = item.getElementsByTagName("dutyTel1").item(0).getTextContent();
			String[][] dutyTimeList = new String[8][2];

			for (int j = 1; j <= 8; j++) {
				switch (j) {
				case 1:
					dutyTimeList[j - 1][0] = "월요일";
					break;
				case 2:
					dutyTimeList[j - 1][0] = "화요일";
					break;
				case 3:
					dutyTimeList[j - 1][0] = "수요일";
					break;
				case 4:
					dutyTimeList[j - 1][0] = "목요일";
					break;
				case 5:
					dutyTimeList[j - 1][0] = "금요일";
					break;
				case 6:
					dutyTimeList[j - 1][0] = "토요일";
					break;
				case 7:
					dutyTimeList[j - 1][0] = "일요일";
					break;
				case 8:
					dutyTimeList[j - 1][0] = "공휴일";
					break;
				}
				StringBuilder sbc = new StringBuilder();
				StringBuilder sbs = new StringBuilder();
				sbc.append("dutyTime").append(j).append("c");
				sbs.append("dutyTime").append(j).append("s");
				Element dutyTimeC = (Element) item.getElementsByTagName(sbc.toString()).item(0);
				Element dutyTimeS = (Element) item.getElementsByTagName(sbs.toString()).item(0);

				if (dutyTimeC != null && dutyTimeS != null) {
					String tempC = dutyTimeC.getTextContent();
					String tempS = dutyTimeS.getTextContent();
					
					StringBuilder tempBuilder = new StringBuilder();
					tempBuilder.append(tempS).append(" ~ ").append(tempC);
					dutyTimeList[j - 1][1] = tempBuilder.toString();
				}

			}
			String hpid = item.getElementsByTagName("hpid").item(0).getTextContent();
			if (item.getElementsByTagName("wgs84Lat").item(0) != null
					&& item.getElementsByTagName("wgs84Lon").item(0) != null) {
				String wgs84Lat = item.getElementsByTagName("wgs84Lat").item(0).getTextContent();
				String wgs84Lon = item.getElementsByTagName("wgs84Lon").item(0).getTextContent();
				tempVo = new PharmarcyXMLVo(dutyAddr, dutyName, dutyTel, dutyTimeList, hpid, wgs84Lat, wgs84Lon);
			} else {
				tempVo = new PharmarcyXMLVo(dutyAddr, dutyName, dutyTel, dutyTimeList, hpid, "0", "0");
			}

			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("loginId");
			P_repService repService = new P_repService();
			ArrayList<P_repVo> list = repService.select(hpid);
			if (id != null) {
				MemberService memberService = new MemberService();
				String memberCode = memberService.getByMember(id).getCode();
				System.out.println("list : " + list);
				request.setAttribute("code", memberCode);
			}
			request.setAttribute("PharmarcyVo", tempVo);
			request.setAttribute("repList", list);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "/pharmarcy/pharmarcyDetail.jsp";
	}

}
