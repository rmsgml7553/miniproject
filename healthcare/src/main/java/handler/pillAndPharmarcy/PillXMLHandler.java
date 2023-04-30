package handler.pillAndPharmarcy;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;

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
import xmlVo.PillXMLVo;

public class PillXMLHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			String urlstr = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?numOfRows=100&serviceKey=";
			String key = "bqTgmGj7ItAbq2DiNASFtZc1bLpVOnmxgQP2mIiFcd0LjXFFPBUKTpUTfxkXmItZ0FFLutJ2Jzqu5Cr0gzM5PQ%3D%3D";
			String inputEntpName = "";
			String inputItemName = "";
			if(request.getParameter("from").equals("searchHandler")) {
				inputEntpName = (String)request.getAttribute("entpName");
				inputItemName = (String)request.getAttribute("itemName");
			}else {
				inputEntpName = request.getParameter("entpName");
				inputItemName = request.getParameter("itemName");
			}
			
			if (inputEntpName == null)
				inputEntpName = "";
			if (inputItemName == null)
				inputItemName = "";

			StringBuilder sb = new StringBuilder();
			sb.append(urlstr).append(key).append("&entpName=").append(URLEncoder.encode(inputEntpName, "utf-8"))
					.append("&itemName=").append(URLEncoder.encode(inputItemName, "utf-8"));
			String temp = sb.toString();
			URL url = new URL(temp);
			URLConnection conn = url.openConnection();

//			InputStream in = conn.getInputStream();
//			InputStreamReader rd = new InputStreamReader(in);
//			char[] data = new char[1000];
//			rd.read(data);
//			String str = new String(data);
//			System.out.println(str);
//			rd.close();
			
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(conn.getInputStream());

			Element root = doc.getDocumentElement();
			NodeList items = root.getElementsByTagName("item");
			System.out.println(items.getLength());
			ArrayList<PillXMLVo> list = new ArrayList<>();
			for (int i = 0; i < items.getLength(); i++) {
				PillXMLVo vo;
				Element item = (Element) items.item(i);
				String entpName = item.getElementsByTagName("entpName").item(0).getTextContent();
				String itemName = item.getElementsByTagName("itemName").item(0).getTextContent();
				String itemSeq = item.getElementsByTagName("itemSeq").item(0).getTextContent();
				
				vo = new PillXMLVo(entpName, itemName, itemSeq, null, null, null, null, null, null, null, null); 
				list.add(vo);
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

		return "/pill/pillList.jsp";
	}

}
