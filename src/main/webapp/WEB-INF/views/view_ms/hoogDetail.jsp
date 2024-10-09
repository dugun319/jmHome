<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"><%@ include file="../kakao.jsp" %></script>

<title>구매자 - 내가 쓴 후기</title>
<link rel="stylesheet" href="../css/myPage.css">
<div class="header_continer"><%@ include file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../menu_B.jsp" %></div>
<style type="text/css">
.content{
	background-color:#f1f1f1;
	width: 1380px;
}
.block{
	background-color: white;
	width: 1240px;
}
.content {
	background-color: white;
	border-bottom: 10px;
	border-top: 10px;
	display: center;
	margin-top: 50px;
	padding-top: 50px;
	
}

.border {
	border-bottom: 10px;
	border-top: 10px;
	width: 1280px;
	padding-left: 50px;
	display: center;
	padding-top: 40px;
	padding-bottom: 40px;
	font-size: 16px;
}
.container{
	display:center;
	background-color: #f1f1f1;
}

tbody tr {
	background-image: url('../images/note.png'); /* 노트 이미지 경로 */
	background-size: cover; /* 이미지 크기 조정 */
	background-repeat: no-repeat;
	background-position: center;
	height: 50px; /* 행 높이 조정 */
}

tbody tr:last-child {
	background-image: none; /* 마지막 행은 이미지 제거 */
}
tbody td,
thead td{
	padding: 10px;
}

tbody tr {
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.10); /* 아래쪽으로 그림자 효과 */
	margin-bottom: 10px; /* 간격 조정 */
}
.block{
	display: center;
}
.rating {
    font-size: 24px; /* 별 크기 조절 */
}

.star {
    color: gray; /* 기본 색상 */
    margin-right: 2px; /* 간격 조정 */
}

.star.filled {
    color: gold; /* 채워진 별 색상 */
}
</style>
</head>



<script type="text/javascript">
	/* 체크박스 함수 */
		function handleSubmit(){
			const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
			//querySelectorAll이라는 메서드를 사용해 현재 문서에 체크된 :checked요소를 모두 선택해 결과를 nodeList로 반환
			const selectedPosts = Array.from(checkboxes).map(checkbox => (checkbox.value));
			//map 메서드를 사용해 checkbox.value를 호출해 체크박스 값을 수집				이거는 string이니까 형변환X
			if(selectedPosts.length===0){
				alert('삭제할 게시물을 선택해주세요');
				return;
			}
			//서버에 삭제요청을 보낸다.
			$.ajax({
				url: '/myHoogiDelete',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(selectedPosts),
				success: function(response){
					alert('선택한 게시물이 삭제되었습니다.');
					location.reload();
				},
				error: function(xhr, status, error){
					alert('삭제실패:' + xhr.statusText);
				}
			});
		}
</script>


<body>
	<div class="container">
		<main class="content">
			<h1 class="text-center" style="font-size: 40px; text-align: center;"><a href="#">나의 후기->내가 구매한 매물에 대해 작성한 후기로 바꿔야 함(이미지작업후)</a></h1><br><br>
			<div class="block">
				<table class="border">
					<thead>
						<tr>
							<td></td>
							<td>승인번호</td>
							<td>제목</td>
							<td>리뷰평점</td>
							<td>작성일자</td>
							<td>가격</td>
							<td>진행상태</td>
						</tr>
					</thead>
					<tbody>	
						<c:forEach var ="review" items="${reviews}">
						
							<tr>
								<td><input type="checkbox" name="post1" value=${review.approval_num}></td>
								<td><a href="/view_ms/hoogiDetail?approval_num=${review.approval_num}">${review.approval_num}</td>
								<td>${review.review_title}</td>
								<td>
									<div class="rating">
										<c:forEach var="i" begin="1" end="5">
											<span
												class="${i <= review.evaluation ? 'star filled' : 'star'}">&#9733;</span>
										</c:forEach>
									</div>
								</td>
								<td>${review.review_date}</td>
								<td>${review.price}만원</td>
								<td><img alt="" src="../images/main/구매완료.png"> </td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
			</div>
						
		</main>
		<img src="../images/main/삭제_but.png" alt="삭제하기" onclick="handleSubmit()" style="cursor: pointer;">
</div>
	<!--------------------------------------- 푸터 --------------------------------------->
	<%@ include file="../footer.jsp" %>
</body>
</html>