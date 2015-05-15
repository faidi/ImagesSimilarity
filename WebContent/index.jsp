<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">-->

<!-- Optional theme -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/fileinput.js "></script>
<script src="resources/js/fileinput.min.js "></script>
<script src="resources/js/fileinput_locale_fr.js "></script>


<!-- Latest compiled and minified JavaScript -->



<style type="text/css">
.hero-widget {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

.hero-widget .icon {
	display: block;
	font-size: 96px;
	line-height: 96px;
	margin-bottom: 10px;
	text-align: center;
}

.hero-widget var {
	display: block;
	height: 64px;
	font-size: 64px;
	line-height: 64px;
	font-style: normal;
}

.hero-widget label {
	font-size: 17px;
}

.hero-widget .options {
	margin-top: 10px;
}
</style>


<title>Université Paris Descartes </title>

</head>
<body>

	 


		<!-- navbar -->
		<nav class=" navbar-descart navbar-fixed-top"
			style="height: 60px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <img alt="Brand"
						class="img img-rounded "
						  src="resources/images/logo-descartes.png"
						height="40" width="180">
					</a>
					<a class="navbar-brand" href="index.jsp"> <i class="glyphicon glyphicon-home"  style="color:white;"></i>
					</a>
					<a class="navbar-brand" href="recherche.jsp"> <i class="glyphicon glyphicon-search"  style="color:white;"></i>
					</a>
					<a class="navbar-brand" href="upload_image.jsp">  <i class="glyphicon glyphicon-plus"  style="color:white;"></i>
					</a>
				</div>
			</div>
		</nav>

<p><h1 style="font-size: 40px;text-align:center; font-weight:900;color: #793059 ;  ">Bienvenue Dans L'application Descartes Images Similarity</h1></p>
	<br><br><br>
	<div class="container" style="margin-left:auto;      ">

 

			<div class=" span3">
				<div class="hero-widget   ">
					<div class="icon">
						<a href="upload_image.jsp"> <i class="glyphicon glyphicon-plus"></i></a>
					</div>
					 
<div class="text">
						<h6 class="text-info">Ajouter une ou plusieurs  image(s)  dans la base de données</h6>
				</div>	 
					 
				</div>
			</div>
			<div class=" span3">
				<div class="hero-widget   ">
					<div class="icon">
						<a href="recherche.jsp"><i class="glyphicon glyphicon-search "></i>	</a>
					</div>
			 

						<h6   class="text-muted">Efféctuer une recherche à l'aide d'une image</h6>
					 
				</div>
			</div>

		</div> 
    
 
	</div>
	<footer>  <nav class=" navbar-inverse  navbar-fixed-bottom"
			style="height: 20px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<p style="color:white">©copyright Université Paris Descartes</p> 
				</div>
			</div>
		</nav>  </footer>

	
</body>
</html>