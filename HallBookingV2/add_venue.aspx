<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_venue.aspx.cs" Inherits="HallBookingV2.add_venue" %>

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

	<meta http-equiv="Content-type" content="text/html" charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="placefinder">
	<meta name="description" content="Search and book places for all occasions. Here you will find places for parties, weddings, conferences and other types of events.">
	<meta name="keywords" content="hall rentals near me,meeting room,event space,party places near me,event centers near me,wedding hall,function hall,birthday party venues near me,conference venues" />


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



	<title>Place finder | Add your venue</title>


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
	<!-- End Google Tag Manager (noscript) -->

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
							</nav>
							<!--end navbar-->
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/Home">Home</a></li>
								<li class="breadcrumb-item"><a href="#">Venue</a></li>
								<li class="breadcrumb-item active">Submit</li>
							</ol>
							<!--end breadcrumb-->
						</div>
						<!--end container-->
					</div>
					<!--============ End Main Navigation ================================================================-->
					<!--============ Page Title =========================================================================-->
					<div class="page-title">
						<div class="container">
							<h1>Create a venue profile</h1>
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
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<ul class="nav nav-pills" id="myTab-pills" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="one-tab-pills" data-toggle="tab" href="#one-pills" role="tab" aria-controls="one-pills" aria-expanded="true">Halls</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="two-tab-pills" data-toggle="tab" href="#two-pills" role="tab" aria-controls="two-pills">Rooms</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-content" id="myTabContent-pills">
						<div class="tab-pane fade show active" id="one-pills" role="tabpanel" aria-labelledby="one-tab-pills">
							<div class="container">

								<div class="form form-submit">
									<section>
										<h2 style="margin-bottom: 2%">Basic Information</h2>
										<%--<div class="form-group" id="type">
									<label for="type" class="required">Type</label>
									<figure>
										<label class="framed">
											<input type="radio" name="type" value="1" required>
											Hotel
								
										</label>
										<label class="framed">
											<input type="radio" name="type" value="2" required>
											Hall
								
										</label>
									</figure>
								</div>--%>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="title" class="col-form-label required">Venue Name</label>
													<asp:TextBox ID="txtVenueName" CssClass="form-control small" runat="server" placeholder="Venue Name" required></asp:TextBox>
													<%--<input name="title" type="text" class="form-control" id="title1" placeholder="Venue Name" required>--%>
												</div>
												<!--end form-group-->
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="title" class="col-form-label required">Company Name</label>
													<asp:TextBox ID="txtCompany" CssClass="form-control small" runat="server" placeholder="Company Name" required></asp:TextBox>
													<%--<input name="title" type="text" class="form-control" id="title1" placeholder="Venue Name" required>--%>
												</div>
												<!--end form-group-->
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="title" class="col-form-label required">Street Address</label>
													<asp:TextBox ID="txtStreet" CssClass="form-control small" runat="server" placeholder="Street Address" required></asp:TextBox>
													<%--<input name="title" type="text" class="form-control" id="title" placeholder="Street Address" required>--%>
												</div>
												<!--end form-group-->
											</div>
											<!--end col-md-8-->
											<div class="col-md-3">
												<div class="form-group">
													<label for="title" class="col-form-label required">City</label>
													<asp:TextBox ID="txtCity" CssClass="form-control small" runat="server" placeholder="City" required></asp:TextBox>
													<%--<input name="price" type="text" class="form-control" id="price" required>--%>
													<%--<span class="input-group-addon">$</span>--%>
												</div>
												<!--end form-group-->
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label for="title" class="col-form-label">Zip Code</label>
													<asp:TextBox ID="txtZipCode" CssClass="form-control small" runat="server" placeholder="Zip Code"></asp:TextBox>
													<%--<input name="price" type="text" class="form-control" id="price" required>--%>
													<%--<span class="input-group-addon">$</span>--%>
												</div>
												<!--end form-group-->
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="name" class="col-form-label">Description</label>
													<asp:TextBox ID="txtDesc" Rows="8" TextMode="MultiLine" CssClass="form-control small" runat="server" placeholder="Description"></asp:TextBox>
													<%--<input name="name" type="text" class="form-control" id="name" placeholder="Name" required>--%>
												</div>
												<!--end form-group-->
											</div>
											<!--end col-md-4-->
											<%--<div class="col-md-4">
										<div class="form-group">
											<label for="email" class="col-form-label required">Your Email</label>
											<input name="email" type="email" class="form-control" id="email" placeholder="Email" required>
										</div>
										<!--end form-group-->
									</div>
									<!--end col-md-4-->
									<div class="col-md-4">
										<div class="form-group">
											<label for="phone" class="col-form-label required">Your Phone</label>
											<input name="phone" type="text" class="form-control" id="phone" placeholder="Phone" required>
										</div>
										<!--end form-group-->
									</div>
									<!--end col-md-4-->--%>
										</div>
									</section>
									<!--end basic information-->
									<section>
										<h2 style="margin-bottom: 2%">Capacity</h2>
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label for="name" class="col-form-label required">Standing/ Cocktail (max)</label>
													<asp:TextBox ID="txtStanding" CssClass="form-control small" runat="server" placeholder="Standing/Cocktail (max)" required></asp:TextBox>
													<%--<input name="name" type="text" class="form-control" id="name" placeholder="Name" required>--%>
												</div>
												<!--end form-group-->
											</div>
											<!--end col-md-4-->
											<div class="col-md-6">
												<div class="form-group">
													<label for="name" class="col-form-label required">Seated/Meal/Seminar (max)</label>
													<asp:TextBox ID="txtSeated" CssClass="form-control small" runat="server" placeholder="Seated/Meal/Seminar (max)" required></asp:TextBox>
													<%--<input name="name" type="text" class="form-control" id="name" placeholder="Name" required>--%>
												</div>
											</div>
											<!--end col-md-8-->
										</div>
										<!--end row-->
									</section>

									<section>
										<h2 style="margin-bottom: 2%">Capacity Details</h2>
										<h5>Maximum number of people in different table arragment</h5>
										<br />
										<div class="row">
											<div class="col-md-3">
												<figure class="category-icon">
													<span>
														<img src="image/Classroom_32px.png" alt="" />
														Seminar</span>
												</figure>
												<asp:TextBox ID="txtSeminar" CssClass="form-control small" runat="server" placeholder="Seminar (max)" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106 || (event.keyCode >= 48 && event.keyCode <= 57 && isNaN(event.key))) && event.keyCode!=32);"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<figure class="category-icon">
													<span>
														<img src="image/Organization_32px.png" alt="" />
														Theater</span>
												</figure>
												<asp:TextBox ID="txtTheater" CssClass="form-control small" runat="server" placeholder="Theater (max)" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106 || (event.keyCode >= 48 && event.keyCode <= 57 && isNaN(event.key))) && event.keyCode!=32);"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<figure class="category-icon">
													<span>
														<img src="image/Banquet.png" alt="" />
														Banquet</span>
												</figure>
												<asp:TextBox ID="txtBanquet" CssClass="form-control small" runat="server" placeholder="Banquet (max)" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106 || (event.keyCode >= 48 && event.keyCode <= 57 && isNaN(event.key))) && event.keyCode!=32);"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<figure class="category-icon">
													<span>
														<img src="image/Conference_32px.png" alt="" />
														Conference</span>
												</figure>
												<asp:TextBox ID="txtConference" CssClass="form-control small" runat="server" placeholder="Conference (max)" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106 || (event.keyCode >= 48 && event.keyCode <= 57 && isNaN(event.key))) && event.keyCode!=32);"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label required">Floor Area (<span>m<sup>2</sup></span>)</label>
												<asp:TextBox ID="txtFloor" CssClass="form-control small" runat="server" placeholder="Floor Area" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106 || (event.keyCode >= 48 && event.keyCode <= 57 && isNaN(event.key))) && event.keyCode!=32);"></asp:TextBox>
											</div>
										</div>
										<br />

										<label for="name" class="col-form-label">Additional Information</label>
										<asp:TextBox ID="txtAdditional" Rows="2" TextMode="MultiLine" CssClass="form-control small" runat="server" placeholder="Additional information"></asp:TextBox>
										<!--end form-group-->
									</section>

									<section>
										<h2 style="margin-bottom: 2%">Event Types</h2>
										<h5 style="margin-bottom: 1%; font-style: italic">kind of events can be arranged</h5>
										<div class="row">
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList1" runat="server">
													<asp:ListItem>Party</asp:ListItem>
													<asp:ListItem>Dinner/Lunch</asp:ListItem>
													<asp:ListItem>Fair/Exhibition</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList2" runat="server">
													<asp:ListItem>Wedding</asp:ListItem>
													<asp:ListItem>Meeting</asp:ListItem>
													<asp:ListItem>Show</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
											<!--end col-md-6-->
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList3" runat="server">
													<asp:ListItem>Conference</asp:ListItem>
													<asp:ListItem>Recreation</asp:ListItem>
													<asp:ListItem>Chrismas Party</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
											<!--end col-md-6-->
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList4" runat="server">
													<asp:ListItem>Retreat</asp:ListItem>
													<asp:ListItem>Activity</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
										</div>
										<!--end row-->

									</section>

									<section>
										<h2 style="margin-bottom: 2%">Pricing</h2>
										<h5 style="margin-bottom: 1%; font-style: italic">Price information can be negotiated separately with each customer.</h5>
										<div class="row">
											<div class="col-md-3">
												<label for="name" class="col-form-label">Price per person (lkr)</label>
												<asp:TextBox ID="txtPerson" CssClass="form-control small" runat="server" placeholder="0.00"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label">Price per plate (lkr)</label>
												<asp:TextBox ID="txtPlate" CssClass="form-control small" runat="server" placeholder="0.00"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label">Rent per hour (lkr)</label>
												<asp:TextBox ID="txtRentHour" CssClass="form-control small" runat="server" placeholder="0.00"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label">Rent per day (lkr)</label>
												<asp:TextBox ID="txtRentDay" CssClass="form-control small" runat="server" placeholder="0.00"></asp:TextBox>
											</div>
											<br />
											<div class="col-md-12">
												<label for="name" class="col-form-label">Additional Information</label>
												<asp:TextBox ID="txtPriceDetail" Rows="2" TextMode="MultiLine" CssClass="form-control small" runat="server" placeholder=""></asp:TextBox>
											</div>
										</div>
									</section>

									<!--Deposit and policy-->
									<section>
										<h2 style="margin-bottom: 2%">Reservation Cost & Cancellation Policy</h2>
										<div class="row">
											<div class="col-md-3">
												<label for="name" class="col-form-label">Reservation Deposit (lkr)</label>
												<asp:TextBox ID="txtDeposit" CssClass="form-control small" runat="server" placeholder="0.00"></asp:TextBox>
											</div>

										</div>
										<div class="row">
											<div class="col-md-12">
												<label for="name" class="col-form-label">Cancellation Policy</label>
												<asp:TextBox ID="txtPolicy" Rows="3" TextMode="MultiLine" CssClass="form-control small" runat="server" placeholder=""></asp:TextBox>
											</div>
										</div>
									</section>

									<!-- contact -->
									<section>
										<h2 style="margin-bottom: 2%">Contact Info</h2>
										<div class="row">
											<div class="col-md-6">
												<label for="name" class="col-form-label">Contact Person Name</label>
												<asp:TextBox ID="txtContactName" CssClass="form-control small" runat="server" placeholder="Name"></asp:TextBox>
											</div>
											<div class="col-md-6">
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label for="name" class="col-form-label">Contact Phone Number</label>
												<asp:TextBox ID="txtContactPhone" CssClass="form-control small" runat="server" placeholder="Phone Number"></asp:TextBox>
											</div>
											<div class="col-md-6">
												<label for="name" class="col-form-label">Contact Email</label>
												<asp:TextBox ID="txtContactEmail" CssClass="form-control small" runat="server" placeholder="Email"></asp:TextBox>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label for="name" class="col-form-label">Venue Web site</label>
												<asp:TextBox ID="txtVenueWeb" CssClass="form-control small" runat="server" placeholder="http://"></asp:TextBox>
											</div>
											<div class="col-md-6">
												<label for="name" class="col-form-label">Facebook Profile</label>
												<asp:TextBox ID="txtFb" CssClass="form-control small" runat="server" placeholder="https://facebook.com/"></asp:TextBox>
											</div>
										</div>
									</section>
									<!-- end contact-->

									<!-- Gallery-->
									<section>
										<h2 style="margin-bottom: 2%">Gallery</h2>
										<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
											<ContentTemplate>
												<div class="file-upload-previews"></div>
												<div class="file-upload">

													<asp:FileUpload ID="UploadImages" class="file-upload-input with-preview" AllowMultiple="true" title="Click to add files" runat="server" accept="gif|jpg|png" />

													<%--<input type="file" name="files[]" class="file-upload-input with-preview" multiple title="Click to add files" maxlength="10" accept="gif|jpg|png">--%>
													<span><i class="fa fa-plus-circle"></i>Click or drag images here</span>
													<p><small style="font-weight: bold">Please note that images with adverts in them are not allowed</small></p>

												</div>
											</ContentTemplate>
											<Triggers>
												<asp:PostBackTrigger ControlID="btnSaveVenue" />
											</Triggers>
										</asp:UpdatePanel>
									</section>

									<%--<section>
							<h2>Additional Information</h2>
							<h3>Opening Hours<span class="note">(optional)</span></h3>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="accordion-heading-1">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse" data-parent="#accordion" href="#accordion-collapse-1" aria-expanded="false" aria-controls="accordion-collapse-1">
												<i class="fa fa-clock-o"></i>Add opening hours
											</a>
										</h4>
									</div>
									<!--end panel-heading-->
									<div id="accordion-collapse-1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="accordion-heading-1">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Monday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Tuesday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Wednesday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Thursday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Friday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Saturday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
											<div class="row">
												<div class="col-md-4 col-sm-4 horizontal-input-title">
													<strong>Sunday</strong>
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="open_hours[]" placeholder="Open">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
												<div class="col-md-4 col-sm-4">
													<div class="form-group">
														<input type="text" class="form-control" name="close_hours[]" placeholder="Close">
													</div>
													<!--end form-group-->
												</div>
												<!--end col-md-4-->
											</div>
											<!--end row-->
										</div>
									</div>
									<!--end panel-collapse-->
								</div>
								<!--end panel-->
							</div>
							<!--end panel-group-->
						</section>--%>

									<section class="clearfix">
										<div class="form-group">
											<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
												<ContentTemplate>
													<asp:Button ID="btnSaveVenue" class="btn btn-primary icon float-left" runat="server" Text="Save venue" OnClick="btnSaveVenue_Click" />
													<br />
													<asp:Label ID="lblError" class="col-form-label text-warning" runat="server" Text=""></asp:Label>
													<%--<button type="submit" class="btn btn-primary icon float-right">Preview<i class="fa fa-chevron-right"></i></button>--%>
												</ContentTemplate>
											</asp:UpdatePanel>
										</div>
									</section>
								</div>
								<!--end form-submit-->
							</div>
						</div>
						<div class="tab-pane fade" id="two-pills" role="tabpanel" aria-labelledby="two-tab-pills">
							<div class="container">

								<div class="form form-submit">
									<section>
										<h2 style="margin-bottom: 2%">Basic Information</h2>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="title" class="col-form-label required">Hotel Name</label>
													<asp:TextBox ID="TextBox1" CssClass="form-control small" runat="server" placeholder="Venue Name" required></asp:TextBox>
													<%--<input name="title" type="text" class="form-control" id="title1" placeholder="Venue Name" required>--%>
												</div>
												<!--end form-group-->
											</div>
											<div class="col-md-6">
												<%--<div class="form-group">
													<label for="title" class="col-form-label required">Company Name</label>
													<asp:TextBox ID="TextBox2" CssClass="form-control small" runat="server" placeholder="Company Name" required></asp:TextBox>
												</div>--%>
												<!--end form-group-->
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="title" class="col-form-label required">Street Address</label>
													<asp:TextBox ID="TextBox3" CssClass="form-control small" runat="server" placeholder="Street Address" required></asp:TextBox>
												</div>
												<!--end form-group-->
											</div>
											<!--end col-md-8-->
											<div class="col-md-3">
												<div class="form-group">
													<label for="title" class="col-form-label required">City</label>
													<asp:TextBox ID="TextBox4" CssClass="form-control small" runat="server" placeholder="City" required></asp:TextBox>
												</div>
												<!--end form-group-->
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label for="title" class="col-form-label">Zip Code</label>
													<asp:TextBox ID="TextBox5" CssClass="form-control small" runat="server" placeholder="Zip Code"></asp:TextBox>
												</div>
												<!--end form-group-->
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="name" class="col-form-label">Description</label>
													<asp:TextBox ID="TextBox6" Rows="8" TextMode="MultiLine" CssClass="form-control small" runat="server" placeholder="Description"></asp:TextBox>
												</div>
												<!--end form-group-->
											</div>
											<!--end col-md-4-->
										</div>
									</section>

									<section>
										<h2 style="margin-bottom: 2%">Capacity</h2>
										<div class="row">

											<div class="col-md-4">
												<div class="form-group">
													<label for="name" class="col-form-label required">Room Type</label>
													<asp:TextBox ID="txtRoomType" CssClass="form-control small" runat="server" placeholder="Room Type" required></asp:TextBox>
													<%--<input name="name" type="text" class="form-control" id="name" placeholder="Name" required>--%>
												</div>
												<!--end form-group-->
											</div>
											<!--end col-md-4-->
											<div class="col-md-4">
												<div class="form-group">
													<label for="name" class="col-form-label required">Price Per Night</label>
													<asp:TextBox ID="txtPriceRoom" CssClass="form-control small" runat="server" placeholder="Price Per Night" required></asp:TextBox>
													<%--<input name="name" type="text" class="form-control" id="name" placeholder="Name" required>--%>
												</div>
											</div>
											<!--end col-md-8-->
											<div class="col-md-4">
												<div class="form-group">
													<br />
													<br />
													<asp:Button ID="btnAddroom" class="btn btn-primary icon float-left small" runat="server" Text="Add" OnClick="btnAddroom_Click" />
													<%--<input name="name" type="text" class="form-control" id="name" placeholder="Name" required>--%>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<asp:GridView ID="GridView2" CssClass="grid" runat="server">
												<Columns>
													<asp:ButtonField Text="Edit"></asp:ButtonField>
												</Columns>
											</asp:GridView>
											</div>
										</div>
										<!--end row-->
									</section>

									<section>
										<h2 style="margin-bottom: 2%">Features</h2>
										<h5 style="margin-bottom: 1%; font-style: italic">kind of features can be arranged</h5>
										<div class="row">
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList5" runat="server">
													<asp:ListItem>Comfortable Bed</asp:ListItem>
													<asp:ListItem>Sea View</asp:ListItem>
													<asp:ListItem>Balcony/Terrace</asp:ListItem>
													<asp:ListItem>Non-smoking</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList6" runat="server">
													<asp:ListItem>Shower</asp:ListItem>
													<asp:ListItem>Bath Tub</asp:ListItem>
													<asp:ListItem>Toiletries</asp:ListItem>
													<asp:ListItem>Hair Dryer</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
											<!--end col-md-6-->
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList7" runat="server">
													<asp:ListItem>Mini bar</asp:ListItem>
													<asp:ListItem>Closet</asp:ListItem>
													<asp:ListItem>Ironing facility</asp:ListItem>
													<asp:ListItem>Telephone</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
											<!--end col-md-6-->
											<div class="col-md-3">
												<asp:CheckBoxList ID="CheckBoxList8" runat="server">
													<asp:ListItem>Satellite/cable TV</asp:ListItem>
													<asp:ListItem>Free Wi-Fi</asp:ListItem>
													<asp:ListItem>In-room safe box</asp:ListItem>
													<asp:ListItem>Air conditioning</asp:ListItem>
												</asp:CheckBoxList>
												<!--end form-group-->
											</div>
										</div>
										<!--end row-->

									</section>

									<!-- contact -->
									<section>
										<h2 style="margin-bottom: 2%">Contact Info</h2>
										<div class="row">
											<div class="col-md-6">
												<label for="name" class="col-form-label">Contact Person Name</label>
												<asp:TextBox ID="TextBox8" CssClass="form-control small" runat="server" placeholder="Name"></asp:TextBox>
											</div>
											<div class="col-md-6">
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label for="name" class="col-form-label">Contact Phone Number</label>
												<asp:TextBox ID="TextBox9" CssClass="form-control small" runat="server" placeholder="Phone Number"></asp:TextBox>
											</div>
											<div class="col-md-6">
												<label for="name" class="col-form-label">Contact Email</label>
												<asp:TextBox ID="TextBox10" CssClass="form-control small" runat="server" placeholder="Email"></asp:TextBox>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<label for="name" class="col-form-label">Hotel Web site</label>
												<asp:TextBox ID="TextBox11" CssClass="form-control small" runat="server" placeholder="http://"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label">Booking.com Profile</label>
												<asp:TextBox ID="TextBox12" CssClass="form-control small" runat="server" placeholder="https://booking.com/"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label">Agoda Profile</label>
												<asp:TextBox ID="TextBox13" CssClass="form-control small" runat="server" placeholder="https://agoda.com/"></asp:TextBox>
											</div>
											<div class="col-md-3">
												<label for="name" class="col-form-label">Tripadvisor Profile</label>
												<asp:TextBox ID="TextBox14" CssClass="form-control small" runat="server" placeholder="https://tripadvisor.com/"></asp:TextBox>
											</div>
										</div>
									</section>
									<!-- end contact-->

									<!-- Gallery-->
									<section>
										<h2 style="margin-bottom: 2%">Gallery</h2>
										<asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
											<ContentTemplate>
												<div class="file-upload-previews"></div>
												<div class="file-upload">

													<asp:FileUpload ID="FileUpload1" class="file-upload-input with-preview" AllowMultiple="true" title="Click to add files" runat="server" accept="gif|jpg|png" />

													<%--<input type="file" name="files[]" class="file-upload-input with-preview" multiple title="Click to add files" maxlength="10" accept="gif|jpg|png">--%>
													<span><i class="fa fa-plus-circle"></i>Click or drag images here</span>
													<p><small style="font-weight: bold">Please note that images with adverts in them are not allowed</small></p>

												</div>
											</ContentTemplate>
											<Triggers>
												<asp:PostBackTrigger ControlID="btnSaveVenue" />
											</Triggers>
										</asp:UpdatePanel>
									</section>

									<section class="clearfix">
										<div class="form-group">
											<asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
												<ContentTemplate>
													<asp:Button ID="Button1" class="btn btn-primary icon float-left" runat="server" Text="Save" OnClick="btnSaveVenue_Click" />
													<br />
													<asp:Label ID="Label1" class="col-form-label text-warning" runat="server" Text=""></asp:Label>
													<%--<button type="submit" class="btn btn-primary icon float-right">Preview<i class="fa fa-chevron-right"></i></button>--%>
												</ContentTemplate>
											</asp:UpdatePanel>
										</div>
									</section>

								</div>
							</div>
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
													<a href="/signin">Sign In</a>
												</li>
												<li>
													<a href="register.aspx">Register</a>
												</li>
												<li>
													<a href="#">Privacy Policy</a>
												</li>
												<li>
													<a href="#">Terms & Condition</a>
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
		<!--<script src="assets/js/jquery.validate.min.js"></script>-->
		<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
		<script src="assets/js/jquery-validate.bootstrap-tooltip.min.js"></script>
		<script src="assets/js/jQuery.MultiFile.min.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/custom.js"></script>

		<script>
			var latitude = 51.511971;
			var longitude = -0.137597;
			var markerImage = "assets/img/map-marker.png";
			var mapTheme = "light";
			var mapElement = "map-submit";
			var markerDrag = true;
			simpleMap(latitude, longitude, markerImage, mapTheme, mapElement, markerDrag);
		</script>

		<script type="text/javascript">

			function openModal() {

				$('#myModal').modal();
			}

			function openModalFail() {

				$('#myModalFail').modal();
			}
		</script>


		<script type="text/javascript">
			// Div Hide 
			function show1(myradio) {
				document.getElementById('div1').style.display = 'none';
			}
			function show2(myradio) {
				document.getElementById('div1').style.display = 'block';
			}
		</script>

	</form>

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
					<h4>Great!</h4>
					<p>Your venue successfully registered with place finder. </p>
					<button class="btn btn-success" onclick="location.href='my_venue.aspx';" data-dismiss="modal"><span>View my venues</span> <i class="fa fa-arrow-circle-o-right"></i></button>
					<button class="btn btn-success" onclick="location.href='/register_venue';" data-dismiss="modal"><span>Add another Venue</span> <i class="fa fa-arrow-circle-o-right"></i></button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal HTML -->
	<div id="myModalFail" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="icon-box">
						<i class="fa fa-times"></i>
					</div>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body text-center">
					<h4>Sorry!</h4>
					<p>Venue registration failed. Please try again later. </p>
					<button class="btn btn-success" onclick="location.href='my_venue.aspx';" data-dismiss="modal"><span>View my venues</span> <i class="fa fa-arrow-circle-o-right"></i></button>
					<button class="btn btn-success" onclick="location.href='/register_venue';" data-dismiss="modal"><span>Try Again</span> <i class="fa fa-arrow-circle-o-right"></i></button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

