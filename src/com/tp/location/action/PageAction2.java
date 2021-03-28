package com.tp.location.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class PageAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : PageListAction_execute() 호출");

		// 한글데이터 처리
		request.setCharacterEncoding("UTF-8");

		BufferedReader br = null;
		// DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		try {
			// OpenApi호출
			String urlstr = "http://apis.data.go.kr/6260000/FoodService/getFoodKr?serviceKey=EqnjMBGeUpo9DqVpO34OCurjpYBj41wnKXIO32ED%2FqbUJQLQ3mZ8enu5AMkzR%2FwAnPNE%2FZ8%2BD60PnFDPv7GwbA%3D%3D&pageNo=1&numOfRows=20";
			URL url = new URL(urlstr);
			System.out.println("url : " + url);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();

			// 응답 읽기
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line.trim();// result = URL로 XML을 읽은 값
			}

			// xml 파싱하기
			InputSource is = new InputSource(new StringReader(result));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();

			// 항목 중에서 위치와 상관 없이 items 라는 노드들 중에서 자식 노드가 item인 노드들을 사용하겠다.
			XPathExpression expr = xpath.compile("//items/item");
			NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
			StringBuffer result2 = new StringBuffer("");
			Node node;
			NodeList child;
			result2.append("[{");
			for (int i = 0; i < nodeList.getLength(); i++) {
				child = nodeList.item(i).getChildNodes();
				for (int j = 0; j < child.getLength(); j++) {
					node = child.item(j);
					result2.append("\"" + node.getNodeName() + "\" :\"" + node.getTextContent() + "\"");
					if (child.getLength() != j) {
						result2.append(",");
					} else {
						result2.append("\b}");
					}
					System.out.println(node);
					System.out.println(child.getLength());
					System.out.println("현재 노드 이름 : " + node.getNodeName());
					System.out.println("현재 노드 값 : " + node.getTextContent());
					System.out.println("");
				}
			}
			result2.append("]");
			System.out.println(result2);
			request.setAttribute("result2", result2);

			// 페이지 이동
			ActionForward forward = new ActionForward();
			forward.setPath("./location/ex32.jsp");

			forward.setRedirect(false);
			// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
			// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)

			return forward;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

}
