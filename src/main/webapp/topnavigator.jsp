<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("utf-8");

	// 오라클드라이버  
	String OracleDriver = application.getInitParameter("oracleDriver");
	application.setAttribute("OracleDriver", OracleDriver);
	
	// 상품썸네일이미지 디렉토리 
	if(application.getAttribute("thumImgDir") == null )
	{
		String thumImgDir = application.getContextPath() + "/primg/thum/";
		application.setAttribute("thumImgDir", thumImgDir);
	}	
	
	// 상품상세정보이미지 디렉토리 
	if(application.getAttribute("detailImgDir") == null )
	{
		String detailImgDir = application.getContextPath() + "/primg/detail/";
		application.setAttribute("detailImgDir", detailImgDir);
	}
	
	// 리소스 이미지 디렉토리 
	if(application.getAttribute("resource") == null )
	{
		String resources = application.getContextPath() + "/resource/";
		application.setAttribute("resource", resources);
	}
	
	
	if( session.getAttribute("user_id") != null )
	{
		
	}
	// 로그인 세션 정보저장
	//session.setAttribute("user_id", "1");
	//session.setAttribute("grade", "admin");
	//session.setAttribute("grade", "customer");
	//session.setAttribute("name", "jdbcproj");
	//session.setAttribute("name", "obama");
	
	//session.getAttribute("user_id");
	//session.getAttribute("grade");
	//session.getAttribute("name");
	
	// 로그아웃 세션 정보제거
	//session.removeAttribute("user_id");
	//session.removeAttribute("grade");
	//session.removeAttribute("name");
	
	// session.invalidate(); <-- 호출하지 마세요~
	
%>

<c:if test="${not empty sessionScope.userId}">
    <c:set target="${sessionScope}" property="user_id" value="${sessionScope.user_id}"/>
    <c:set target="${sessionScope}" property="grade" value="${sessionScope.grade}"/>
    <c:set target="${sessionScope}" property="name" value="${sessionScope.name}"/>
</c:if>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=shopping_bag" />

<style type="text/css">

*{
	margin: 0px;
	padding: 0px;
}



#topnavigation_container {
	display: flex;
	position:sticky;
	justify-content:center;
	top:0px;
	background:black;
	width:100%;
	height: 92px;
	color:#FFFFFF;
	font-family: "Lucida Sans", sans-serif;
}

#topnavigation_container .logo {
	margin:0px 20px;
	width: 80px;
}

#topnavigation_container .navibox_container {
	margin:0px 20px;
	width: 900px;
	display: block;
}

#topnavigation_container .usermenu {
	font-family: "Lucida Sans", sans-serif;
	font-size: 1.0em;
	width:100%;
	justify-content:center;
	align-content:center;
	text-align:right;
	margin-top:20px;
}

#topnavigation_container .customer {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #FFFF00;
}

#topnavigation_container .camenu_container {
	display: flex;
}

#topnavigation_container .camenu_container .camenu {
	width:25%;
	height:40px;
	align-content:center;
	color:#FFFFFF;
	text-align: center;
}

#topnavigation_container .camenu_container .camenu:hover {
	background-color: #222222;
	width:25%;
	color:#FFFFFF;
	text-align: center;
}

.link_white{
	color:#DDDDFF;
	font-size: 1.0em;
	text-decoration: none;
	font-family: "Kanit", sans-serif;
	font-weight: 600;
}
.link_white:hover{
	color:#FFFFFF;
}
.link_white:active :visited{
}



.material-symbols-outlined{
	color:gray;
}
.material-symbols-outlined:hover{
	color:white;
}
.material-symbols-outlined:active :visited{
}


</style>

<div id="topnavigation_container">
	<div class="logo"><a href="/main.jsp"><img width="100px" src="${resource}mlblogo.png"/></a></div>
	<div class="navibox_container">
	
		<div class="usermenu">
			<c:if test="${not empty user_id && grade eq 'admin'}">
				<span>${name} 님 <span style="color:red">관리자</span> 계정 입니다.</span>
			</c:if>

			<c:if test="${not empty user_id && grade ne 'admin'}">
				<span>${name} 님 <span style="color:red">일반사용자</span> 계정 입니다. </span>
				<a href=""><span class="link_white">logOut</span></a>
				<a href="/cart.jsp">
				<span class="material-symbols-outlined" style="position: relative; top: 5px ; margin-left:15px">shopping_bag</span>
				</a>
			</c:if>

			<c:if test="${empty user_id}">
				<a href="/join.jsp"><span class="link_white">join</span></a> | 
				<a href="/log.jsp"><span class="link_white">logIn</span></a>
				<span class="material-symbols-outlined" style="position: relative; top: 5px ; margin-left:15px;visibility:hidden">shopping_bag</span>
			</c:if>
		
		</div>
		
		
		<c:if test="${not empty user_id && grade eq 'admin'}">
			<div class="camenu_container">
				<div class="camenu">
					<a class="link_white" href="/productcategory.jsp?ca_id=BallCap">회원관리</a>
				</div>
				<div class="camenu">
  					<a class="link_white" href="/productcategory.jsp?ca_id=Hat">상품관리</a>
  				</div>
  				<div class="camenu">
  					<a class="link_white" href="/productcategory.jsp?ca_id=Season">주문조회</a>
  				</div>
  				<div class="camenu">
  					<a class="link_white" href="/productcategory.jsp?ca_id=Beanie">매출통계</a>
  				</div>
			</div>
		</c:if>
		
		<c:if test="${grade ne 'admin'}">
			<div class="camenu_container">
			<div class="camenu">
				<a class="link_white" href="/productcategory.jsp?ca_id=BallCap">BallCap</a>
			</div>
			<div class="camenu">
  				<a class="link_white" href="/productcategory.jsp?ca_id=Hat">Hat</a>
  			</div>
  			<div class="camenu">
  				<a class="link_white" href="/productcategory.jsp?ca_id=Season">Season</a>
  			</div>
  			<div class="camenu">
  				<a class="link_white" href="/productcategory.jsp?ca_id=Beanie">Beanie</a>
  			</div>
		</div>
		</c:if>
		
	</div>
</div>



