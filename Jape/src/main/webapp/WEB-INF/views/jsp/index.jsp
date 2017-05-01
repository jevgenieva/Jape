<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Cache-control" content="no-cache">

    <title>Jape</title>

  
    <!-- Pop Up Login 
  
    <link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css"> -->
    
    <!-- Bootstrap Core CSS -->
    <link href="/Jape/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Jape/css/blog-home.css" rel="stylesheet">
    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script>
$(document).ready(function(e) {
    var $input = $('#refresh');

    $input.val() == 'yes' ? location.reload(true) : $input.val('yes');
});
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>



</head>
<body>

<input type="hidden" id="refresh" value="no">

<jsp:include page="navigationBar.jsp" />

    <!-- Page Content -->
    <div id="gags" class="container">
    <div class="col-md-8">
    
    			<c:if test="${sessionScope.gags == null}">
    			<c:out value="No japes to show!"></c:out>
    			</c:if>
				<c:forEach var="gag" items="${sessionScope.gags }">
				<div id="${gag.getGagID() }">

				<b><c:out value="${gag.getTitle() }"></c:out></b><br> <br>
				<a href="/Jape/jape/${gag.getGagID()}"><img src="/Jape/image/${gag.getGagID()}" width="555"/></a> 
				
			<!-- - 
			 page errorPage="errorPage.jsp" %>
				
				-->	
				
				<c:if test="${ sessionScope.logged }">
				<c:out value="${gag.getUpvotes() }"></c:out>
				
				<c:choose>
				    <c:when test="${!sessionScope.user.isVoted(gag.getGagID()) }">
				    	<a id="upvote" href="/Jape/upvote?gagId=${gag.getGagID()}"><img src="image/29" width="20"></a>
						<a id="downvote" href="/Jape/downvote?gagId=${gag.getGagID()}"><img src="image/30" width="20"></a>
				    </c:when>
				    <c:when test="${sessionScope.user.isVoted(gag.getGagID())}">
				    	<c:if test="${sessionScope.user.isLiked(gag.getGagID())}">
				        <a id="upvote" href="/Jape/upvote?gagId=${gag.getGagID()}"><img src="image/31" width="20"></a>
						<a id="downvote" href="/Jape/downvote?gagId=${gag.getGagID()}"><img src="image/30" width="20"></a>
						</c:if>
						
						<c:if test="${!sessionScope.user.isLiked(gag.getGagID())}">
				        <a id="upvote" href="/Jape/upvote?gagId=${gag.getGagID()}"><img src="image/29" width="20"></a>
						<a id="downvote" href="/Jape/downvote?gagId=${gag.getGagID()}"><img src="image/32" width="20"></a>
						</c:if>
						
				    </c:when>
				    
				</c:choose>
				</c:if>
				
				</div>
				
				<hr> <br> <br> <br>
				</c:forEach>


            </div>
            

				<div class="container">
               <div class="row">
            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">

                <!-- Blog Search Well -->
                <div class="well">
                    <h4>Search Jape</h4>
                    <div class="input-group">
                        <input type="text" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                    </div>
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Blog Categories</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.col-lg-6 -->
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                        <!-- /.col-lg-6 -->
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>Side Widget Well</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>

            </div>

        </div>
        <!-- /.row -->
        </div>


    <!-- jQuery -->
    <script src="/Jape/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Jape/js/bootstrap.min.js"></script>
   
    <!-- PopUp login 
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>-->
    

</body>

</html>
