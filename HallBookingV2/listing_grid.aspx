<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listing_grid.aspx.cs" Inherits="HallBookingV2.listing_grid" %>

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

	<title>Place Finder | Venue</title>

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
					<div class="main-navigation">
						<div class="container">
							<nav class="navbar navbar-expand-lg navbar-light justify-content-between top-navbar" data-toggle="sticky-onscroll">
								<a class="navbar-brand" href="/Home">
									<img src="assets/img/logo1.png" alt="placefinder.lk logo" id="logoimg">
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
										<li class="nav-item active">
											<a class="nav-link" href="listing_grid.aspx">Browse Venue</a>
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
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="default.aspx">Home</a></li>
								<li class="breadcrumb-item"><a href="#">venue</a></li>
								<li class="breadcrumb-item active">Search</li>
							</ol>
							<!--end breadcrumb-->
						</div>
						<!--end container-->
					</div>
					<!--============ End Main Navigation ================================================================-->
					<!--============ Page Title =========================================================================-->
					<div class="page-title">
						<div class="container">
							<h1>Browse Venue</h1>
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
									<div class="float-right float-xs-none d-xs-none thumbnail-toggle">
										<a href="#" class="change-class active" data-change-from-class="list" data-change-to-class="grid" data-parent-class="items">
											<i class="fa fa-th"></i>
										</a>
										<a href="#" class="change-class" data-change-from-class="grid" data-change-to-class="list" data-parent-class="items">
											<i class="fa fa-th-list"></i>
										</a>
									</div>
								</div>
								<!--============ Items ==========================================================================-->
								<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
									<ContentTemplate>
										<div class="items grid compact grid-xl-3-items grid-lg-3-items grid-md-2-items">
											<asp:Repeater ID="rptResult" runat="server">
												<ItemTemplate>
													<div class="item">
														<div class="ribbon-featured">Featured</div>
														<!--end ribbon-->
														<div class="wrapper">
															<div class="image">
																<h3>
																	<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="tag category"><%# Eval("VenueID") %></a>
																	<a href="single_listing.aspx?vid=<%#Eval("VenueID") %>" class="title"><%# Eval("VenueName") %></a>
																	<span class="tag">Offer</span>
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
									</div>--%>
											<!--end item-->

											<%--<div class="item">
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
											<div class="meta">
												<figure>
													<i class="fa fa-calendar-o"></i>21.04.2017
										
												</figure>
												<figure>
													<a href="#">
														<i class="fa fa-user"></i>Peak Agency
													</a>
												</figure>
											</div>
											<!--end meta-->
											<div class="description">
												<p>Nam eget ullamcorper massa. Morbi fringilla lectus nec lorem tristique gravida</p>
											</div>
											<!--end description-->
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>--%>
											<!--end item-->

											<%--<div class="item">
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
											<div class="meta">
												<figure>
													<i class="fa fa-calendar-o"></i>13.03.2017
										
												</figure>
												<figure>
													<a href="#">
														<i class="fa fa-user"></i>Hills Estate
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

											<%--<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="#" class="tag category">Architecture</a>
													<a href="single-listing-1.html" class="title">We'll Redesign Your Apartment</a>
													<span class="tag">Offer</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
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
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
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
													<a href="single-listing-1.html" class="title">Seeking for a Job</a>
													<span class="tag">Demand</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
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
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>--%>
											<!--end item-->

											<%--<div class="item">
										<div class="wrapper">
											<div class="image">
												<h3>
													<a href="#" class="tag category">Pets & Animals</a>
													<a href="single-listing-1.html" class="title">Baby Cats</a>
													<span class="tag">Offer</span>
												</h3>
												<a href="single-listing-1.html" class="image-wrapper background-image">
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
											<a href="single-listing-1.html" class="detail text-caps underline">Detail</a>
										</div>
									</div>--%>
											<!--end item-->

											<!--end item-->

										</div>
									</ContentTemplate>
								</asp:UpdatePanel>
								<!--============ End Items ==============================================================-->
								<div class="page-pagination">
									<nav aria-label="Pagination">
										<ul class="pagination">
											<li class="page-item">

												<asp:LinkButton ID="lbPrevious" class="page-link" aria-label="Previous" runat="server" OnClick="lbPrevious_Click">
													<span aria-hidden="true">
														<i class="fa fa-chevron-left"></i>
													</span>
													<span class="sr-only">Previous</span>
												</asp:LinkButton>
												<%--<a class="page-link" href="#" aria-label="Previous">
													<span aria-hidden="true">
														<i class="fa fa-chevron-left"></i>
													</span>
													<span class="sr-only">Previous</span>
												</a>--%>
											</li>

											<asp:DataList ID="rptPaging" runat="server"
												OnItemCommand="rptPaging_ItemCommand"
												OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
												<ItemTemplate>
													<li class="page-item">
														<asp:LinkButton CssClass="page-link" ID="lbPaging" runat="server"
															CommandArgument='<%# Eval("PageIndex") %>' CommandName="newPage"
															Text='<%# Eval("PageText") %> '></asp:LinkButton>
														<%--<a class="page-link" href="#">1</a>--%>
													</li>
												</ItemTemplate>
											</asp:DataList>

											<%--<li class="page-item active">
												<a class="page-link" href="#">1</a>
											</li>
											<li class="page-item">
												<a class="page-link" href="#">2</a>
											</li>
											<li class="page-item">
												<a class="page-link" href="#">3</a>
											</li>--%>
											<li class="page-item">

												<asp:LinkButton ID="lbNext" class="page-link" aria-label="Previous" runat="server" OnClick="lbNext_Click">
													<span aria-hidden="true">
														<i class="fa fa-chevron-right"></i>
													</span>
													<span class="sr-only">Next</span>
												</asp:LinkButton>

												<%--<a class="page-link" href="#" aria-label="Next">
													<span aria-hidden="true">
														<i class="fa fa-chevron-right"></i>
													</span>
													<span class="sr-only">Next</span>
												</a>--%>
											</li>
										</ul>
									</nav>
								</div>
								<!--end page-pagination-->
							</div>

							<!--end col-md-9-->
							<div class="col-md-3">
								<!--============ Side Bar ===============================================================-->
								<aside class="sidebar">
									<h2>Search Venue</h2>
									<!--============ Side Bar Search Form ===============================================-->
									<div class="sidebar-form form">
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
										<div class="form-group">
											<label for="input-location" class="col-form-label">Where?</label>
											<asp:TextBox ID="txtLocation" class="form-control small" runat="server" placeholder="Enter Location"></asp:TextBox>
											<%--<input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">--%>
											<%--<span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>--%>
										</div>
										<!--end form-group-->
										<asp:Button ID="btnSearch" class="btn btn-primary width-100 small" runat="server" Text="Search" OnClick="btnSearch_Click" />
										<%--<button type="submit" class="btn btn-primary width-100 small">Search</button>--%>

										<!--Alternative Form-->
										<%--<div class="alternative-search-form">
										<a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse" aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
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
												<div class="form-group">
													<h4>Price Range</h4>
													<div class="ui-slider" id="price-slider" data-value-min="10" data-value-max="400" data-value-type="price" data-currency="$" data-currency-placement="before">
														<div class="values clearfix">
															<input class="value-min" name="value-min[]" readonly>
															<input class="value-max" name="value-max[]" readonly>
														</div>
														<div class="element"></div>
													</div>
													<!--end price-slider-->
												</div>
												<!--end form-group-->
											</div>
											<!--end wrapper-->
										</div>
										<!--end collapse-->
									</div>--%>
										<!--end alternative-search-form-->
									</div>
									<!--============ End Side Bar Search Form ===========================================-->
								</aside>
								<!--============ End Side Bar ===========================================================-->
							</div>
							<!--end col-md-3-->
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
					<!-- End row -->
					<div class="background">
						<div class="background-image original-size">
							<img src="assets/img/footer-background-icons.jpg" alt="venue footer">
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
		<script src="assets/js/selectize.min.js"></script>
		<script src="assets/js/masonry.pkgd.min.js"></script>
		<script src="assets/js/icheck.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/custom.js"></script>
	</form>
</body>
</html>
