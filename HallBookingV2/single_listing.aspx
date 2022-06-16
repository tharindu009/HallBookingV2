<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="single_listing.aspx.cs" Inherits="HallBookingV2.single_listing" %>

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
	<link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
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


	<title>Place Finder | Detail</title>

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
								<a class="navbar-brand" href="default.aspx">
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
							</nav>
							<!--end navbar-->
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/Home">Home</a></li>
								<li class="breadcrumb-item"><a href="my_venue.aspx">My Venue</a></li>
								<li class="breadcrumb-item active">Detail</li>
							</ol>
							<!--end breadcrumb-->
						</div>
						<!--end container-->
					</div>
					<!--============ End Main Navigation ================================================================-->
					<!--============ Page Title =========================================================================-->
					<div class="page-title">
						<div class="container clearfix">
							<div class="float-left float-xs-none">
								<h1><%=VenueName %>
									<span class="tag">New</span>
								</h1>
								<h4 class="location">
									<a href="#"><%=Location %></a>
								</h4>
							</div>
							<div class="float-right float-xs-none price">
								<div class="number"><%=Price %></div>
								<div class="id opacity-50">
									<strong>Upwords</strong>
								</div>
							</div>
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
						<div class="row">
							<!--============ Listing Detail =============================================================-->
							<div class="col-md-9">
								<!--Gallery Carousel-->
								<section>
									<h2 style="margin-bottom:2%">Gallery</h2>
									<!--end section-title-->
									<div class="gallery-carousel owl-carousel">
										<asp:Repeater ID="Repeater2" runat="server">
											<ItemTemplate>
												<img src="<%#Eval("Image") %>" alt="" data-hash="<%#Eval("ID") %>" style="height:450px">
											</ItemTemplate>
										</asp:Repeater>
									   <%-- <img src="assets/img/image-01.jpg" alt="" data-hash="2">
										<img src="assets/img/image-21.jpg" alt="" data-hash="3">
										<img src="assets/img/image-22.jpg" alt="" data-hash="4">
										<img src="assets/img/image-23.jpg" alt="" data-hash="5">
										<img src="assets/img/image-14.jpg" alt="" data-hash="6">--%>
									</div>
									<div class="gallery-carousel-thumbs owl-carousel">
										<%--<a href="#1" class="owl-thumb active-thumb background-image">
											<img src="assets/img/image-20.jpg" alt="">
										</a>
										<a href="#2" class="owl-thumb background-image">
											<img src="assets/img/image-01.jpg" alt="">
										</a>
										<a href="#3" class="owl-thumb background-image">
											<img src="assets/img/image-21.jpg" alt="">
										</a>
										<a href="#4" class="owl-thumb background-image">
											<img src="assets/img/image-22.jpg" alt="">
										</a>
										<a href="#5" class="owl-thumb background-image">
											<img src="assets/img/image-23.jpg" alt="">
										</a>
										<a href="#6" class="owl-thumb background-image">
											<img src="assets/img/image-14.jpg" alt="">
										</a>--%>
									</div>
								</section>
								<!--end Gallery Carousel-->
								<!--Description-->
								<section>
									<h2 style="margin-bottom: 2%">Description</h2>
									<p>
										<%=Description %>
									</p>
								</section>
								<!--end Description-->
								<!--Details & Location-->
								<section>
									<div class="row">
										<div class="col-md-4">
											<h2 style="margin-bottom: 2%">Details</h2>
											<dl>
												<dt>Standing:</dt>
												<dd style="color: firebrick"><%=Standing %></dd>
												<dt>Seated:</dt>
												<dd style="color: firebrick"><%=Seated %></dd>
												<hr />
												<dt><a href="<%=venueWebsite %>"><i class="fa fa-internet-explorer" style="font-size: 24px; margin-right: 10px"></i></a></dt>
												<%--<dd>Yes</dd>--%>
												<dt><a href="<%=venueFacebook %>"><i class="fa fa-facebook-square" style="font-size: 24px; margin-right: 10px"></i></a></dt>
												<%--<dd>Yes</dd>--%>
												<%--<dt><i class="fa fa-twitter" style="font-size: 24px"></i></dt>--%>
												<%--<dd>Yes</dd>--%>
												<%--<dt>Material</dt>
												<dd>Wood, Leather</dd>
												<dt>Color</dt>
												<dd>White, Grey</dd>
												<dt>Height</dt>
												<dd>47cm</dd>
												<dt>Width</dt>
												<dd>203cm</dd>
												<dt>Length</dt>
												<dd>54cm</dd>--%>
											</dl>
										</div>
										<div class="col-md-8">
											<h2 style="margin-bottom: 2%">Location</h2>

											<!--<div class="map height-100px" id="map-small"></div>-->
                                                <asp:Label ID="Label1" class="col-form-label" runat="server" Text="Label"></asp:Label><br />
                                                <asp:Label ID="Label2" class="col-form-label" runat="server" Text="Label"></asp:Label><br />
                                                <asp:Label ID="Label3" class="col-form-label" runat="server" Text="Label"></asp:Label>
											
										</div>
									</div>
								</section>
								<!--end Details and Locations-->

								<!--Features-->
								<section>
									<h2 style="margin-bottom: 2%">Event Types</h2>
									<ul class="features-checkboxes columns-3">
										<asp:Repeater ID="Repeater1" runat="server">
											<ItemTemplate>
												<li><%# Eval("event_type") %></li>
											</ItemTemplate>
										</asp:Repeater>
										<%--<li>Catering via venue</li>
										<li>Own food allowed</li>
										<li>Alcohol license</li>
										<li>Own beverages allowed</li>
										<li>Dinnerware</li>--%>
									</ul>
								</section>
								<!--end Features-->
								<!--Feature-->
								<section>
									<h2 style="margin-bottom: 2%">Capacity</h2>
									<div class="row">
										<div class="col-md-2">
											<figure class="category-icon">
												<span>
													<img src="image/Classroom_32px.png" alt="" />
													Seminar</span>

											</figure>
											<asp:Label ID="lblSeminar" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
										</div>
										<div class="col-md-2">
											<figure class="category-icon">
												<span>
													<img src="image/Organization_32px.png" alt="" />
													Theater</span>

											</figure>
											<asp:Label ID="lblTheater" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
										</div>
										<div class="col-md-2">
											<figure class="category-icon">
												<span>
													<img src="image/Banquet.png" alt="" />
													Banquet</span>

											</figure>
											<asp:Label ID="lblBanquet" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
										</div>
										<div class="col-md-3">
											<figure class="category-icon">
												<span>
													<img src="image/Conference_32px.png" alt="" />
													Conference</span>

											</figure>
											<asp:Label ID="lblConference" runat="server" Style="color: firebrick" Text="-"></asp:Label>
										</div>
										<div class="col-md-3">
											<label for="name" class="col-form-label">Floor Area (<span>m<sup>2</sup></span>)</label>
											<br />
											<asp:Label ID="lblArea" runat="server" Style="color: firebrick" Text=""></asp:Label>
										</div>
									</div>
								</section>
								<!--end feature-->
								<!--Pricing -->
								<section>
									<h2 style="margin-bottom: 2%">Price from</h2>
									<div class="row">
										<div class="col-md-3">
											<asp:Label ID="lblPricePer" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
											<p><strong>Price / Person</strong></p>
										</div>
										<div class="col-md-3">
											<asp:Label ID="lblPricePla" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
											<p><strong>Price / Plate</strong></p>
										</div>
										<div class="col-md-3">
											<asp:Label ID="lblRentHour" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
											<p><strong>Rent / Hour</strong></p>
										</div>
										<div class="col-md-3">
											<asp:Label ID="lblRentDay" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
											<p><strong>Rent / Day</strong></p>
										</div>
										<div class="col-md-12">
											<p><strong>Additional info</strong></p>
											<asp:Label ID="lblAddinfo" class="col-form-label" runat="server" Text="-"></asp:Label>
										</div>
									</div>
								</section>
								<!--Author-->
								<!--Policy-->
								<section>
									<h2 style="margin-bottom: 2%">Deposit Info</h2>
									<div class="row">
										<div class="col-md-3">
											<p><strong>Deposit</strong></p>
											<asp:Label ID="lblDeposit" class="col-form-label" Style="color: firebrick" runat="server" Text="-"></asp:Label>
										</div>
										<div class="col-md-12">
											<p><strong>Cancelation Policy</strong></p>
											<asp:Label ID="lblPolicy" class="col-form-label" runat="server" Text=""></asp:Label>
										</div>
									</div>
								</section>
								<section>
									<h2>Contact</h2>
									<div class="box">
										<div class="row">
											<div class="col-md-5">
												<div class="author">
													<div class="author-image">
														<div class="background-image">
															<img src="assets/img/author-01.jpg" alt="">
														</div>
													</div>
													<!--end author-image-->
													<div class="author-description">
														<h3><%=ContactPerson %></h3>
														<div class="rating" data-rating="5"></div>
														<%--<a href="seller-detail-1.html" class="text-uppercase">Show My Listings
														<span class="appendix">(12)</span>
														</a>--%>
													</div>
													<!--end author-description-->
												</div>
												<hr>
												<dl>
													<dt><i class="fa fa-building"></i></dt>
													<dd><%=CompanyName %></dd>
													<br />
													<dt><i class="fa fa-phone"></i></dt>
													<dd><%=ContactPhone %></dd>
													<br />
													<dt><i class="fa fa-envelope"></i></dt>
													<dd><%=contactEmail %></dd>

												</dl>
												<!--end author-->
											</div>
											<!--end col-md-5-->
											<div class="col-md-7">
												<div class="form email">
													<div class="form-group">
														<label for="name" class="col-form-label">Name</label>
														<asp:TextBox ID="txtName" class="form-control small" runat="server" placeholder="Your Name"></asp:TextBox>
														<%--<input name="name" type="text" class="form-control" id="name" placeholder="Your Name">--%>
													</div>
													<!--end form-group-->
													<div class="form-group">
														<label for="email" class="col-form-label">Email</label>
														<asp:TextBox ID="txtEmail" class="form-control small" runat="server" placeholder="Your Email"></asp:TextBox>
														<%--<input name="email" type="email" class="form-control" id="email" placeholder="Your Email">--%>
													</div>
													<!--end form-group-->
													<div class="form-group">
														<label for="message" class="col-form-label">Message</label>
														<asp:TextBox ID="TextBox7" Rows="3" TextMode="MultiLine" class="form-control small" runat="server" placeholder="Hi there! I am interested in your venue. Please give me more details."></asp:TextBox>
														<%--<textarea name="message" id="message" class="form-control" rows="4" placeholder="Hi there! I am interested in your offer venue. Please give me more details."></textarea>--%>
													</div>
													<!--end form-group-->
													<button type="submit" class="btn btn-primary small">Send</button>
												</div>
											</div>
											<!--end col-md-7-->
										</div>
										<!--end row-->
									</div>
									<!--end box-->
								</section>
								<!--End Author-->
							</div>
							<!--============ End Listing Detail =========================================================-->
							<!--============ Sidebar ====================================================================-->
							<div class="col-md-3">
								<aside class="sidebar">
									<section>

										<h3>Bookings and inquiries</h3>
										<div class="items compact">
											<div class="item">
												<div class="wrapper">
													<asp:UpdatePanel ID="UpdatePanel2" runat="server">
														<ContentTemplate>
															<asp:Calendar ID="Calendar1" runat="server" CssClass="myCalendarDay" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
															<br />
															<asp:TextBox ID="TextBox1" Style="width: 90%; margin-left: 10px" runat="server" CssClass="form-control small" Enabled="false" placeholder="Date"></asp:TextBox>
															<br />
														</ContentTemplate>
													</asp:UpdatePanel>
													<asp:CheckBox ID="CheckBox1" runat="server" Style="margin-left: 20%" Text="Date Flexible" />
													<!--end wrapper-->
												</div>
												<!--end item-->
											</div>
											<div class="item">
												<div class="ribbon-featured">Send your Inquiry</div>
												<div class="wrapper">

													<asp:UpdatePanel ID="UpdatePanel1" runat="server">
														<ContentTemplate>
															<asp:TextBox ID="TextBox2" Rows="10" CssClass="form-control small" TextMode="MultiLine" runat="server"></asp:TextBox>

															<div class="meta">
																<figure>
																	<i class="fa fa-user"></i>More details about your event
																	<br />
																	gives you better answers and
																	<br />
																	offers.
																</figure>
															</div>
														</ContentTemplate>
													</asp:UpdatePanel>
													<br />
												</div>

												<%--<div class="wrapper">
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
													<div class="meta">
														<figure>
															<i class="fa fa-calendar-o"></i>28.04.2017
														</figure>
														<figure>
															<a href="#">
																<i class="fa fa-user"></i>Peter Browner
															</a>
														</figure>
													</div>
													<!--end meta-->
												</div>--%>
												<!--end wrapper-->
											</div>
											<!--end item-->

											<div class="item">
												<div class="wrapper">
													<asp:TextBox ID="TextBox3" CssClass="form-control small" Style="width: 90%; margin-left: 10px; margin-top: 10px" placeholder="Your name" runat="server"></asp:TextBox>
													<br />
													<asp:TextBox ID="TextBox4" CssClass="form-control small" Style="width: 90%; margin-left: 10px" placeholder="Company (Optional)" runat="server"></asp:TextBox>
													<br />
													<asp:TextBox ID="TextBox5" CssClass="form-control small" Style="width: 90%; margin-left: 10px" placeholder="Email" runat="server"></asp:TextBox>
													<br />
													<asp:TextBox ID="TextBox6" CssClass="form-control small" Style="width: 90%; margin-left: 10px" placeholder="Phone Number" runat="server"></asp:TextBox>
													<br />
													<asp:Button ID="btnInq" CssClass="btn btn-warning small" Style="margin-left: 10px; margin-bottom: 10px; width: 90%" runat="server" Text="Send Inquiry" />
													<!--end meta-->
												</div>
											</div>
											<!--end item-->
										</div>

									</section>
									<hr />
									<section>
										<h2 style="margin-bottom: 2%">Search Venue</h2>
										<!--============ Side Bar Search Form ===========================================-->
										<div class="sidebar-form form box">
											<div class="form-group">
												<label for="what" class="col-form-label">Type of Event?</label>
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
												<%--<input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">--%>
												<%--<span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>--%>
											</div>
											<!--end form-group-->
											<div class="form-group">
												<label for="input-location" class="col-form-label">Where?</label>
												<asp:TextBox ID="txtLocation" class="form-control small" runat="server" placeholder="Enter Location"></asp:TextBox>
											</div>
											<!--end form-group-->
											<button type="submit" class="btn btn-primary width-100 small">Search</button>

											<!--Alternative Form-->
											<%--<div class="alternative-search-form">
											<a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
											<div class="collapse" id="collapseAlternativeSearchForm">
												<div class="wrapper">
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
													<div class="form-group">
														<input name="min_price" type="text" class="form-control small" id="min-price" placeholder="Minimal Price">
														<span class="input-group-addon small">$</span>
													</div>
													<!--end form-group-->
													<div class="form-group">
														<input name="max_price" type="text" class="form-control small" id="max-price" placeholder="Maximal Price">
														<span class="input-group-addon small">$</span>
													</div>
													<!--end form-group-->
													<div class="form-group">
														<select name="distance" id="distance" class="small" data-placeholder="Distance" >
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
												<!--end wrapper-->
											</div>
											<!--end collapse-->
										</div>--%>
											<!--end alternative-search-form-->
										</div>
										<!--============ End Side Bar Search Form =======================================-->
									</section>
								</aside>
							</div>
							<!--============ End Sidebar ================================================================-->
						</div>
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
											<%--<li>
													<a href="#">Halls</a>
												</li>--%>
											<%--<li>
												<a href="#">Extras</a>
											</li>--%>
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
				<div class="background">
					<div class="background-image original-size">
						<img src="assets/img/footer-background-icons.jpg" alt="">
					</div>
					<!--end background-image-->
				</div>
				<!--end background-->
			</section>
			<!--end footer-->
		</div>
		<!--end page-->

		<script src="assets/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="assets/js/popper.min.js"></script>
		<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBEDfNcQRmKQEyulDN8nGWjLYPm8s4YB58&libraries=places"></script>
		<script src="assets/js/selectize.min.js"></script>
		<script src="assets/js/icheck.min.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/custom.js"></script>

		<script>
			var latitude = 51.511971;
			var longitude = -0.137597;
			var markerImage = "assets/img/map-marker.png";
			var mapTheme = "light";
			var mapElement = "map-small";
			simpleMap(latitude, longitude, markerImage, mapTheme, mapElement);
		</script>
	</form>
</body>
</html>

