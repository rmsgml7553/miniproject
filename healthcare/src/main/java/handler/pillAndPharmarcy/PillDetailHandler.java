package handler.pillAndPharmarcy;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

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
import xmlVo.PillXMLVo;

public class PillDetailHandler implements Handler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
			HttpSession session = request.getSession();
			session.setAttribute("id", "jwon");

			
			String urlstr = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?numOfRows=100&serviceKey=";
			String key = "bqTgmGj7ItAbq2DiNASFtZc1bLpVOnmxgQP2mIiFcd0LjXFFPBUKTpUTfxkXmItZ0FFLutJ2Jzqu5Cr0gzM5PQ%3D%3D";
			String requestItemSeq = request.getParameter("itemSeq");
			System.out.println(requestItemSeq);

			StringBuilder sb = new StringBuilder();
			sb.append(urlstr).append(key).append("&itemSeq=").append(requestItemSeq);
			
			String temp = sb.toString();
			System.out.println(temp);
			URL url = new URL(temp);
			URLConnection conn = url.openConnection();
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(conn.getInputStream());
			
			Element root = doc.getDocumentElement();
			Element item = (Element) root.getElementsByTagName("item").item(0);
			String entpName = item.getElementsByTagName("entpName").item(0).getTextContent(); // 업체명
			String itemName = item.getElementsByTagName("itemName").item(0).getTextContent(); // 제품명
			String itemSeq = item.getElementsByTagName("itemSeq").item(0).getTextContent();	  // 퓸목 기준 코드
			String efcyQesitm = item.getElementsByTagName("efcyQesitm").item(0).getTextContent(); // 문항1(효능)

			String useMethodQesitm = null; // 사용법
			if(item.getElementsByTagName("useMethodQesitm").item(0) != null) {
				useMethodQesitm = item.getElementsByTagName("useMethodQesitm").item(0).getTextContent(); 
			}
			
			String atpnWarnQesitm = null; // 주의사항 경고
			if(item.getElementsByTagName("atpnWarnQesitm").item(0) != null) {
				atpnWarnQesitm = item.getElementsByTagName("atpnWarnQesitm").item(0).getTextContent();
			}			
			
			String atpnQesitm = null; // 주의사항
			if(item.getElementsByTagName("atpnQesitm").item(0) != null) {
				atpnQesitm = item.getElementsByTagName("atpnQesitm").item(0).getTextContent();
			}
			
			String intrcQestim = null; // 상호작용
			if(item.getElementsByTagName("intrcQestim").item(0) != null) {
				intrcQestim = item.getElementsByTagName("intrcQestim").item(0).getTextContent();
			}
			
			String seQestim = null; // 부작용
			if(item.getElementsByTagName("seQestim").item(0) != null) {
				seQestim = item.getElementsByTagName("seQestim").item(0).getTextContent();
			}
			
			String depositMethodQesitm = null; // 보관법
			if(item.getElementsByTagName("depositMethodQesitm").item(0) != null) {
				depositMethodQesitm = item.getElementsByTagName("depositMethodQesitm").item(0).getTextContent();
			}
			String updateDe = null; // 수정일자
			if(item.getElementsByTagName("updateDe").item(0) != null) {
				updateDe = item.getElementsByTagName("updateDe").item(0).getTextContent();
			}
			String itemImage = null; // 이미지
			if(item.getElementsByTagName("itemImage").item(0) != null) {
				itemImage = item.getElementsByTagName("itemImage").item(0).getTextContent();
			}			
			PillXMLVo vo = new PillXMLVo(entpName, itemName, itemSeq, efcyQesitm, useMethodQesitm, atpnWarnQesitm, atpnQesitm, intrcQestim, seQestim, depositMethodQesitm, itemImage,updateDe);
			request.setAttribute("PillXMLVo", vo);
			
			
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
		
		return "/pill/pillDetail.jsp";
	}

}
