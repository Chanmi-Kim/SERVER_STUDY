package com.test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿(Servlet)의 역할
//- 기반은 평범한 자바 파일
//1. 비즈니스 코드 구현
//		- 데이터 가공 처리, 연산 등
//		- DB 업무
//2. 웹 페이지 제작
//		- HTML, CSS, JavaScript 코드를 문자열 취급 > 파일 쓰기 작업(네크워크 스트림 생성)


//클라이언트 <-> 서버
// : 상태 코드 전달
// 1XX
// 2XX : 성공 메시지
//		- 200 OK : 성공적으로 처리했습니다.
//		- 206 Partial Content : 부분 컨텐츠를 제공
// 3XX : 리다이렉트
// ----------------------------- 이후가 에러 메시지 브라우저 출력
// 4XX : 클라언트 오류
//		- 400 Bad Request : 요청 오류
//		- 401 Unauthorized : 인증 오류
//		- 403 Forbidden : 서버가 요청 거부
//		- 404 Not Found : 요청한 리소스가 없음(URL 틀림)
//		- 408 Request Timeout : 요청 만료 시간
// 5XX : 서버 오류
//		- 500 Internal Server Error : 서버 작업 중 오류 발생. 자바 에러, 오라클 에러(ORA-XXX)
//		- 502 Bad Gateway : 게이트웨이 동작 오류
//		- 504 Gateway Timeout : 게이트웨이 응답 지연
//		- 520 Unknown Error : 알 수 없는 오류


public class Ex06 extends HttpServlet {

	//사용자 정의 메소드 : 필요에 따라 구현 > 비즈니스 코드 구현을 위해서..
	public void test(int a, int b) {
		System.out.println(a + b);
	}
	
	//오버라이딩 메소드 : HttpServlet에서 구현된 메소드(Servlet 인터페이스의 추상 메소드)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
	}
	
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		//서블릿 호출
		// - init() > service() > doGet()
		// - init() > service() > doPost()
		// - service() > doGet()
		// - service() > doPost()
		
		//모든 요청이 발생할때마다 처음 실행되는 메소드
		// - 요청 초기화 작업 구현
		System.out.println("service() 호출");
		super.service(req, res);
	}
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init() 호출");
		super.init();
	}
	
	
	
}


















