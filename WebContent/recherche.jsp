<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html  >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/fileinput.js "></script>
<script src="resources/js/fileinput.min.js "></script>
<script src="resources/js/fileinput_locale_fr.js "></script>



<title>Chercher des images</title>
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
					<a class="navbar-brand" href="index.jsp"> <i class="glyphicon glyphicon-home"></i>
					</a>
					<a class="navbar-brand" href="recherche.jsp"> <i class="glyphicon glyphicon-search"></i>
					</a>
					<a class="navbar-brand" href="upload_image.jsp">  <i class="glyphicon glyphicon-plus"></i>
					</a>
				</div>
			</div>
		</nav>

<p><h1 style="font-size: 40px;text-align:center; font-weight:900;color: #793059 ;  ">Bienvenue Dans L'application Descartes Images Similarity</h1></p>
	<br><br><br><div class="container" style="margin-left:350px;      ">

<div class="container">

 
<div class="well">
		<legend>
		
		<form method="post" action="recherche" enctype="multipart/form-data">
			<fieldset >
				 
				 <input type="file" name="image"  accept="image/x-png, image/gif, image/jpeg" >
				<br>
				<input type="submit" value="Charger l'image">
			</fieldset>
		</form>
	</legend>
	</div></div>
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