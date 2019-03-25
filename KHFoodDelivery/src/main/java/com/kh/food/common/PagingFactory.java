package com.kh.food.common;

public class PagingFactory {
	public static String getPageBar(int totalCon, int cPage, int numPerPage, String url) {
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalCon/numPerPage);
		
		//이전
		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}
		else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'이전</a>";
			pageBar+="</li>";
		}
		
		//현재
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:void(0);' onclick='fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}
		else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		//페이징처리 스크립트작성
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage) {";
		pageBar+="location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	
	//메인에서 가게 찾기  때문에 매개변수 추가해서 따로 하나 생성
	public static String getPageBar2(String category,int totalCon, int cPage, int numPerPage, String url) {
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalCon/numPerPage);
		
		//이전
		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}
		else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'이전</a>";
			pageBar+="</li>";
		}
		
		//현재
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:void(0);' onclick='fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}
		else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		//페이징처리 스크립트작성
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage) {";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&category="+category+"'";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	public static String getPageBar3(int memberNum,int totalCon, int cPage, int numPerPage, String url) {
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		int totalPage=(int)Math.ceil((double)totalCon/numPerPage);
		
		//이전
		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}
		else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'이전</a>";
			pageBar+="</li>";
		}
		
		//현재
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:void(0);' onclick='fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}
		else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		//페이징처리 스크립트작성
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage) {";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&memberNum="+memberNum+"'";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	
	//사장님 페이지 주문내역 페이징  때문에 만듬
		public static String getPageBar4(int totalCon, int cPage, int numPerPage, String url) {
			String pageBar="";
			int pageBarSize=5;
			
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			int totalPage=(int)Math.ceil((double)totalCon/numPerPage);
			
			//이전
			pageBar="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
				pageBar+="</li>";
			}
			
			//현재
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:void(0);' onclick='fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			//다음
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>다음</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			//페이징처리 스크립트작성
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage) {";
			pageBar+="location.href='"+url+"&cPage='+cPage";
			pageBar+="}";
			pageBar+="</script>";
			
			return pageBar;
		}
	
		public static String getPageBar5(int totalCon, int cPage, int numPerPage, String url) {
			String pageBar="";
			int pageBarSize=5;
			
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			int totalPage=(int)Math.ceil((double)totalCon/numPerPage);
			
			//이전
			pageBar="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'이전</a>";
				pageBar+="</li>";
			}
			
			//현재
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:void(0);' onclick='fn_paging("+pageNo+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			//다음
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>다음</a>";
				pageBar+="</li>";
			}
			else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			//페이징처리 스크립트작성
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage) {";
			pageBar+="location.href='"+url+"&cPage='+cPage";
			pageBar+="}";
			pageBar+="</script>";
			
			return pageBar;
		}

}
