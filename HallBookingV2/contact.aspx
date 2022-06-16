<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="HallBookingV2.contact" %>

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

    <!-- meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="placefinder">
    <meta name="description" content="Search and book places for all occasions. Here you will find places for parties, weddings, conferences and other types of events.">
    <meta name="keywords" content="hall rentals near me,meeting room,event space,party places near me,event centers near me,wedding hall,function hall,birthday party venues near me,conference venues" />

    <!-- CSS Style -->
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

    <title>Place finder | Contact</title>

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
                                        <li class="nav-item active">
                                            <a class="nav-link" href="/contact">Contact</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="add_venue1.aspx" class="btn btn-primary text-caps btn-rounded btn-framed">Add your Venue</a>
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
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <%--<li class="breadcrumb-item"><a href="#">Library</a></li>--%>
                                <li class="breadcrumb-item active">Contact</li>
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
                                                <select name="category" id="category" class="small" data-placeholder="Select Category">
                                                    <option value="">Select Event Type</option>
                                                    <option value="1">Wedding</option>
                                                    <option value="2">Conference</option>
                                                    <option value="3">Birthday Party</option>
                                                    <option value="4">Office Party</option>
                                                    <option value="5">Other</option>
                                                </select>
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
                                                <input name="location" type="text" class="form-control small" id="input-location" placeholder="Enter Location">
                                                <%--<span class="geo-location input-group-addon" data-toggle="tooltip" data-placement="top" title="Find My Position"><i class="fa fa-map-marker"></i></span>--%>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-3-->
                                        <div class="col-md-3 col-sm-3">
                                            <asp:Button ID="Button1" CssClass="btn btn-primary width-100 small" runat="server" Text="Search" />
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
                            <h1>Contact</h1>
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
                            <div class="col-md-4">
                                <h2>Get In Touch</h2>
                                <img src="assets/img/logo1.png" alt="Place finder" />
                                <p />
                                <p>
                                </p>
                                <br>
                                <figure class="with-icon">
                                    <i class="fa fa-map-marker"></i>
                                    <span>
                                        <br>
                                    </span>
                                </figure>
                                <br>
                                <figure class="with-icon">
                                    <i class="fa fa-phone"></i>
                                    <span>+94 76 61 35 962</span>
                                </figure>
                                <figure class="with-icon">
                                    <i class="fa fa-envelope"></i>
                                    <a href="#">info@placefinder.lk</a>
                                </figure>
                                <figure class="with-icon">
                                    <i class="fa fa-envelope"></i>
                                    <a href="#">support@placefinder.lk</a>
                                </figure>
                            </div>
                            <!--end col-md-4-->
                            <div class="col-md-8">
                                <h2>Contact Form</h2>
                                <div class="form email">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name" class="col-form-label required">Your Name</label>
                                                <asp:TextBox ID="txtName" CssClass="form-control small" placeholder="Your Name" runat="server" required></asp:TextBox>
                                                <%--<input name="name" type="text" class="form-control" id="name" placeholder="Your Name" required>--%>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-6-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email" class="col-form-label required">Your Email</label>
                                                <asp:TextBox ID="txtEmail" CssClass="form-control small" runat="server" placeholder="Your Email" required></asp:TextBox>
                                                <%--<input name="email" type="email" class="form-control" id="email" placeholder="Your Email" required>--%>
                                            </div>
                                            <!--end form-group-->
                                        </div>
                                        <!--end col-md-6-->
                                    </div>
                                    <!--end row-->
                                    <div class="form-group">
                                        <label for="subject" class="col-form-label">Subject</label>
                                        <asp:TextBox ID="txtSubject" CssClass="form-control small" runat="server" placeholder="Subject"></asp:TextBox>
                                        <%--<input name="subject" type="text" class="form-control" id="subject" placeholder="Subject">--%>
                                    </div>
                                    <!--end form-group-->
                                    <div class="form-group">
                                        <label for="message" class="col-form-label required">Your Message</label>
                                        <asp:TextBox ID="txtMessage" TextMode="MultiLine" CssClass="form-control small" Rows="3" runat="server" placeholder="Your Message" required></asp:TextBox>
                                        <%--<textarea name="message" id="message" class="form-control" rows="4" placeholder="Your Message" required></textarea>--%>
                                    </div>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                        <ProgressTemplate>
                                            <img alt="" src="image/crop.gif" />
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <!--end form-group-->
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="Button2" CssClass="btn btn-primary float-right small" runat="server" OnClick="Button2_Click" Text="Send Message" />
                                            <%--<button type="submit" class="btn btn-primary float-right">Send Message</button>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <!--end form-->
                            </div>
                            <!--end col-md-8 -->
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
                                    <strong>Email:</strong> <a href="mailto:info@placefinder.lk">info@placefinder.lk</a>
                                    <br>
                                    <strong>Phone: </strong>+94 76 61 35 962

									<br>
                                    <br>
                                    <a href="/contact" class="btn btn-primary text-caps btn-framed">Contact Us</a>
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
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=YOUR_API_KEY&libraries=places"></script>
        <script src="assets/js/selectize.min.js"></script>
        <script src="assets/js/masonry.pkgd.min.js"></script>
        <script src="assets/js/icheck.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            var latitude = 51.511971;
            var longitude = -0.137597;
            var markerImage = "assets/img/map-marker.png";
            var mapTheme = "light";
            var mapElement = "map-contact";
            simpleMap(latitude, longitude, markerImage, mapTheme, mapElement);
        </script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script type="text/javascript">

            function send() {
                swal(
					{
					    title: 'Thank you!',
					    text: 'Your request has successfully sent!',
					    type: 'success',
					    icon: "success",
					    button: "Go to Home!",
					    confirmButtonColor: '#4fa7f3'
					}).then(function () {
					    window.location = "/Home";
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

