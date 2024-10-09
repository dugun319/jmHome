<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <style type="text/css">
                    body {
                        margin: 0px;
                        padding: 0px;
                    }

                    .navbar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        background-color: #fdfdfd;
                        height: 105px;
                        width: 100%;
                        padding: 0;
                        top: 0;
                        /* 상단에 위치하도록 설정 */
                        left: 0;
                        /* 왼쪽에 맞추어 위치 */
                        z-index: 1000;
                        /* 다른 요소들 위에 표시되도록 설정 */
                        white-space: nowrap;
                    }

                    /* 로고 이미지 스타일 */
                    .navbar img {
                        height: 65px;
                        width: auto;
                        /* 비율 유지*/
                        margin: 0 50px;
                    }

                    /* 메뉴바 스타일 */
                    .menu {
                        display: flex;
                        list-style: none;
                        padding: 0;
                        margin: 0;
                    }

                    /* 메뉴 항목 스타일 */
                    .menu li {
                        float: left;
                        margin: 15px 75px;
                    }

                    /* 메뉴 링크 스타일 */
                    .menu a {
                        text-align: center;
                        color: #323232;
                        font-size: 20px;
                        font-weight: bold;
                        text-decoration: none;
                        transition: color 0.3s;
                    }

                    /* 메뉴 항목에 마우스를 올렸을 때 */
                    .menu a:hover {
                        color: #FF4714;
                    }

                    .but_login:hover {
                        border-style: none;
                        background-color: #FF4714;
                        width: 100px;
                        height: 35px;
                        color: #fdfdfd;
                        margin: 0px 50px;
                        font-size: 15px;
                        font-weight: bold;
                    }

                    .but_login {
                        border-style: none;
                        background-color: #323232;
                        width: 100px;
                        height: 35px;
                        color: #fdfdfd;
                        margin: 0px 50px;
                        font-size: 15px;
                        font-weight: bold;
                    }

                    a {
                        text-decoration: none;
                        color: inherit;
                    }

                    .user {
                        font-size: 15px;
                        font-weight: bold;
                    }

                    .menu_login {
                        color: #323232;
                        text-decoration-line: none;
                    }

                    .menu_login:hover {
                        color: #FF4714;
                        text-decoration-line: none;
                    }
                </style>
            </head>

            <body>
                <div class="navbar">
                    <a href="/"><img src="../images/main/logo_web.png" alt="logoimg"></a>
                    <nav>
                        <ul class="menu">
                            <li><a href="/view_sh/kCar">국내</a></li>
                            <li><a href="/view_sh/fCar">해외</a></li>
                            <li><a href="/view_sh/ecoCar">친환경</a></li>
                            <li><a href="/view_sh/sellMyCar">내차팔기</a></li>
                            <li><a href="/view_jw/cs">고객지원</a></li>
                        </ul>
                    </nav>
                    <div class="user">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <!-- 세션이 있을 때: 마이페이지와 로그아웃 버튼 -->
                                <a class="menu_login" href="/view_jm/mypage">마이페이지</a>
                                <button class="but_login">
                                    <a href="/view_jm/logout">로그아웃</a>
                                </button>
                            </c:when>
                            <c:otherwise>
                                <!-- 세션이 없을 때: 회원가입과 로그인 버튼 -->
                                <a class="menu_login" href="/view_jm/joinType">회원가입</a>
                                <button class="but_login">
                                    <a href="/view_jm/login">로그인</a>
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </body>

            </html>