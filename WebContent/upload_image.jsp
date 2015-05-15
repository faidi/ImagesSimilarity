<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
</style>
<title>Ajouter une image à la base de données</title>
</head>

<body>

<!-- navbar -->
<nav class=" navbar-descart navbar-fixed-top" style="height: 60px;">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="#"> <img alt="Brand"
			class="img img-rounded " src="resources/images/logo-descartes.png"
			height="40" width="180">
		</a> <a class="navbar-brand" href="index.jsp"> <i
			class="glyphicon glyphicon-home"  style="color:white;"></i>
		</a> <a class="navbar-brand" href="recherche.jsp"> <i
			class="glyphicon glyphicon-search"  style="color:white;"></i>
		</a> <a class="navbar-brand" href="upload_image.jsp"> <i
			class="glyphicon glyphicon-plus"  style="color:white;"></i>
		</a>
	</div>
</div>
</nav>

<p>
<h1
	style="font-size: 40px; text-align: center; font-weight: 900; color: #793059;">Bienvenue
	Dans L'application Descartes Images Similarity</h1>
</p>
 
 
 
<hr>


	<div class="container " style="text-align: center;">
		<div class="   hero-widget well  " style="text-align: center;">
			<h5>Ajouter une image à la base de données</h5>

			<form method="post" action="upload" enctype="multipart/form-data"
				class="form-horizontal">
				<input id="input-20" type="file" name="image"
					accept="image/x-png, image/gif, image/jpeg" />



				<button class="btn   btn-circle btn-warning pull-right "
					type="submit">
					<span class="glyphicon glyphicon-send"></span>Charger l'image
				</button>


			</form>

		</div>
	</div>

	<script type="text/javascript">
	 
	$("#input-20").fileinput({
		browseClass: "btn btn btn-success btn-block",
		showCaption: false,
		showRemove: false,
		showUpload: false,
		showButton:false,
		browseIcon: '<i class="glyphicon glyphicon-picture"></i>',
	});
	</script>

	<footer> <nav class=" navbar-inverse  navbar-fixed-bottom"
		style="height: 20px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<p style="color: white">©copyright Université Paris Descartes</p>
		</div>
	</div>
	</nav> </footer>
</body>
</html>