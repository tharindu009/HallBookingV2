<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my_venue.aspx.cs" Inherits="HallBookingV2.my_venue" %>

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


	<title>Place Finder | My Places</title>


	<!-- Modal CSS -->
	<style type="text/css">
		body {
			font-family: 'Varela Round', sans-serif;
		}

		.modal-confirm {
			color: #434e65;
			width: 525px;
		}

			.modal-confirm .modal-content {
				padding: 20px;
				font-size: 16px;
				border-radius: 5px;
				border: none;
			}

			.modal-confirm .modal-header {
				background: #47c9a2;
				border-bottom: none;
				position: relative;
				text-align: center;
				margin: -20px -20px 0;
				border-radius: 5px 5px 0 0;
				padding: 35px;
			}

			.modal-confirm h4 {
				text-align: center;
				font-size: 36px;
				margin: 10px 0;
			}

			.modal-confirm .form-control, .modal-confirm .btn {
				min-height: 40px;
				border-radius: 3px;
			}

			.modal-confirm .close {
				position: absolute;
				top: 15px;
				right: 15px;
				color: #fff;
				text-shadow: none;
				opacity: 0.5;
			}

				.modal-confirm .close:hover {
					opacity: 0.8;
				}

			.modal-confirm .icon-box {
				color: #fff;
				width: 95px;
				height: 95px;
				display: inline-block;
				border-radius: 50%;
				z-index: 9;
				border: 5px solid #fff;
				padding: 15px;
				text-align: center;
			}

				.modal-confirm .icon-box i {
					font-size: 64px;
					margin: -4px 0 0 -4px;
				}

			.modal-confirm.modal-dialog {
				margin-top: 80px;
			}

			.modal-confirm .btn {
				color: #fff;
				border-radius: 4px;
				background: #eeb711;
				text-decoration: none;
				transition: all 0.4s;
				line-height: normal;
				border-radius: 30px;
				margin-top: 10px;
				padding: 6px 20px;
				border: none;
			}

				.modal-confirm .btn:hover, .modal-confirm .btn:focus {
					background: #eda645;
					outline: none;
				}

				.modal-confirm .btn span {
					margin: 1px 3px 0;
					float: left;
				}

				.modal-confirm .btn i {
					margin-left: 1px;
					font-size: 20px;
					float: right;
				}

		.trigger-btn {
			display: inline-block;
			margin: 100px auto;
		}
	</style>


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
			<header class="hero">
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
								<%-- <li>
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
										<li><a runat="server" href="/register">
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
								<%--<li>
									<a href="signin.aspx">
										<i class="fa fa-sign-in"></i>Sign In
								</a>
								</li>
								<li>
									<a href="register.aspx">
										<i class="fa fa-pencil-square-o"></i>Register
								</a>
								</li>--%>
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
									<img src="assets/img/logo1.png" alt="" id="logoimg">
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
											<a class="nav-link" href="/browse">Browse Venue</a>
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
								<li class="breadcrumb-item"><a href="#">My Profile</a></li>
								<li class="breadcrumb-item active">Venues</li>
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
											<div class="form-group">
												<label for="input-location" class="col-form-label">Where?</label>
												<asp:TextBox ID="txtLocation" class="form-control small" runat="server" placeholder="Enter Location"></asp:TextBox>
												<%--<input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">--%>
												<%--<span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>--%>
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-3-->
										<div class="col-md-3 col-sm-3">
											<asp:Button ID="btnSearch" CssClass="btn btn-primary width-100 small" runat="server" Text="Search" OnClick="btnSearch_Click" />
											<%--<button type="submit" class="btn btn-primary width-100 small">Search</button>--%>
										</div>
										<!--end col-md-3-->
									</div>
									<!--end form-row-->
								</div>
								<!--end main-search-form-->
								<!--Alternative Form-->

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
							<h1>My Venue</h1>
						</div>
						<!--end container-->
					</div>
					<!--============ End Page Title =====================================================================-->
					<div class="background"></div>
					<!--end background-->
				</div>
				<!--end hero-wrapper-->
			</header>
			<!--end hero-->

			<!--*********************************************************************************************************-->
			<!--************ CONTENT ************************************************************************************-->
			<!--*********************************************************************************************************-->
			<section class="content">
				<section class="block">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<nav class="nav flex-column side-nav">
									<a class="nav-link icon" href="my_profile.aspx">
										<i class="fa fa-user"></i>My Profile
									</a>
									<a class="nav-link active icon" href="my_venue.aspx">
										<i class="fa fa-heart"></i>My Venue
									</a>
									<%--<a class="nav-link icon" href="bookmarks.html">
									<i class="fa fa-star"></i>Bookmarks
								</a>--%>
									<a class="nav-link icon" href="change_password.aspx">
										<i class="fa fa-recycle"></i>Change Password
									</a>
									<%--<a class="nav-link icon" href="sold-items.html">
									<i class="fa fa-check"></i>Sold Items
								</a>--%>
								</nav>
							</div>
							<!--end col-md-3-->
							<div class="col-md-9">
								<!--============ Section Title===================================================================-->
								<div class="section-title clearfix">
									<div class="float-left float-xs-none">
										<%--<label class="mr-3 align-text-bottom">Sort by: </label>
									<select name="sorting" id="sorting" class="small width-200px" data-placeholder="Default Sorting" >
										<option value="">Default Sorting</option>
										<option value="1">Newest First</option>
										<option value="2">Oldest First</option>
										<option value="3">Lowest Price First</option>
										<option value="4">Highest Price First</option>
									</select>--%>
									</div>
									<div class="float-right d-xs-none thumbnail-toggle">
										<a href="#" class="change-class" data-change-from-class="list" data-change-to-class="grid" data-parent-class="items">
											<i class="fa fa-th"></i>
										</a>
										<a href="#" class="change-class active" data-change-from-class="grid" data-change-to-class="list" data-parent-class="items">
											<i class="fa fa-th-list"></i>
										</a>
									</div>
								</div>
								<!--============ Items ==========================================================================-->
								<div class="items list compact grid-xl-3-items grid-lg-2-items grid-md-2-items">
									<asp:UpdatePanel ID="UpdatePanel1" runat="server">
										<ContentTemplate>
											<asp:Repeater ID="rptMyVenue" runat="server">
												<ItemTemplate>
													<div class="item">
														<div class="wrapper">
															<div class="image">
																<h3>
																	<a href="single_listing.aspx?vid=<%# Eval("VenueID") %>" class="tag category"><%# Eval("VenueID") %></a>
																	<a href="single_listing.aspx?vid=<%# Eval("VenueID") %>" class="title"><%# Eval("venue_name") %></a>
																	<span class="tag">Offer</span>
																</h3>
																<a href="single-listing.html?vid=<%# Eval("VenueID") %>" class="image-wrapper background-image">
																	<img src="<%# Eval("image") %>" alt="">
																</a>
															</div>
															<!--end image-->
															<h4 class="location">
																<a href="#"><%# Eval("city") %></a>
															</h4>
															<div class="price">LKR <%# Eval("price") %></div>
															<div class="admin-controls">
																<a href="edit_venue.aspx?vid=<%#Eval("VenueID") %>">
																	<i class="fa fa-pencil"></i>Edit
																</a>
																<%--<a href="#" class="ad-hide">
															<i class="fa fa-eye-slash"></i>Hide
														</a>--%>
																<asp:LinkButton ID="LinkEmail" CssClass="ad-remove" runat="server" CommandArgument='<%# Eval("VenueID") %>' OnClick="LinkEmail_Click"><i class="fa fa-trash"></i>Remove</asp:LinkButton>
																<%--<a href="#" class="ad-remove">
															<i class="fa fa-trash"></i>Remove
														</a>--%>
															</div>
															<!--end admin-controls-->
															<div class="description">
																<p><%# Eval("description") %></p>
															</div>
															<!--end description-->
															<a href="single_listing.aspx?vid=<%# Eval("VenueID") %>" class="detail text-caps underline">Detail</a>
														</div>
													</div>
													<!--end item-->
												</ItemTemplate>
											</asp:Repeater>
										</ContentTemplate>
									</asp:UpdatePanel>
									<%--<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="#" class="tag category">Home & Decor</a>
													<a href="single-listing-1.html" class="title">Furniture for sale</a>
													<span class="tag">Offer</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
													<img src="assets/img/image-01.jpg" alt="">
												</a>
											</div>
											<!--end image-->
											<h4 class="location">
												<a href="#">Manhattan, NY</a>
											</h4>
											<div class="price">$80</div>
											<div class="admin-controls">
												<a href="edit-ad.html">
													<i class="fa fa-pencil"></i>Edit
												</a>
												<a href="#" class="ad-hide">
													<i class="fa fa-eye-slash"></i>Hide
												</a>
												<a href="#" class="ad-remove">
													<i class="fa fa-trash"></i>Remove
												</a>
											</div>
											<!--end admin-controls-->
											<div class="description">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
											</div>
											<!--end description-->
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>
									<!--end item-->

									<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="#" class="tag category">Education</a>
													<a href="single-listing-1.html" class="title">Creative Course</a>
													<span class="tag">Offer</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
													<img src="assets/img/image-02.jpg" alt="">
												</a>
											</div>
											<!--end image-->
											<h4 class="location">
												<a href="#">Nashville, TN</a>
											</h4>
											<div class="price">$125</div>
											<div class="admin-controls">
												<a href="edit-ad.html">
													<i class="fa fa-pencil"></i>Edit
												</a>
												<a href="#" class="ad-hide">
													<i class="fa fa-eye-slash"></i>Hide
												</a>
												<a href="#" class="ad-remove">
													<i class="fa fa-trash"></i>Remove
												</a>
											</div>
											<!--end admin-controls-->
											<div class="description">
												<p>Proin at tortor eros. Phasellus porta nec elit non lacinia. Nam bibendum erat at leo faucibus vehicula. Ut laoreet porttitor risus, eget suscipit tellus tincidunt sit amet. </p>
											</div>
											<!--end description-->
											<div class="additional-info">
												<ul>
													<li>
														<figure>Start Date</figure>
														<aside>25.06.2017 09:00</aside>
													</li>
													<li>
														<figure>Length</figure>
														<aside>2 months</aside>
													</li>
													<li>
														<figure>Bedrooms</figure>
														<aside>3</aside>
													</li>
												</ul>
											</div>
											<!--end addition-info-->
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>
									<!--end item-->

									<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="#" class="tag category">Adventure</a>
													<a href="single-listing-1.html" class="title">Into The Wild</a>
													<span class="tag">Ad</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
													<img src="assets/img/image-03.jpg" alt="">
												</a>
											</div>
											<!--end image-->
											<h4 class="location">
												<a href="#">Seattle, WA</a>
											</h4>
											<div class="price">$1,560</div>
											<div class="admin-controls">
												<a href="edit-ad.html">
													<i class="fa fa-pencil"></i>Edit
												</a>
												<a href="#" class="ad-hide">
													<i class="fa fa-eye-slash"></i>Hide
												</a>
												<a href="#" class="ad-remove">
													<i class="fa fa-trash"></i>Remove
												</a>
											</div>
											<!--end admin-controls-->
											<div class="description">
												<p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
											</div>
											<!--end description-->
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>
									<!--end item-->

									<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="#" class="tag category">Real Estate</a>
													<a href="single-listing-1.html" class="title">Luxury Apartment</a>
													<span class="tag">Offer</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
													<img src="assets/img/image-04.jpg" alt="">
												</a>
											</div>
											<!--end image-->
											<h4 class="location">
												<a href="#">Greeley, CO</a>
											</h4>
											<div class="price">$75,000</div>
											<div class="admin-controls">
												<a href="edit-ad.html">
													<i class="fa fa-pencil"></i>Edit
												</a>
												<a href="#" class="ad-hide">
													<i class="fa fa-eye-slash"></i>Hide
												</a>
												<a href="#" class="remove">
													<i class="fa fa-trash"></i>Remove
												</a>
											</div>
											<!--end admin-controls-->
											<div class="description">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
											</div>
											<!--end description-->
											<div class="additional-info">
												<ul>
													<li>
														<figure>Area</figure>
														<aside>368m<sup>2</sup></aside>
													</li>
													<li>
														<figure>Bathrooms</figure>
														<aside>2</aside>
													</li>
													<li>
														<figure>Bedrooms</figure>
														<aside>3</aside>
													</li>
													<li>
														<figure>Garage</figure>
														<aside>1</aside>
													</li>
												</ul>
											</div>
											<!--end addition-info-->
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>--%>
									<!--end item-->

								</div>
								<!--end items-->
							</div>
							<!--end col-md-9-->
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
			<footer class="footer">
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
													<a href="/Home">Home</a>
												</li>
												<li>
													<a href="/browse">Browse Venue</a>
												</li>
												<%--<li>
													<a href="#">Halls</a>
												</li>--%>
												<%--<li>
												<a href="#">Extras</a>
											</li>--%>
												<li>
													<a href="/contact">Contact</a>
												</li>
												<li>
													<a href="/add_venue">Add your Venue</a>
												</li>
											</ul>
										</nav>
									</div>
									<div class="col-md-6 col-sm-6">
										<nav>
											<ul class="list-unstyled">
												<%--<li>
													<a href="#">My Ads</a>
												</li>--%>
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
									<strong>Email:</strong> <a href="mailto:info@placefinder.lk">info@placefinder.lk</a>
									<br>
									<strong>Phone: </strong>+94 76 61 35 962
							
									<br>
									<br>
									<a href="contact.html" class="btn btn-primary text-caps btn-framed">Contact Us</a>
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
			</footer>
			<!--end footer-->
		</div>
		<!--end page-->


		<!-- Modal HTML -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-confirm">
				<div class="modal-content">
					<div class="modal-header">
						<div class="icon-box">
							<i class="fa fa-check"></i>
						</div>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body text-center">
						<h4>Confirmation!</h4>
						<p>Do you realy want to delete this place</p>

						<button class="btn btn-success" runat="server" onserverclick="Unnamed_ServerClick"><span>YES</span> <i class="fa fa-check-circle"></i></button>
						<button class="btn btn-success" data-dismiss="modal"><span>NO</span> <i class="fa fa-times-circle"></i></button>
					</div>
				</div>
			</div>
		</div>



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

			function deleted() {
				swal(
					{
						title: 'Done!',
						text: 'Your venue has been deleted.',
						type: 'success',
						icon: "success",
						button: "OK",
						confirmButtonColor: '#4fa7f3'
					}).then(function () {
						window.location = "my_venue.aspx";
					});
			}

			function error() {
				swal(
					{
						title: 'Sorry!',
						text: 'Somthing went wrong! Please try again in few minutes.',
						type: 'error',
						icon: "error",
						button: "OK!",
						confirmButtonColor: '#4fa7f3'
					}).then(function () {
						window.location = "my_venue.aspx";
					});
			}

		</script>



		<script type="text/javascript">

			function openModal() {

				$('#myModal').modal();
			}
		</script>

	</form>
</body>
</html>
