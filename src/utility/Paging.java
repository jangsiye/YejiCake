package utility;

public class Paging {

	private int totalCount;	//총 데이터 개수
	private int totalPage;	//총 페이지 개수(totalCount/10+1)
	
	private int pageNumber;	//현재 페이지 넘버
	private int pageSize;	//한 페이지에 들어가는 게시글 수
	private int beginRow;	//해당 페이지의 가장 상위 랭킹 행  ex)5페이지 beginRow는 랭킹 41위
	private int endRow;		//해당 페이지의 가장 하위 랭킹 행
	
	private int pageCount=10;	//화면 하단에 보이는 페이지 개수
	private int beginPage;	//화면 하단에 보이는 시작 페이지 번호
	private int endPage;	//화면 하단에 보이는 끝 페이지 번호
	
	private String url;		//list.jsp
	private String pagingHtml;	//화면 하단의 페이징 처리 부분 전체
	private String pagingStatus;	//현재 페이지 상태 : 총 게시물 개수(총 페이지 수/현재 페이지)   ex)총 123개(3/13)


	//생성자
	public Paging(String pageNumber, String pageSize, int totalCount, String url) {
		////////// 1. pageNumber와 pageSize는 파싱해줘야 함 //////////
		//조건에 맞지 않는 데이터가 넘어오면, 파라미터가 넘어오지 않으면, 게시물 입력후 list로 자동이동하면
		if(pageNumber == null || pageNumber.equals("null")) {
			pageNumber="1";		//기본값 1
		}
		this.pageNumber = Integer.parseInt(pageNumber);	//int로 파싱
		
		if(pageSize == null || pageSize.equals("null")) {
			pageSize="10";	//기본값 10
		}
		this.pageSize = Integer.parseInt(pageSize);
		
		////////////// 2. 얘네는 그냥 대입 /////////////
		this.totalCount = totalCount;
		this.url = url;
		
		////////// 3. 나머지는 계산해서 넣어줘야 함 //////////
		this.totalPage = this.totalCount/this.pageSize+1;
		
		//beginRow가 좀 헷갈림!
		this.beginRow = (this.pageSize*(this.pageNumber-1))+1 ;
		this.endRow = this.pageSize*this.pageNumber;
		
		//마지막 페이지의 마지막 행의 랭킹은 게시물 개수와 같음
		//ex)34 > 40 -> endRow를 34로 치환
		if(this.endRow > this.totalCount) {
			this.endRow = this.totalCount;
		}
		
		//beginPage가 헷갈림!
		//현재페이지넘버-1 해주는 이유는 10단위를 나누면 몫이 어긋나버려서!
		//현재페이지넘버-1를 페이지 갯수로 나누고, 거기에 다시 페이지 갯수를 곱하면, 현재페이지넘버의 10의자리수가 나옴
		//거기에 1을 더하면 beginPage가 됨. (ex)1,11,21,31...)
		this.beginPage = ((this.pageNumber-1)/this.pageCount)*this.pageCount+1;
		this.endPage = this.beginPage + this.pageCount-1;
	
		//마지막 페이지 번호는 총 페이지 개수와 같음
		//총 게시물 134개. 마지막 번호는 20이 아니라 14
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
		
		this.pagingHtml = get_html();	//길어져서 따로 메소드 사용
		this.pagingStatus = "총"+this.totalCount+"건("+this.pageNumber+"/"+this.totalPage+")";
	}

	//페이징 처리 전체를 담는 변수인 pagingHhml을 구하는 메소드
	//세 군데로 나눌거임
	private String get_html() {
		//html에 전송할 문자열
		String result = "";
		
		//1. 맨처음 이전
		if(this.pageNumber <= pageCount) {
			//엔티티 : html 특수기호. 기호가 문자 데이터로 인식이 되지 않으므로 entity code를 사용. 
			//&nbsp; : 띄워쓰기를 위한 엔티티 / &lt; less than (<) / &gt; gearter than (>)
			result += "맨처음&nbsp;&nbsp;";
			result += "이전&nbsp;&nbsp;";
		} else {
			//'맨처음'과 '이전'에 앵커 태그 삽입
			//html은 외따옴표도 돌아가니까 '로 치겠음
			//<a href='list.jsp?pageNumber=5&pageSize=10'>맨처음</a>
			result += "<a href='" +this.url+ "?pageNumber=" +this.pageNumber+
					"&pageSize=" +this.pageSize+ "'>맨처음</a>&nbsp;&nbsp;" ;
			
			result += "<a href='" +this.url+ "?pageNumber=" +(this.beginPage-1)+
					"&pageSize=" +this.pageSize+ "'>이전</a>&nbsp;&nbsp;" ;
		}
		
		//2. 페이지
		for(int i=this.beginPage; i<=this.endPage; i++) {
			//i가 현재 페이지이면
			if( i == this.pageNumber) {
				//현재 페이지는 빨간색으로 굵게 표시.
				result += "<font color='red'><b>" + i + "</b></font>&nbsp;&nbsp;";
			}else {
				//현재 페이지 아니면 앵커 걸어서 그 페이지로 가야함
				result += "<a href='" +this.url+ "?pageNumber=" + i +
						"&pageSize=" +this.pageSize+ "'>" + i + "</a>&nbsp;&nbsp;" ;
			}
		}
		
		//3. 다음 맨끝
		if(this.pageNumber >= (totalPage/pageCount*pageCount+1)) {
			result += "다음&nbsp;&nbsp;";
			result += "맨끝&nbsp;&nbsp;";
		} else {
			result += "<a href='" +this.url+ "?pageNumber=" +(this.endPage+1)+
					"&pageSize=" +this.pageSize+ "'>다음</a>&nbsp;&nbsp;" ;
			
			result += "<a href='" +this.url+ "?pageNumber=" +this.totalPage+
					"&pageSize=" +this.pageSize+ "'>맨끝</a>&nbsp;&nbsp;" ;
		}
		
		return result;
	}

	//페이징 변수들을 출력하는 메소드
	public void getInfomation() {
		System.out.println("totalCount 총 게시물 개수 : " + totalCount);
		System.out.println("totalPage 총 페이지 개수 : " + totalPage);
		System.out.println("pageNumber 현재 페이지 번호 : " + pageNumber);
		System.out.println("pageSize 한 페이지의 게시글 수 : " + pageSize);
		System.out.println("beginRow 한 페이지의 가장 상위 랭킹 행 : " + beginRow);
		System.out.println("endRow 한 페이지의 가장 하위 랭킹 행 : " + endRow);
		System.out.println("pageCount 한 화면에 나타나는 페이지 개수: " + pageCount);
		System.out.println("beginPage 페이지 시작 번호 : " + beginPage);
		System.out.println("endPage 페이지 끝 번호 : " + endPage);
		System.out.println("url : " + url);
		System.out.println("pagingStatus : " + pagingStatus);
		System.out.println("==================================");
		System.out.println("pagingHtml : " + pagingHtml);
	}

	//getter
	public int getBeginRow() {
		return beginRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public String getUrl() {
		return url;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public String getPagingStatus() {
		return pagingStatus;
	}
	
	
	
}
