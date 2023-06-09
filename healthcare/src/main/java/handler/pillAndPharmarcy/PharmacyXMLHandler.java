package handler.pillAndPharmarcy;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import handler.Handler;
import xmlVo.PharmarcyXMLVo;

public class PharmacyXMLHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String urlstr = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?pageNo=1&numOfRows=1000&servicekey=";
		String key = "bqTgmGj7ItAbq2DiNASFtZc1bLpVOnmxgQP2mIiFcd0LjXFFPBUKTpUTfxkXmItZ0FFLutJ2Jzqu5Cr0gzM5PQ%3D%3D";
		ArrayList<PharmarcyXMLVo> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		try {
			request.setCharacterEncoding("utf-8");
			String search = request.getParameter("search");
			System.out.println("search : " + search);
			// null일 때는 전체 출력
			if (search == null) {
				sb.append(urlstr).append(key);
				String temp = sb.toString();
				URL url = new URL(temp);
				URLConnection conn = url.openConnection();
				
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(conn.getInputStream());
				
				Element root = doc.getDocumentElement();
				NodeList items = root.getElementsByTagName("item");
				for (int i = 0; i < items.getLength(); i++) {
					Element item = (Element) items.item(i);
					String dutyAddr = item.getElementsByTagName("dutyAddr").item(0).getTextContent();
					String dutyName = item.getElementsByTagName("dutyName").item(0).getTextContent();
					String dutyTel = item.getElementsByTagName("dutyTel1").item(0).getTextContent();
					String hpid = item.getElementsByTagName("hpid").item(0).getTextContent();
					list.add(new PharmarcyXMLVo(dutyAddr, dutyName, dutyTel, null, hpid, null, null));
				}
				
			}else {
				//null이 아닐 때 두번 출력 후 같은 거 제외
				
				// 주소를 기반으로 검색
				sb.append(urlstr).append(key).append("&Q0=").append(URLEncoder.encode(search, "utf-8"));
				String temp = sb.toString();	
				URL url = new URL(temp);
				URLConnection conn = url.openConnection();
				
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(conn.getInputStream());
				
				Element root = doc.getDocumentElement();
				NodeList items = root.getElementsByTagName("item");
				for (int i = 0; i < items.getLength(); i++) {
					Element item = (Element) items.item(i);
					String dutyAddr = item.getElementsByTagName("dutyAddr").item(0).getTextContent();
					String dutyName = item.getElementsByTagName("dutyName").item(0).getTextContent();
					String dutyTel = item.getElementsByTagName("dutyTel1").item(0).getTextContent();
					String hpid = item.getElementsByTagName("hpid").item(0).getTextContent();
					list.add(new PharmarcyXMLVo(dutyAddr, dutyName, dutyTel, null, hpid, null, null));
				}
				
				
				
				// 기관명을 기반으로 검색
				sb = new StringBuilder();
				sb.append(urlstr).append(key).append("&QN=").append(URLEncoder.encode(search, "utf-8"));
				temp = sb.toString();
				url = new URL(temp);
				conn = url.openConnection();
				
				factory = DocumentBuilderFactory.newInstance();
				builder = factory.newDocumentBuilder();
				doc = builder.parse(conn.getInputStream());
				
				root = doc.getDocumentElement();
				items = root.getElementsByTagName("item");
				for (int i = 0; i < items.getLength(); i++) {
					Element item = (Element) items.item(i);
					String dutyAddr = item.getElementsByTagName("dutyAddr").item(0).getTextContent();
					String dutyName = item.getElementsByTagName("dutyName").item(0).getTextContent();
					String dutyTel = item.getElementsByTagName("dutyTel1").item(0).getTextContent();
					String hpid = item.getElementsByTagName("hpid").item(0).getTextContent();
					// 같은 거 나올 경우 제외하고 삽입
					// contains를 이용하기 위해 equals override
					if(!list.contains(new PharmarcyXMLVo(dutyAddr, dutyName, dutyTel, null, hpid, dutyTel, hpid))) {
						list.add(new PharmarcyXMLVo(dutyAddr, dutyName, dutyTel, null, hpid, null, null));
					}
				}
			}
			request.setAttribute("list", list);

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
		return "/pharmarcy/pharmarcyList.jsp";
	}

}
