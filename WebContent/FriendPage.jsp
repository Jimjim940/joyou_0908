<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>揪遊商城</title>
    <style>
      .wrapper {
        width: 850px;
        margin: 0px auto;
      }

      .clear {
        clear: both;
      }

      .items {
        display: block;
        margin: 20px 0;
        font-weight: bold;
      }

      .item {
        text-align: center;
        background-color: #fff;
        float: left;
        margin: 0 20px 0 20px;
        width: 240px;
        padding: 10px;
        height: 360px;
      }

      .item img {
        display: block;
        margin: auto;
      }

      .add-to-cart {
        background-color: white;
        color: #000079;
        text-transform: uppercase;
        font-weight: bold;
        cursor: pointer;
      }

      .add-to-cart:hover {
        background-color: #ffd306;
        color: #000079;
        text-transform: uppercase;
        font-weight: bold;
        cursor: pointer;
      }
    </style>

    <script type="text/javascript">
    
	
	
    </script>

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
      <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
      <div class="humberger__menu__logo">
        <a href="#"><img src="img/logo.png" alt="" /></a>
      </div>
      <div class="humberger__menu__cart">
        <ul>
          <li>
            <a href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"
              ><i class="fa fa-shopping-bag"></i>
              <span>${ShoppingCart.itemNumber}</span></a
            >
          </li>
        </ul>
        <div class="header__cart__price">
          <font color="Black" size="-1">
            <c:out value="購物金額:NT.${ShoppingCart.subtotal}" default="0"
          /></font>
        </div>
      </div>
      <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
          <a href="#"><i class="fa fa-user"></i> Login</a>
        </div>
      </div>
      <nav class="humberger__menu__nav mobile-menu">
        <ul>
          <li><a href="./shop-grid.html">Shop</a></li>
          <li>
            <a href="#">Pages</a>
            <ul class="header__menu__dropdown">
              <li><a href="./shop-details.html">Shop Details</a></li>
              <li><a href="./shoping-cart.html">Shoping Cart</a></li>
              <li><a href="./checkout.html">Check Out</a></li>
              <li><a href="./blog-details.html">Blog Details</a></li>
            </ul>
          </li>
          <li><a href="./blog.html">Blog</a></li>
          <li><a href="./contact.html">Contact</a></li>
        </ul>
      </nav>
      <div id="mobile-menu-wrap"></div>
      <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
      </div>
      <div class="humberger__menu__contact">
        <ul>
          <li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
          <li>買千送百活動開跑中</li>
        </ul>
      </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
      <div class="header__top">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="header__top__left">
                <ul>
                  <li><i class="fa fa-envelope"></i> JoYo@gmail.com</li>
                  <li>買千送百活動開跑中</li>
                </ul>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="header__top__right">
                <div class="header__top__right__social">
                  <a href="#"><i class="fa fa-facebook"></i></a>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                  <a href="#"><i class="fa fa-linkedin"></i></a>
                  <a href="#"><i class="fa fa-pinterest-p"></i></a>
                </div>

                <div class="header__top__right__auth">
                  <a href="#"><i class="fa fa-user"></i> Login</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="header__logo">
              <a href="./index.jsp"><img src="img/logo.png" alt="" /></a>
            </div>
          </div>
          <div class="col-lg-6">
            <nav class="header__menu">
              <ul>
                <li class="active">
                	<a href="./index.jsp">會員專區</a>
                	<ul class="header__menu__dropdown">
                    <li><a href="./shop-details.html">會員資料</a></li>
                    <li><a href="./FriendPage.html">好友列表</a></li>
                  </ul>
                </li>

                <li class="active"><a href="./shop-grid.html">桌遊百科</a></li>
                <!--  <li><a href="ProductsGetServlet.do">揪遊商城</a> -->
                <li class="active"><a href="ProductsGetServlet.do">揪遊商城</a></li>
                <li class="active">
                  <a>揪遊團</a>
                  <ul class="header__menu__dropdown">
                    <li><a href="./shop-details.html">討論區</a></li>
                  </ul>
                </li>
                <li class="active"><a href="./contact.html">聯繫我們</a></li>
              </ul>
            </nav>
          </div>
          <div class="col-lg-3">
            <div class="header__cart">
              <ul>
                <li>
                  <a
                    href="http://localhost:8080/JoYouProject/ShopingCartPage.jsp"
                    ><i class="fa fa-shopping-bag"></i
                    ><span>${ShoppingCart.itemNumber}</span></a
                  >
                </li>
              </ul>
              <div class="header__cart__price">
                <span
                  >購物金額 $<c:out
                    value="${ShoppingCart.subtotal}"
                    default="0"
                /></span>
              </div>
            </div>
          </div>
        </div>
        <div class="humberger__open">
          <i class="fa fa-bars"></i>
        </div>
      </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="hero__categories">
              <ul>
                <li><a href="#">Fresh Meat</a></li>
                <li><a href="#">Vegetables</a></li>
                <li><a href="#">Fruit & Nut Gifts</a></li>
                <li><a href="#">Fresh Berries</a></li>
                <li><a href="#">Ocean Foods</a></li>
                <li><a href="#">Butter & Eggs</a></li>
                <li><a href="#">Fastfood</a></li>
                <li><a href="#">Fresh Onion</a></li>
                <li><a href="#">Papayaya & Crisps</a></li>
                <li><a href="#">Oatmeal</a></li>
                <li><a href="#">Fresh Bananas</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="hero__search">
              <div class="hero__search__form">
                <form action="#">
                  <div class="hero__search__categories">
                    All Categories <span class="arrow_carrot-down"></span>
                  </div>
                  <input type="text" placeholder="What do yo u need?" />
                  <button type="submit" class="site-btn">SEARCH</button>
                </form>
              </div>
              <div class="hero__search__phone">
                <div class="hero__search__phone__icon">
                  <i class="fa fa-phone"></i>
                </div>
                <div class="hero__search__phone__text">
                  <h5>02-28825252</h5>
                  <span>24Hr客服專線</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>好友專區</h2>
              <div class="breadcrumb__option">
                <!-- <span>WELCOME</span> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg col-md">
            <div class="product__discount">
              <div class="section-title product__discount__title">
                <h2>好友列表</h2>
              </div>

              <div id="saleProduct"></div>
              <!-- 特價區 -->
            </div>
            <div class="filter__item">
              <div class="row">
                <div class="col-lg-4 col-md-5"></div>
                <div class="col-lg-4 col-md-4">
                  <div class="filter__found"></div>
                </div>
                <div class="col-lg-4 col-md-3">
                  <div class="filter__option">
                    <span class="icon_grid-2x2"></span>
                    <span class="icon_ul"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail.jsp">
                  <img class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest01.jpg"
                      alt=""
                      width="100"></a>
                  <h4 class="mb-1">
                  <a href="FriendDetail.jsp">
                    <font color="black">多拉A夢</font></a>
                  </h4>
                  
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail02.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest02.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail02.jsp"
                      ><font color="black">大象</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail03.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest03.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail03.jsp"
                      ><font color="black">迷你鼠</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail04.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest04.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail04.jsp"
                      ><font color="black">派大星</font></a
                    >
                  </h4>
                </div>
              </div>
               <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail05.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest05.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail05.jsp"
                      ><font color="black">野餐</font></a
                    >
                  </h4>
                </div>
              </div>
               <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail06.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest06.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail06.jsp"
                      ><font color="black">白熊問號</font></a
                    >
                  </h4>
                </div>
              </div>
              

              <!-- </div> -->
            </div>
            <div class="filter__item"></div>
            <div class="product__discount">
              <div class="section-title product__discount__title">
                <p class="precomm">推薦好友</p>
              </div>
            </div>
            <div class="row">
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail07.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest07.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail07.jsp"
                      ><font color="black">無奈</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail08.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest08.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail08.jsp"
                      ><font color="black">皮卡皮卡</font></a
                    >
                  </h4>
                </div>
              </div>
              <div class="col-4 col-md-4 col-lg-4 col-xxl-2 mb-1">
                <div class="bg-white p-3 h-100">
                  <a href="FriendDetail09.jsp"
                    ><img
                      class="img-thumbnail img-fluid rounded-circle mb-3 shadow-sm"
                      src="img/friendstest/friendtest09.jpg"
                      alt=""
                      width="100"
                  /></a>
                  <h4 class="mb-1">
                    <a href="FriendDetail09.jsp"
                      ><font color="black">汪醬</font></a
                    >
                  </h4>
                </div>
              </div>
            </div>

            <div style="margin-left: 250px; margin-top: 50px"></div>
          </div>
        </div>
      </div>
    </section>

    <footer class="footer spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="footer__about">
              <div class="footer__about__logo">
                <a href="./index.html"><img src="img/logo.png" alt="" /></a>
              </div>
              <ul>
                <li>Address: 60-49 Road 11378 New York</li>
                <li>Phone: 02-28825252</li>
                <li>Email: hello@colorlib.com</li>
              </ul>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
            <div class="footer__widget">
              <h6>Useful Links</h6>
              <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">About Our Shop</a></li>
                <li><a href="#">Secure Shopping</a></li>
                <li><a href="#">Delivery infomation</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Our Sitemap</a></li>
              </ul>
              <ul>
                <li><a href="#">Who We Are</a></li>
                <li><a href="#">Our Services</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Innovation</a></li>
                <li><a href="#">Testimonials</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-4 col-md-12">
            <div class="footer__widget">
              <h6>Join Our Newsletter Now</h6>
              <p>
                Get E-mail updates about our latest shop and special offers.
              </p>
              <form action="#">
                <input type="text" placeholder="Enter your mail" />
                <button type="submit" class="site-btn">Subscribe</button>
              </form>
              <div class="footer__widget__social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="footer__copyright"></div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>