<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HallBookingV2._default" %>

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
	<meta name="description" content="Search and book places for all occasions. Here you will find places for parties, weddings, conferences and other types of events. Add your place to the Sri Lanka's most popular marketplace for meeting and event spaces.">
	<meta name="keywords" content="hall rentals near me,meeting room,event space,party places near me,event centers near me,wedding hall,function hall,birthday party venues near me,conference venues, Sri lanka venue, wedding halls in sri lanka" />

	<!--google -->
	<meta name="google-site-verification" content="_A4SbaYPqO9MxUlAlg1X2aAroaoWbWLA2HZM-yeq92A" />
	<!-- google end -->

	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Varela+Round" rel="stylesheet">
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="assets/fonts/font-awesome.css" type="text/css">
	<link rel="stylesheet" href="assets/css/selectize.css" type="text/css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/user.css">
	<link rel="stylesheet" href="assets/css/stickyMain.css">


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-127812484-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() { dataLayer.push(arguments); }
		gtag('js', new Date());

		gtag('config', 'UA-127812484-1');
	</script>


	<title>Place Finder | Search and book places for all occasions</title>

</head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NMRNSQF"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<form runat="server">
		<div class="page home-page">
			<!--*********************************************************************************************************-->
			<!--************ HERO ***************************************************************************************-->
			<!--*********************************************************************************************************-->
			<header class="hero has-dark-background">
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

					<div class="main-navigation staticnavibar">
						<div class="container">
							<nav class="navbar navbar-expand-lg navbar-light justify-content-between top-navbar" data-toggle="sticky-onscroll">

								<a class="navbar-brand" href="/Home">
									<img src="assets/img/logo-inverted1.png" alt="placefinder main image" id="logoimg">
								</a>
								<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
									<span class="navbar-toggler-icon text-white"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbar">
									<!--Main navigation list-->
									<ul class="navbar-nav" id="menuui">
										<li class="nav-item active">
											<a class="nav-link" href="/Home">Home</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/browse">Browse Venue</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/contact">Contact</a>
										</li>
										<li class="nav-item">
											<a href="add_venue1.aspx" class="btn btn-primary text-caps btn-rounded btn-framed">Add your Venue</a>
										</li>
									</ul>
									<!--Main navigation list-->
								</div>
								<!--end navbar-collapse-->

							</nav>

							<!--end navbar-->
						</div>
						<!--end container-->
					</div>
					<!--============ End Main Navigation ================================================================-->
					<!--============ Page Title =========================================================================-->
					<div class="page-title">
						<div class="container">
							<h1 class="center">Book a venue for your event</h1>
						</div>
						<!--end container-->
					</div>
					<!--============ End Page Title =====================================================================-->
					<!--============ Hero Form ==========================================================================-->
					<div class="hero-form form">
						<div class="container" style="margin-top: -30px">
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
												<asp:ListItem Value="2">10-50</asp:ListItem>
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
										<asp:Button ID="Button1" CssClass="btn btn-primary width-100 small" runat="server" Text="Search" OnClick="Button1_Click" />
										<%--<button type="submit" class="btn btn-primary width-100 small">Search</button>--%>
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
													Alcohol License
										
												</label>
												<label>
													<input type="checkbox" name="used">
													Wi Fi
										
												</label>
												<label>
													<input type="checkbox" name="with_photo">
													Catering
										
												</label>
												<label>
													<input type="checkbox" name="featured">
													Accessible
										
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
					<!--============ End Hero Form ======================================================================-->
					<div class="background">
						<div class="background-image">
							<img src="image/banner_image2.jpg" />
							<%--<img src="assets/img/hero-background-image-01.jpg" alt="">--%>
						</div>
						<!--end background-image-->
					</div>
					<!--end background-->
				</div>
				<!--end hero-wrapper-->
			</header>
			<!--end hero-->

			<!--*********************************************************************************************************-->
			<!--************ CONTENT ************************************************************************************-->
			<!--*********************************************************************************************************-->
			<section class="content">
				<!--============ Featured Ads ===========================================================================-->
				<section class="block">
					<div class="container">
						<h2>Featured Venues</h2>
						<div class="items grid grid-xl-3-items grid-lg-3-items grid-md-2-items">
							<asp:Repeater ID="rptFeature" runat="server">
								<ItemTemplate>
									<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="tag category"><%# Eval("VenueID") %></a>
													<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="title"><%# Eval("VenueName") %></a>
													<span class="tag">Featured</span>
												</h3>
												<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="image-wrapper background-image">
													<img src="<%# Eval("VenueImage") %>" alt="">
												</a>
											</div>
											<!--end image-->
											<h4 class="location">
												<a href="#"><i class="fa fa-location"></i><%#Eval("City") %></a>
											</h4>
											<div class="price">LKR <%#Eval("Price") %></div>
											<div class="meta">
												<figure>
													<i class="fa fa-phone"></i><%#Eval("Phone") %>
												</figure>
												<figure>
													<a href="#">
														<i class="fa fa-user"></i><%#Eval("Person") %>
													</a>
												</figure>
											</div>
											<!--end meta-->
											<div class="description">
												<p><%#Eval("Description") %></p>
											</div>
											<!--end description-->
											<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="detail text-caps underline">Detail</a>
										</div>
									</div>
								</ItemTemplate>
							</asp:Repeater>
							<!--end item-->


							<!--end item-->


							<!--end item-->

						</div>
					</div>
				</section>
				<!--============ End Featured Ads =======================================================================-->
				<!--============ Features Steps =========================================================================-->
				<section class="block" style="padding-top: 2px; padding-bottom: 2px">

					<div class="container">
						<div class="block">
							<div class="row">
								<div class="col-md-3 box">
									<div class="feature-box" style="text-align: center">
										<img src="image/party.jpg" style="width: 95%; height: 176px; margin-bottom: 10px" alt="" />

										<h3>Party</h3>
										<p>Birthday, anniversary or any other reason to throw a party? We helps you to find the best place for an unforgettable bash!</p>
									</div>
									<!--end feature-box-->
								</div>
								<!--end col-->
								<div class="col-md-3 box">
									<div class="feature-box" style="text-align: center">
										<img src="image/wedding.jpg" style="width: 95%; height: 176px; margin-bottom: 10px" />

										<h3>Wedding</h3>
										<p style="text-align: center">Your dream wedding needs the perfect venue - whether it is in a mansion, a banquet hall or an old factory!</p>
									</div>
									<!--end feature-box-->
								</div>
								<!--end col-->
								<div class="col-md-3 box">
									<div class="feature-box" style="text-align: center">
										<img src="image/meeting.jpg" style="width: 95%; height: 176px; margin-bottom: 10px" />

										<h3>Meeting</h3>
										<p style="text-align: center">Meeting or a workshop in a cafe, or a seminar in a theater? Find a functional space to boost your creativity!</p>
									</div>
									<!--end feature-box-->
								</div>
								<!--end col-->
								<div class="col-md-3 box">
									<div class="feature-box" style="text-align: center">
										<img src="image/spa.jpg" style="width: 95%; height: 176px; margin-bottom: 10px" />

										<h3>Sauna & Spa</h3>
										<p style="text-align: center">Sauna evening or a bridal party in sight? Find the perfect place for you: perhaps one that allows you to bring your own beverages?</p>
									</div>
									<!--end feature-box-->
								</div>
								<!--end col-->
							</div>
							<!--end row-->
						</div>
						<!--end block-->
					</div>
					<!--end container-->
					<div class="background" data-background-color="#fff"></div>
					<!--end background-->
				</section>
				<!--end block-->
				<!--============ End Features Steps =====================================================================-->
				<!--============ Recent Ads =============================================================================-->
				<section class="block">
					<div class="container">
						<h2>Recent Venues</h2>
						<div class="items grid grid-xl-4-items grid-lg-3-items grid-md-2-items">
							<asp:Repeater ID="rptResent" runat="server">
								<ItemTemplate>
									<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="tag category"><%# Eval("VenueID") %></a>
													<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="title"><%# Eval("VenueName") %></a>
													<span class="tag">Recent</span>
												</h3>
												<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="image-wrapper background-image">
													<img src="<%# Eval("VenueImage") %>" alt="venue image">
												</a>
											</div>
											<!--end image-->
											<h4 class="location">
												<a href="#"><i class="fa fa-location"></i><%#Eval("City") %></a>
											</h4>
											<div class="price">LKR <%#Eval("Price") %></div>
											<div class="meta">
												<figure>
													<i class="fa fa-phone -o"></i><%#Eval("Phone") %>
												</figure>
												<figure>
													<a href="#">
														<i class="fa fa-user"></i><%#Eval("Person") %>
													</a>
												</figure>
											</div>
											<!--end meta-->
											<div class="description">
												<p><%#Eval("Description") %></p>
											</div>
											<!--end description-->

											<!--end addition-info-->
											<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="detail text-caps underline">Detail</a>
										</div>
									</div>
								</ItemTemplate>
							</asp:Repeater>
							<!--end item-->

							<%--<div class="item">
								<div class="wrapper">
									<div class="image">
										<h3>
											<a href="#" class="tag category">Architecture</a>
											<a href="single_listing.aspx" class="title">We'll Redesign Your Apartment</a>
											<span class="tag">Offer</span>
										</h3>
										<a href="single_listing.aspx" class="image-wrapper background-image">
											<img src="assets/img/image-05.jpg" alt="">
										</a>
									</div>
									<!--end image-->
									<h4 class="location">
										<a href="#">Greeley, CO</a>
									</h4>
									<div class="price">
										<span class="appendix">From</span>
										$200
							
									</div>
									<div class="meta">
										<figure>
											<i class="fa fa-calendar-o"></i>13.03.2017
										</figure>
										<figure>
											<a href="#">
												<i class="fa fa-user"></i>XL Designers
											</a>
										</figure>
									</div>
									<!--end meta-->
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
										</ul>
									</div>
									<!--end addition-info-->
									<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
								</div>
							</div>--%>
							<!--end item-->

							<%--<div class="item">
								<div class="ribbon-featured">Featured</div>
								<!--end ribbon-->
								<div class="wrapper">
									<div class="image">
										<h3>
											<a href="#" class="tag category">Jobs</a>
											<a href="single_listing.aspx" class="title">Seeking for a Job</a>
											<span class="tag">Demand</span>
										</h3>
										<a href="single_listing.aspx" class="image-wrapper background-image">
											<img src="assets/img/image-06.jpg" alt="">
										</a>
									</div>
									<!--end image-->
									<h4 class="location">
										<a href="#">Delavan, IL</a>
									</h4>
									<div class="price">$1,200</div>
									<div class="meta">
										<figure>
											<i class="fa fa-calendar-o"></i>10.03.2017
								
										</figure>
										<figure>
											<a href="#">
												<i class="fa fa-user"></i>Aurelio Thomas
											</a>
										</figure>
									</div>
									<!--end meta-->
									<div class="description">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam venenatis lobortis</p>
									</div>
									<!--end description-->
									<div class="additional-info">
										<ul>
											<li>
												<figure>Degree</figure>
												<aside>Bachelor’s</aside>
											</li>
											<li>
												<figure>Category</figure>
												<aside>Art & Design</aside>
											</li>
											<li>
												<figure>Experience</figure>
												<aside>5 years</aside>
											</li>
											<li>
												<figure>Language</figure>
												<aside>English, German</aside>
											</li>
										</ul>
									</div>
									<!--end addition-info-->
									<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
								</div>
							</div>--%>
							<!--end item-->

							<%--<div class="item">
								<div class="wrapper">
									<div class="image">
										<h3>
											<a href="#" class="tag category">Pets & Animals</a>
											<a href="single_listing.aspx" class="title">Baby Cats</a>
											<span class="tag">Offer</span>
										</h3>
										<a href="single_listing.aspx" class="image-wrapper background-image">
											<img src="assets/img/image-07.jpg" alt="">
										</a>
									</div>
									<!--end image-->
									<h4 class="location">
										<a href="#">Detroit, MI</a>
									</h4>
									<div class="price">
										<span class="appendix">From</span>
										$80
							
									</div>
									<div class="meta">
										<figure>
											<i class="fa fa-calendar-o"></i>23.02.2017
								
										</figure>
										<figure>
											<a href="#">
												<i class="fa fa-user"></i>Detroit Pet Center
											</a>
										</figure>
									</div>
									<!--end meta-->
									<div class="description">
										<p>
											Pellentesque ullamcorper justo quis bibendum
										consequat. Integer id euismod lacus, facilisis faucibus urna.
								
										</p>
									</div>
									<!--end description-->
									<div class="additional-info">
										<ul>
											<li>
												<figure>Age</figure>
												<aside>2 weeks</aside>
											</li>
										</ul>
									</div>
									<!--end addition-info-->
									<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
								</div>
							</div>--%>
							<!--end item-->

							<%--<div class="item">
							<div class="wrapper">
								<div class="image">
									<h3>
										<a href="#" class="tag category">Mobiles</a>
										<a href="single_listing.aspx" class="title">Used Smartphone</a>
										<span class="tag">Offer</span>
									</h3>
									<a href="single_listing.aspx" class="image-wrapper background-image">
										<img src="assets/img/image-08.jpg" alt="">
									</a>
								</div>
								<!--end image-->
								<h4 class="location">
									<a href="#">West Roxbury, MA</a>
								</h4>
								<div class="price">$300</div>
								<div class="meta">
									<figure>
										<i class="fa fa-calendar-o"></i>28.02.2017
								
									</figure>
									<figure>
										<a href="#">
											<i class="fa fa-user"></i>Gloria A. Crawford
										</a>
									</figure>
								</div>
								<!--end meta-->
								<div class="description">
									<p>
										Vestibulum congue at justo semper dignissim. Pellentesque ullamcorper justo quis bibendum
										consequat. Integer id euismod lacus, facilisis faucibus urna.
								
									</p>
								</div>
								<!--end description-->
								<div class="additional-info">
									<ul>
										<li>
											<figure>Status</figure>
											<aside>Used</aside>
										</li>
										<li>
											<figure>Brand</figure>
											<aside>Samsung</aside>
										</li>
									</ul>
								</div>
								<!--end addition-info-->
								<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
							</div>
						</div>--%>
							<!--end item-->

							<%--<div class="item">
							<div class="wrapper">
								<div class="image">
									<h3>
										<a href="#" class="tag category">Cars</a>
										<a href="single_listing.aspx" class="title">Offroad Car</a>
										<span class="tag">Offer</span>
									</h3>
									<a href="single_listing.aspx" class="image-wrapper background-image">
										<img src="assets/img/image-09.jpg" alt="">
									</a>
								</div>
								<!--end image-->
								<h4 class="location">
									<a href="#">Nehalem, OR</a>
								</h4>
								<div class="price">$30,000</div>
								<div class="meta">
									<figure>
										<i class="fa fa-calendar-o"></i>14.01.2017
								
									</figure>
									<figure>
										<a href="#">
											<i class="fa fa-user"></i>Leonardo
										</a>
									</figure>
								</div>
								<!--end meta-->
								<div class="description">
									<p>
										Nam eget imperdiet massa. Cras dolor nulla, tristique eu nisl ut, venenatis volutpat massa.
										Integer imperdiet finibus ipsum vitae scelerisque.
								
									</p>
								</div>
								<!--end description-->
								<div class="additional-info">
									<ul>
										<li>
											<figure>Brand</figure>
											<aside>Jeep</aside>
										</li>
										<li>
											<figure>Engine</figure>
											<aside>Diesel</aside>
										</li>
										<li>
											<figure>Mileage</figure>
											<aside>28,630</aside>
										</li>
									</ul>
								</div>
								<!--end addition-info-->
								<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
							</div>
						</div>--%>
							<!--end item-->

							<%--<div class="item">
							<div class="wrapper">
								<div class="image">
									<h3>
										<a href="#" class="tag category">Clothing</a>
										<a href="single_listing.aspx" class="title">High Boots</a>
										<span class="tag">Offer</span>
									</h3>
									<a href="single_listing.aspx" class="image-wrapper background-image">
										<img src="assets/img/image-10.jpg" alt="">
									</a>
								</div>
								<!--end image-->
								<h4 class="location">
									<a href="#">Raleigh, NC</a>
								</h4>
								<div class="price">$67</div>
								<div class="meta">
									<figure>
										<i class="fa fa-calendar-o"></i>05.01.2017
								
									</figure>
									<figure>
										<a href="#">
											<i class="fa fa-user"></i>Bobby
										</a>
									</figure>
								</div>
								<!--end meta-->
								<div class="description">
									<p>
										Nam pulvinar mollis tortor, eu lobortis mauris luctus non. Integer lobortis sapien enim,
										ut imperdiet leo faucibus id. Fusce tincidunt nunc elit, at varius erat rutrum vitae.
								
									</p>
								</div>
								<!--end description-->
								<div class="additional-info">
									<ul>
										<li>
											<figure>Status</figure>
											<aside>Used</aside>
										</li>
										<li>
											<figure>Material</figure>
											<aside>Genuine Leather</aside>
										</li>
										<li>
											<figure>Size</figure>
											<aside>10</aside>
										</li>
									</ul>
								</div>
								<!--end addition-info-->
								<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
							</div>
						</div>--%>
							<!--end item-->

							<%--<div class="item">
							<div class="wrapper">
								<div class="image">
									<h3>
										<a href="#" class="tag category">Books & Magazines</a>
										<a href="single_listing.aspx" class="title">Will Buy "Behind the Sea" Book</a>
										<span class="tag">Demand</span>
									</h3>
									<a href="single_listing.aspx" class="image-wrapper background-image">
										<img src="assets/img/image-11.jpg" alt="">
									</a>
								</div>
								<!--end image-->
								<h4 class="location">
									<a href="#">Long Beach, CA</a>
								</h4>
								<div class="price">$30</div>
								<div class="meta">
									<figure>
										<i class="fa fa-calendar-o"></i>02.01.2017
								
									</figure>
									<figure>
										<a href="#">
											<i class="fa fa-user"></i>Patty McAlexander
										</a>
									</figure>
								</div>
								<!--end meta-->
								<div class="description">
									<p>
										Mauris nisi ligula, pulvinar eu commodo eu, semper id quam. In vitae purus bibendum,
										mattis ex nec, eleifend diam. Cras at vehicula metus. Sed elementum lectus ut aliquet vehicula.
								
									</p>
								</div>
								<!--end description-->
								<a href="single_listing.aspx" class="detail text-caps underline">Detail</a>
							</div>
						</div>--%>
							<!--end item-->
						</div>
					</div>
					<!--end container-->
				</section>
				<!--end block-->
				<!--============ End Recent Ads =========================================================================-->
				<!--============ Newsletter =============================================================================-->
				<section class="block">
					<div class="container">
						<div class="row">
							<div class="col-md-6" style="text-align: center">
								<h2>Looking for a venue?</h2>
								<h3>Find a place fast & easy</h3>
								<p>
									Whether you're organizing a corporate event or a private party, 
								we has a wide selection of amazing event spaces with pictures and all the information you need. 
								Use the search function to find the perfect place for you. In addition to regular settings, 
								we have many unconventional venues to make your day truly unique!
								</p>
								<asp:Button ID="btnBrowse" CssClass="btn btn-primary width-30 small" runat="server" Text="Browse Venue" OnClick="btnBrowse_Click" />
								<%--<input id="btnBrowse" Class="btn btn-primary width-30"  type="button" value="Browse Venue" />--%>
							</div>
							<div class="col-md-6" style="text-align: center">
								<h2>You own a venue?</h2>
								<h3>Get more bookings through us</h3>
								<p>
									95% of all event organizers use the Internet to find a venue - we can make sure they come to you! 
								Do you have a banquet hall, restaurant, coffee shop, or any other venue that could get more bookings? 
								Add your space on Hall Booking and we will help you find new customers with no monthly or annual fees.
								</p>
								<asp:Button ID="Button2" CssClass="btn btn-primary width-30 small" runat="server" Text="Add your Venue" OnClick="Button2_Click" />
								<%--<input id="btnAdd" type="button" Class="btn btn-primary width-30" value="Add your Venue" />--%>
							</div>
						</div>
						<%--<div class="box has-dark-background">
						<div class="row align-items-center justify-content-center d-flex">
							<div class="col-md-10 py-5">
								<h2>Get the Latest Ads in Your Inbox</h2>
								<form class="form email">
									<div class="form-row">
										<div class="col-md-4 col-sm-4">
											<div class="form-group">
												<label for="newsletter_category" class="col-form-label">Category?</label>
												<select name="newsletter_category" id="newsletter_category" data-placeholder="Select Category" >
													<option value="">Select Category</option>
													<option value="1">Computers</option>
													<option value="2">Real Estate</option>
													<option value="3">Cars & Motorcycles</option>
													<option value="4">Furniture</option>
													<option value="5">Pets & Animals</option>
												</select>
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-4-->
										<div class="col-md-7 col-sm-7">
											<div class="form-group">
												<label for="newsletter_email" class="col-form-label">Your Email</label>
												<input name="newsletter_email" type="email" class="form-control" id="newsletter_email" placeholder="Your Email">
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-9-->
										<div class="col-md-1 col-sm-1">
											<div class="form-group">
												<label class="invisible">.</label>
												<button type="submit" class="btn btn-primary width-100"><i class="fa fa-chevron-right"></i></button>
											</div>
											<!--end form-group-->
										</div>
										<!--end col-md-9-->
									</div>
								</form>
								<!--end form-->
							</div>
						</div>
						<div class="background">
							<div class="background-image">
								<img src="assets/img/hero-background-image-01.jpg" alt="">
							</div>
							<!--end background-image-->
						</div>
						<!--end background-->
					</div>--%>
						<!--end box-->
					</div>
					<!--end container-->
				</section>
				<!--end block-->

				<section class="block">
					<div class="container">
						<%--<div class="d-flex align-items-center justify-content-around">
							<a href="#">
								<img src="assets/img/partner-1.png" alt="">
							</a>
							<a href="#">
								<img src="assets/img/partner-2.png" alt="">
							</a>
							<a href="#">
								<img src="assets/img/partner-3.png" alt="">
							</a>
							<a href="#">
								<img src="assets/img/partner-4.png" alt="">
							</a>
							<a href="#">
								<img src="assets/img/partner-5.png" alt="">
							</a>
						</div>--%>
					</div>

				</section>

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
									<img src="assets/img/logo1.png" alt="place finder logo">
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
													<a href="listing_grid.aspx">Browse Venue</a>
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
													<a href="add_venue1.aspx">Add your Venue</a>
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
													<a href="register.aspx">Register</a>
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
					<!-- End row -->
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

		<script src="assets/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="assets/js/popper.min.js"></script>
		<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
		<!--<script type="text/javascript" src="http://maps.google.com/maps/api/js"></script>-->
		<script src="assets/js/selectize.min.js"></script>
		<script src="assets/js/masonry.pkgd.min.js"></script>
		<script src="assets/js/icheck.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/custom.js"></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
	</form>
</body>
</html>

