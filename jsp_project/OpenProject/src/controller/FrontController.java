package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DeleteMemberServiceImpl;
import service.EditFormMemberServiceImpl;
import service.EditMemberServiceImpl;
import service.IdChkMemberServiceImpl;
import service.IndexMemberServiceImpl;
import service.ListMemberServiceImpl;
import service.MemberService;
import service.RegAjaxMemberServiceImpl;
import service.RegFormMemberServiceImpl;
import service.RegMemberServiceImpl;

public class FrontController extends HttpServlet {

	private Map<String, MemberService> uriMap = new HashMap<String, MemberService>();
	
	// 1. 초기화 : Service 객체들을 관리 -> init() 오버라이딩
	@Override
	public void init() throws ServletException {
		
		// / 요청
		uriMap.put("/", new IndexMemberServiceImpl());
		
		// / index
		uriMap.put("/index", new IndexMemberServiceImpl());
		
		// / member/regForm
		uriMap.put("/member/regForm", new RegFormMemberServiceImpl());
		uriMap.put("/member/reg", new RegMemberServiceImpl());
		uriMap.put("/member/reg_ajax", new RegAjaxMemberServiceImpl());
		
		// /member/idChk
		uriMap.put("/member/idChk", new IdChkMemberServiceImpl());
		
		// 회원 리스트
		uriMap.put("/member/list", new ListMemberServiceImpl());
		
		// 회원 정보 수정
		uriMap.put("/member/editForm", new EditFormMemberServiceImpl());
		uriMap.put("/member/edit", new EditMemberServiceImpl());
		
		// 회원 정보 삭제
		uriMap.put("/member/delete", new DeleteMemberServiceImpl());
		
		// 회원 로그인
		// uriMap.put("/login/loginForm", new LoginFormMemberServiceImpl());
		// uriMap.put("/login/login", new LoginMemberServiceImpl());
		
		// 회원 마이페이지
		// uriMap.put("/users/mypage", new MyPageMemberServiceImpl());
		
		// 기능 확장 : Service 구현 클래스 생성, view(jsp) 생성
	}
	
	// 2. 모든 요청 처리
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 분석
		String uri = request.getRequestURI(); // /op/member/list
		String conPath = request.getContextPath(); // /op (배포할 때는  /op 안 보이게)
		
		if(uri.indexOf(conPath)==0) {
			uri = uri.substring(conPath.length());
		}
		System.out.println("사용자 요청 URI : "+uri);
		
		// 요구사항에 대한 처리
		// 핵심 처리, 결과 데이터를 request 속성에 저장
		// view 페이지 지정
		
		MemberService ms = null;
		
		ms = uriMap.get(uri);
		
		/*
		 * if(uri.equals("/index")) { ms = new IndexMemberServiceImpl(); } else
		 * if(uri.equals("/member/regForm")) { ms = new RegFormMemberServiceImpl(); }
		 */
		
		String viewPage = "/WEB-INF/views/index.jsp";
		
		if(ms != null) {
			viewPage = ms.process(request);
		}
		
		// 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	
	
}
