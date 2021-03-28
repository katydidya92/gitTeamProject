package com.tp.location.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;

public class PageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("M : PageListAction_execute() 호출");

		// 한글데이터 처리 
		request.setCharacterEncoding("UTF-8");
		
        /*
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr?serviceKey=EqnjMBGeUpo9DqVpO34OCurjpYBj41wnKXIO32ED%2FqbUJQLQ3mZ8enu5AMkzR%2FwAnPNE%2FZ8%2BD60PnFDPv7GwbA%3D%3D&pageNo=1&numOfRows=100"); URL
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        String result2 = sb.toString();
        System.out.println(result2);
        */
        
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./location/ex31.jsp");
		
		forward.setRedirect(false);
		// true - sendRedirect() 방식으로 이동 (주소,화면 변경O)
		// false - forward() 방식으로 이동 (주소 변경x, 화면 변경 O)
		
		return forward;
	}

}
