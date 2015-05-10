<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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




<title>Résultat de la recherche</title>
<style type="text/css">
/
*
 
.mag {
	width: 200px;
	margin: 0 auto;
	float: none;
}

.mag img {
	max-width: 100%;
}

.magnify {
	position: relative;
	cursor: none
}

.magnify-large {
	position: absolute;
	display: none;
	width: 175px;
	height: 175px;
	-webkit-box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px
		rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
	-moz-box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px
		rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
	box-shadow: 0 0 0 7px rgba(255, 255, 255, 0.85), 0 0 7px 7px
		rgba(0, 0, 0, 0.25), inset 0 0 40px 2px rgba(0, 0, 0, 0.25);
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	border-radius: 100%
}
</style>
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
	

	<div class="container">
		 
		
		
		
		<div class="row">
		<div class="container col-sm-6 well" > 
		<h3>Résultat Algo 1</h3>
					<div class="row  "></div>
					
					<c:forEach items="${images }" var="image">
						<div class="col-md-3">
							<div class="mag">
								<p>
									<c:out value="${image['name']}" />
									<br>
									<c:out value="${image['distance']}" />
								</p>
								<br> <img data-toggle="magnify"
									src="data:image/jpeg;base64,${image['image']}" alt=""
									height="150" width="150">
							</div>
							<hr>
						</div>
						<!--/span-->

					</c:forEach>
					
					</div> 




		<div class="container col-sm-6 well" > 
		<h3>Résultat trouvé par l'algo 2</h3>
		
		<div class="row ">
		
		<c:forEach items="${images2 }" var="image">
						<div class="col-md-3">
							<div class="mag">
								<p>
									<c:out value="${image['name']}" />
									<br>
									<c:out value="${image['distance']}" />
								</p>
								<br> <img data-toggle="magnify"
									src="data:image/jpeg;base64,${image['image']}" alt=""
									height="150" width="150">
							</div>
							<hr>
						</div>
						<!--/span-->

					</c:forEach>
		
		
		</div></div>
		
		
		</div>
		
		
		 
		</div>
		<!-- / .container -->
		<script>
			!function($) {

				"use strict"; // jshint ;_;

				/* MAGNIFY PUBLIC CLASS DEFINITION
				 * =============================== */

				var Magnify = function(element, options) {
					this.init('magnify', element, options)
				}

				Magnify.prototype = {

					constructor : Magnify

					,
					init : function(type, element, options) {
						var event = 'mousemove', eventOut = 'mouseleave';

						this.type = type
						this.$element = $(element)
						this.options = this.getOptions(options)
						this.nativeWidth = 0
						this.nativeHeight = 0

						this.$element.wrap('<div class="magnify" \>');
						this.$element.parent('.magnify').append(
								'<div class="magnify-large" \>');
						this.$element.siblings(".magnify-large").css(
								"background",
								"url('" + this.$element.attr("src")
										+ "') no-repeat");

						this.$element.parent('.magnify').on(
								event + '.' + this.type,
								$.proxy(this.check, this));
						this.$element.parent('.magnify').on(
								eventOut + '.' + this.type,
								$.proxy(this.check, this));
					}

					,
					getOptions : function(options) {
						options = $.extend({}, $.fn[this.type].defaults,
								options, this.$element.data())

						if (options.delay && typeof options.delay == 'number') {
							options.delay = {
								show : options.delay,
								hide : options.delay
							}
						}

						return options
					}

					,
					check : function(e) {
						var container = $(e.currentTarget);
						var self = container.children('img');
						var mag = container.children(".magnify-large");

						// Get the native dimensions of the image
						if (!this.nativeWidth && !this.nativeHeight) {
							var image = new Image();
							image.src = self.attr("src");

							this.nativeWidth = image.width;
							this.nativeHeight = image.height;

						} else {

							var magnifyOffset = container.offset();
							var mx = e.pageX - magnifyOffset.left;
							var my = e.pageY - magnifyOffset.top;

							if (mx < container.width()
									&& my < container.height() && mx > 0
									&& my > 0) {
								mag.fadeIn(100);
							} else {
								mag.fadeOut(100);
							}

							if (mag.is(":visible")) {
								var rx = Math.round(mx / container.width()
										* this.nativeWidth - mag.width() / 2)
										* -1;
								var ry = Math.round(my / container.height()
										* this.nativeHeight - mag.height() / 2)
										* -1;
								var bgp = rx + "px " + ry + "px";

								var px = mx - mag.width() / 2;
								var py = my - mag.height() / 2;

								mag.css({
									left : px,
									top : py,
									backgroundPosition : bgp
								});
							}
						}

					}
				}

				/* MAGNIFY PLUGIN DEFINITION
				 * ========================= */

				$.fn.magnify = function(option) {
					return this
							.each(function() {
								var $this = $(this), data = $this
										.data('magnify'), options = typeof option == 'object'
										&& option
								if (!data)
									$this.data('tooltip', (data = new Magnify(
											this, options)))
								if (typeof option == 'string')
									data[option]()
							})
				}

				$.fn.magnify.Constructor = Magnify

				$.fn.magnify.defaults = {
					delay : 0
				}

				/* MAGNIFY DATA-API
				 * ================ */

				$(window).on('load', function() {
					$('[data-toggle="magnify"]').each(function() {
						var $mag = $(this);
						$mag.magnify()
					})
				})

			}(window.jQuery);
		</script>
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