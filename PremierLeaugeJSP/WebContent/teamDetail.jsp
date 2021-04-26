<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Team Detail</title>

</head>
<body>
	<jsp:include page="header.jsp" />
		
		<div class="teamDetail__title">
			<img src="${imageUrl}"></img>
			<h1>${teamname}</h1>
		</div>
		<hr>
		<div class="teamDetail__selectBtn" style="background-color: ${teamcolor}">
			<button class="mainBtn">Main</button>
			<button class="playerInfoBtn">Players</button>
			<button class="stadiumInfoBtn">Home Stadium</button>
			<hr>
		</div>
		
		<div class="teamDetail__main">
			<h3>team detail!</h3>
			<!--  
			<ul>
				<li>
					<img src="./img/맨체스터시티.png" class="main__img">
				</li>
				<li><h3>연고지:  Manchester</h3></li>
				<li><h3>설립연도:  1880년, 세인트 마크스</h3></li>
				<li><h3>애칭:  블루스, 블루문, 시티즌, 샤크팀</h3></li>
				  
				<li>	
					<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%B9%BC%EB%91%94+%EC%95%8C+%EB%AC%B4%EB%B0%94%EB%9D%BC%ED%81%AC">
						<h3>회장:  칼둔 알 무바라크 </h3>
					</a>
				</li>
				<li>
					<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%ED%8E%A9+%EA%B3%BC&qdt=0&ie=utf8&query=%ED%8E%A9+%EA%B3%BC%EB%A5%B4%EB%94%94%EC%98%AC%EB%9D%BC">
						 <h3>감독:  펩 과르디올라</h3>
					</a>
				</li>	
				<li>
					<a href="https://www.mancity.com/">
						<h3>공식 웹사이트</h3>
					</a>
				</li>
			</ul>
			-->	
		</div>
		
		
		<div class="teamDetail__player hidden">
			<div class="gk">
				<h2 class="teamDetail__player__position">골키퍼</h2>
				<hr/>		
				<c:forEach var="player" items="${playerList}">
					<c:if test="${player.getPosition() eq 'G' }">
						<div class="teamDetail__player__GK">
							<ul>
								<li class="teamDetail__player__li">
									<h3>등번호: ${player.getNumber()}</h3>
									<h3>선수 이름: ${player.getName()}</h3>
									<h3>나이: ${player.getAge()}</h3>
								</li>
							</ul>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="df">
				<h2 class="teamDetail__player__position">수비수</h2>
				<hr/>
					<c:forEach var="player" items="${playerList}">
						<c:if test="${player.getPosition() eq 'D' }">
							<div class="teamDetail__player__DF">
								<ul>
									
									<li class="teamDetail__player__li">
										<h3>등번호: ${player.getNumber()}</h3>
										<h3>선수 이름: ${player.getName()}</h3>
										<h3>나이: ${player.getAge()}</h3>
										<h3>⚽: ${player.getGoals()}</h3>
										<h3>도움 수: ${player.getAssists()}</h3>
									</li>
									
								</ul>
							</div>
						</c:if>
					</c:forEach>	
			</div>
			<div class ="mf">
				<h2 class="teamDetail__player__position">미드필더</h2>	
				<hr/>
				<c:forEach var="player" items="${playerList}">
					<c:if test="${player.getPosition() eq 'M' }">
									
						<div class="teamDetail__player__MF">
							<ul>
								
								<li class="teamDetail__player__li">
									<h3>등번호: ${player.getNumber()}</h3>
									<h3>선수 이름: ${player.getName()}</h3>
									<h3>나이: ${player.getAge()}</h3>
									<h3>⚽: ${player.getGoals()}</h3>
									<h3>도움 수: ${player.getAssists()}</h3>
								</li>
								
							</ul>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="fw">
				<h2 class="teamDetail__player__position">공격수</h2>
				<hr/>
					<c:forEach var="player" items="${playerList}">
						<c:if test="${player.getPosition() eq 'A' }">	
							
							<div class="teamDetail__player__FW">
								<ul>
									
									<li class="teamDetail__player__li">
										<h3>등번호: ${player.getNumber()}</h3>
										<h3>선수 이름: ${player.getName()}</h3>
										<h3>나이: ${player.getAge()}</h3>
										<h3>⚽: ${player.getGoals()}</h3>
										<h3>도움 수: ${player.getAssists()}</h3>
									</li>
									
								</ul>
							</div>
						</c:if>
					</c:forEach>
			</div>		
		</div>
		
		<div class="teamDetail__stadium hidden">
			<h3>stadium!</h3>
		</div>
		
		<!-- <li><a href="#">에티하드 스타디움</a></li> -->
			
	<jsp:include page="footer.jsp" />
	
	<script type="text/javascript">
		
	const mainPage = document.querySelector(".teamDetail__main");
	const playerPage = document.querySelector(".teamDetail__player");
	const stadiumPage = document.querySelector(".teamDetail__stadium");
	
	const mainBtn = document.querySelector(".mainBtn");
	const playerBtn = document.querySelector(".playerInfoBtn");
	const stadiumBtn = document.querySelector(".stadiumInfoBtn");

	
	function showMain() {
		mainPage.classList.remove("hidden");
		playerPage.classList.add("hidden");
		stadiumPage.classList.add("hidden");
	}
	
	function showPlayer() {
		mainPage.classList.add("hidden");
		playerPage.classList.remove("hidden");
		stadiumPage.classList.add("hidden");
	}
	
	function showStadium() {
		mainPage.classList.add("hidden");
		playerPage.classList.add("hidden");
		stadiumPage.classList.remove("hidden");
	}
	
	mainBtn.addEventListener("click", showMain);
	playerBtn.addEventListener("click", showPlayer);
	stadiumBtn.addEventListener("click", showStadium);

</script>
	
</body>
</html>