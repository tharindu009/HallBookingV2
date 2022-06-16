<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset_password.aspx.cs" Inherits="HallBookingV2.reset_password" %>


<!doctype html>
<html lang="en">
<head>

	<!-- Google Tag Manager -->
	<script>
		(function (w, d, s, l, i) {
			w[l] = w[l] || []; w[l].push({
				'gtm.start':
				new Date().getTime(), event: 'gtm.js'
			}); var f = d.getElementsByTagName(s)[0],
			j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
			'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-NMRNSQF');
	</script>
	<!-- End Google Tag Manager -->


	<!-- Favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
	<link rel="manifest" href="/favicon/site.webmanifest">
	<link rel="mask-icon" href="/favicon/safari-pinned-tab.svg" color="#5bbad5">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">

	<!-- Favicon End -->


	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="placefinder">
	<meta name="description" content="Search and book places for all occasions. Here you will find places for parties, weddings, conferences and other types of events.">

	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
	<link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/user.css">
	<link rel="stylesheet" href="assets/css/sticky.css">


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-127812484-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() { dataLayer.push(arguments); }
		gtag('js', new Date());

		gtag('config', 'UA-127812484-1');
	</script>


	<title>Place Finder | Reset Password</title>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
	<script>
		$(document).ready(function () {
			$("#repeat_password").keyup(validate);
		});


		function validate() {
			var password1 = $("#password").val();
			var password2 = $("#repeat_password").val();



			if (password1 == password2) {
				$("#validate-status").text("valid");
			}
			else {
				$("#validate-status").text("invalid");
			}

		}

	</script>

</head>
<body>

	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NMRNSQF"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	

	<form runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<div class="page sub-page">
			<!--*********************************************************************************************************-->
			<!--************ HERO ***************************************************************************************-->
			<!--*********************************************************************************************************-->
			<section class="hero">
				<div class="hero-wrapper">
					<!--============ Secondary Navigation ===============================================================-->
					<div class="secondary-navigation">
						<div class="container">
							<ul class="left">
								<li>
									<span>
										<i class="fa fa-phone"></i>+94 76 61 35 962
									</span>
								</li>
							</ul>
							<!--end left-->
							<ul class="right">
								<%--<li>
								<a href="my-ads.html">
									<i class="fa fa-heart"></i>My Ads
								</a>
							</li>--%>
								<asp:LoginView runat="server" ViewStateMode="Disabled">
									<AnonymousTemplate>

										<li><a runat="server" href="~/signin.aspx">
											<i class="fa fa-sign-in"></i>Sign In
										</a>
										</li>
										<li><a runat="server" href="~/register.aspx">
											<i class="fa fa-pencil-square-o"></i>Register</a></li>

									</AnonymousTemplate>
									<LoggedInTemplate>

										<li><a runat="server" href="~/my_profile.aspx" title="">
											<i class="fa fa-heart"></i>Hello, <%=UserName %> !</a>

										</li>
										<li>
											<asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log out" LogoutPageUrl="~/" OnLoggingOut="Unnamed_LoggingOut" />
										</li>

									</LoggedInTemplate>
								</asp:LoginView>
							</ul>
							<!--end right-->
						</div>
						<!--end container-->
					</div>
					<!--============ End Secondary Navigation ===========================================================-->
					<!--============ Main Navigation ====================================================================-->
					<div class="main-navigation">
						<div class="container">
							<nav class="navbar navbar-expand-lg navbar-light justify-content-between top-navbar" data-toggle="sticky-onscroll">
								<a class="navbar-brand" href="/Home">
									<img src="assets/img/logo1.png" alt="placefinder logo" id="logoimg">
								</a>
								<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbar">
									<!--Main navigation list-->
									<ul class="navbar-nav" id="menuui">
										<li class="nav-item">
											<a class="nav-link" href="/Home">Home</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="listing_grid.aspx">Browse Venue</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/contact">Contact</a>
										</li>
										<li class="nav-item">
											<a href="/add_venue" class="btn btn-primary text-caps btn-rounded btn-framed">Add your Venue</a>
										</li>
									</ul>
									<!--Main navigation list-->
								</div>
								<!--end navbar-collapse-->
								<a href="#collapseMainSearchForm" class="main-search-form-toggle" data-toggle="collapse" aria-expanded="false" aria-controls="collapseMainSearchForm">
									<i class="fa fa-search"></i>
									<i class="fa fa-close"></i>
								</a>
								<!--end main-search-form-toggle-->
							</nav>
							<!--end navbar-->
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/Home">Home</a></li>
								<li class="breadcrumb-item"><a href="#">User</a></li>
								<li class="breadcrumb-item active">Forgot password</li>
							</ol>
							<!--end breadcrumb-->
						</div>
						<!--end container-->
					</div>
					<!--============ End Main Navigation ================================================================-->
					<!--============ Hero Form ==========================================================================-->
					<div class="collapse" id="collapseMainSearchForm">
						<div class="hero-form form">
							<div class="container">
								<!--Main Form-->
								<div class="main-search-form">
									<div class="form-row">
										<div class="col-md-3 col-sm-3">
											<div class="form-group">
												<label for="category" class="col-form-label">Type of Event?</label>
												<asp:DropDownList ID="drpCategory" class="small" runat="server" data-placeholder="Select Category">
													<asp:ListItem Value="0">Select Event Type</asp:ListItem>
													<asp:ListItem Value="1">Wedding</asp:ListItem>
													<asp:ListItem Value="2">Conference</asp:ListItem>
													<asp:ListItem Value="3">Birthday Party</asp:ListItem>
													<asp:ListItem Value="4">Office Party</asp:ListItem>
													<asp:ListItem Value="5">Other</asp:ListItem>
												</asp:DropDownList>
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-3-->
										<div class="col-md-3 col-sm-3">
											<div class="form-group">
												<label for="category" class="col-form-label">Type of Event?</label>
												<asp:DropDownList ID="DropDownList1" class="small" runat="server" data-placeholder="Select Category">
													<asp:ListItem Value="0">Select Event Type</asp:ListItem>
													<asp:ListItem Value="1">Wedding</asp:ListItem>
													<asp:ListItem Value="2">Conference</asp:ListItem>
													<asp:ListItem Value="3">Birthday Party</asp:ListItem>
													<asp:ListItem Value="4">Office Party</asp:ListItem>
													<asp:ListItem Value="5">Other</asp:ListItem>
												</asp:DropDownList>
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-3-->
										<div class="col-md-3 col-sm-3">
											<div class="form-group">
												<label for="Guests" class="col-form-label">No of Guests?</label>
												<asp:DropDownList ID="drpGuests" class="small" runat="server" data-placeholder="Select No of People">
													<asp:ListItem Value="0">Select no of people</asp:ListItem>
													<asp:ListItem Value="1">0-10</asp:ListItem>
													<asp:ListItem Value="2">10-30</asp:ListItem>
													<asp:ListItem Value="3">50-100</asp:ListItem>
													<asp:ListItem Value="4">100-150</asp:ListItem>
													<asp:ListItem Value="5">150-200</asp:ListItem>
													<asp:ListItem Value="6">200-250</asp:ListItem>
													<asp:ListItem Value="7">250-500</asp:ListItem>
													<asp:ListItem Value="8">500-1000</asp:ListItem>
													<asp:ListItem Value="9">1000+</asp:ListItem>
												</asp:DropDownList>
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-3-->
										<div class="col-md-3 col-sm-3">
											<label for="input-location" class="col-form-label">Where?</label>
											<asp:TextBox ID="txtLocation" class="form-control small" runat="server" placeholder="Enter Location"></asp:TextBox>
											<%--<input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">--%>
											<%--<span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>--%>
										</div>
										<!--end col-md-3-->
									</div>
									<!--end form-row-->
								</div>
								<!--end main-search-form-->
								<!--Alternative Form-->
								<%--<div class="alternative-search-form">
								<a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse" aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
								<div class="collapse" id="collapseAlternativeSearchForm">
									<div class="wrapper">
										<div class="form-row">
											<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
												<label>
													<input type="checkbox" name="new">
													New
											
												</label>
												<label>
													<input type="checkbox" name="used">
													Used
											
												</label>
												<label>
													<input type="checkbox" name="with_photo">
													With Photo
											
												</label>
												<label>
													<input type="checkbox" name="featured">
													Featured
											
												</label>
											</div>
											<!--end col-xl-6-->
											<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
												<div class="form-row">
													<div class="col-md-4 col-sm-4">
														<div class="form-group">
															<input name="min_price" type="text" class="form-control small" id="min-price" placeholder="Minimal Price">
															<span class="input-group-addon small">$</span>
														</div>
														<!--end form-group-->
													</div>
													<!--end col-md-4-->
													<div class="col-md-4 col-sm-4">
														<div class="form-group">
															<input name="max_price" type="text" class="form-control small" id="max-price" placeholder="Maximal Price">
															<span class="input-group-addon small">$</span>
														</div>
														<!--end form-group-->
													</div>
													<!--end col-md-4-->
													<div class="col-md-4 col-sm-4">
														<div class="form-group">
															<select name="distance" id="distance" class="small" data-placeholder="Distance">
																<option value="">Distance</option>
																<option value="1">1km</option>
																<option value="2">5km</option>
																<option value="3">10km</option>
																<option value="4">50km</option>
																<option value="5">100km</option>
															</select>
														</div>
														<!--end form-group-->
													</div>
													<!--end col-md-3-->
												</div>
												<!--end form-row-->
											</div>
											<!--end col-xl-6-->
										</div>
										<!--end row-->
									</div>
									<!--end wrapper-->
								</div>
								<!--end collapse-->
							</div>--%>
								<!--end alternative-search-form-->
							</div>
							<!--end container-->
						</div>
						<!--end hero-form-->
					</div>
					<!--end collapse-->
					<!--============ End Hero Form ======================================================================-->
					<!--============ Page Title =========================================================================-->
					<div class="page-title">
						<div class="container">
							<h1>Forgot your password?</h1>
						</div>
						<!--end container-->
					</div>
					<!--============ End Page Title =====================================================================-->
					<div class="background"></div>
					<!--end background-->
				</div>
				<!--end hero-wrapper-->
			</section>
			<!--end hero-->

			<!--*********************************************************************************************************-->
			<!--************ CONTENT ************************************************************************************-->
			<!--*********************************************************************************************************-->
			<section class="content">
				<section class="block">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-4">
								<div class="form clearfix">
									<div class="form-group">
										<label for="email" class="col-form-label required">New Password</label>
										<%--<asp:TextBox ID="txtNewPassword" CssClass="form-control small" placeholder="New Password" runat="server" required></asp:TextBox>--%>
										<input name="password" type="password" class="form-control small" id="password" placeholder="Password" required>
									</div>
									<div class="form-group">
										<label for="email" class="col-form-label required">Confirm Password</label>
										<%--<asp:TextBox ID="txtCnfPass" CssClass="form-control small" placeholder="Confirm Password" runat="server" required></asp:TextBox>--%>
										<input name="repeat_password" type="password" class="form-control small" id="repeat_password" placeholder="Repeat Password" required>
										<p><small id="validate-status"></small></p>
									</div>
									<!--end form-group-->
									<div class="d-flex justify-content-between align-items-baseline">
										<asp:UpdatePanel ID="UpdatePanel1" runat="server">
											<ContentTemplate>
												<asp:Button ID="btnSend" CssClass="btn btn-primary small" runat="server" Text="Reset Password" OnClick="btnSend_Click" />
											</ContentTemplate>
										</asp:UpdatePanel>
										<asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
										<%--<button type="submit" class="btn btn-primary">Sign In</button>--%>
									</div>
								</div>
								<hr />
							</div>
							<!--end col-md-6-->
						</div>
						<!--end row-->
					</div>
					<!--end container-->
				</section>
				<!--end block-->
			</section>
			<!--end content-->

			<!--*********************************************************************************************************-->
			<!--************ FOOTER *************************************************************************************-->
			<!--*********************************************************************************************************-->
			<section class="footer">
				<div class="wrapper">
					<div class="container">
						<div class="row">
							<div class="col-md-5">
								<a href="#" class="brand">
									<img src="assets/img/logo1.png" alt="">
								</a>
								<p>
									Book unique spaces for corporate and private events including parties, meetings, dinners, weddings
							lunch and breakfast events as well as summer & christmas parties. 
							Find the best party venues for graduations and birthdays. View images and find best prices.
						
								</p>
							</div>
							<!--end col-md-5-->
							<div class="col-md-3">
								<h2>Navigation</h2>
								<div class="row">
									<div class="col-md-6 col-sm-6">
										<nav>
											<ul class="list-unstyled">
												<li>
													<a href="default.aspx">Home</a>
												</li>
												<li>
													<a href="listing_grid.aspx">Browse Venue</a>
												</li>
												<li>
													<a href="contact.aspx">Contact</a>
												</li>
												<li>
													<a href="add_venue1.aspx">Add your Venue</a>
												</li>
											</ul>
										</nav>
									</div>
									<div class="col-md-6 col-sm-6">
										<nav>
											<ul class="list-unstyled">
												<li>
													<a href="signin.aspx">Sign In</a>
												</li>
												<li>
													<a href="/register">Register</a>
												</li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<!--end col-md-3-->
							<div class="col-md-4">
								<h2>Contact</h2>
								<address>
									<figure>
										<br>
									</figure>
									<br>
									<strong>Email:</strong> <a href="#">info@placefinder.lk</a>
									<br>
									<strong>Phone: </strong>+94 76 61 35 962
							
								<br>
									<br>
									<a href="contact.aspx" class="btn btn-primary text-caps btn-framed">Contact Us</a>
								</address>
							</div>
							<!--end col-md-4-->
						</div>
						<!--end row-->
					</div>
					<div class="row">
						<div class="col-md-12">
							<div id="social_footer">
								<ul>
									<li><a href="#"><i class="fa fa-facebook" style="font-size: 22px"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter" style="font-size: 22px"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus" style="font-size: 22px"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram" style="font-size: 22px"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest" style="font-size: 22px"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo" style="font-size: 22px"></i></a></li>
									<li><a href="#"><i class="fa fa-youtube-play" style="font-size: 22px"></i></a></li>
								</ul>
								<p>
									Copyright ©
									<script type="text/JavaScript"> var theDate = new Date(); document.write(theDate.getFullYear())</script>
									Place Finder. All Rights Reserved | Design & Developed by <a href="http://evesys.lk">Evesys</a>
								</p>
							</div>
						</div>
					</div>
					<div class="background">
						<div class="background-image original-size">
							<img src="assets/img/footer-background-icons.jpg" alt="">
						</div>
						<!--end background-image-->
					</div>
					<!--end background-->
				</div>
			</section>
			<!--end footer-->
		</div>
		<!--end page-->

		<script src="assets/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="assets/js/popper.min.js"></script>
		<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
		<script src="assets/js/selectize.min.js"></script>
		<script src="assets/js/masonry.pkgd.min.js"></script>
		<script src="assets/js/icheck.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/custom.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

		<script type="text/javascript">

			function changed() {
				swal(
					{
						title: 'Great!',
						text: 'Your password has been reset.',
						type: 'success',
						icon: "success",
						button: "Login Now!",
						confirmButtonColor: '#4fa7f3'
					}).then(function () {
						window.location = "signin.aspx";
					});
			}

			function error() {
				swal(
					{
						title: 'Sorry!',
						text: 'Somthing went wrong! Please try again in few minutes.',
						type: 'error',
						icon: "error",
						button: "Go to Home!",
						confirmButtonColor: '#4fa7f3'
					}).then(function () {
						window.location = "/Home";
					});
			}
						
		</script>

	</form>

</body>
</html>



