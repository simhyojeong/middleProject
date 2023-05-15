<%@page import="games.game.vo.GameVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="members.review.vo.MyReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	
	MyReviewVO rv = (MyReviewVO) request.getAttribute("rv"); 
%>
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰</title>

    <link
    rel="stylesheet"
    href="https://unpkg.com/swiper@7/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="../css/updateMyReview.css">
    <link rel="stylesheet" href="../css/review.css">
 


</head>
<body>

 <form action="/members/MyReviewUpdate.do" method="post">
				<input type="hidden" name="revId" value="<%=rv.getRevId() %>">
				<input type="hidden" name="gameId" value="<%=rv.getGameId() %>">
				<input type="hidden" name="memId" value="<%=rv.getMemId() %>">
				<input type="hidden" name="revDate" value="<%=rv.getRevDate()%>">
    <div class="container">
        <div class="board">
            <h2 class="text-light">My Review's Update</h2>
            
             
			<br>
			<fieldset id="fieldset">
				<input type="radio" class="reviewStar" name="revGrade" value="5" id="rate1">
				<label class="star_lbl" for="rate1" style="font-size: 25px;">★</label>
					<input type="radio" class="reviewStar" name="revGrade" value="4" id="rate2">
				<label class="star_lbl" for="rate2" style="font-size: 25px;">★</label>
					<input type="radio" class="reviewStar" name="revGrade" value="3" id="rate3">
				<label class="star_lbl" for="rate3" style="font-size: 25px;">★</label>
					<input type="radio" class="reviewStar" name="revGrade" value="2" id="rate4">
				<label class="star_lbl" for="rate4" style="font-size: 25px;">★</label>
					<input type="radio" class="reviewStar" name="revGrade" value="1" id="rate5" checked>
				<label class="star_lbl" for="rate5" style="font-size: 25px;">★</label>
			</fieldset>
			
			<div class="title" style="padding-top: 20px;">
				<p class="text-light">
					<input name="revTitle" type="text" class="form-control" autocomplete="off" style="width: 200px;"
						id="inputTitle" placeholder="제목을 입력하세요." value="<%=rv.getRevTitle() %>" required/>
				</p>
			</div>
			
			
            <!-- Slider main container -->
            <div class="swiper">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide">
                    <div class="flex">
                        <div class="comments">
							<textarea rows="" cols="" name="revCont" required="required" placeholder="내용을 입력하세요." autocomplete="off" id="inputCont"><%=rv.getRevCont()%></textarea>
                        </div>
                        
                        
                        <div class="profile">
	
<!--                         <img src="https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60" alt=""> -->
                            <img src="<%=rv.getGameImg().trim()%>">
                            <a class="game_name"><%=rv.getGameName() %></a>
                            <span><%=rv.getRevDate() %></span>
                        </div>
                    </div>
                          <button type="submit" class="btn_upd">Update</button>
                </div>

                
                </div>
               

                
                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>
            
                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
        </div>
        		</div>

 </form>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>



    <script>
// const swiper = new Swiper('.swiper', {
//     loop: true,

//      // If we need pagination
//   pagination: {
//     el: '.swiper-pagination',
//   },

//     // Navigation arrows
//     navigation: {
//         nextEl: '.swiper-button-next',
//         prevEl: '.swiper-button-prev',
//     },


// })

    </script>
    
    
</body>
</html>

	