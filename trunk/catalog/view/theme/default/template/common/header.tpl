<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>

        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/slideshow.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/jquery00.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/homefeat.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/products.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/sendtoaf.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/global00.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/register.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/style000.css" />
        <link type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />

        <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery.carouFredSel.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery-1.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/moderniz.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jscript_.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/script00.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/nivo0000.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/tools000.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery00.js"></script>

        <!--[if IE 7]> 
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
        <![endif]-->
        <!--[if lt IE 7]>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
        <script type="text/javascript" src="catalog/catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
        <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
        </script>
        <![endif]-->
<?php if ($stores) { ?>
        <script type="text/javascript"><!--
            $(document).ready(function() {
        <?php foreach ($stores as $store) { ?>
                $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
        <?php } ?>
            });
            //--></script>
<?php } ?>
<?php echo $google_analytics; ?>
    </head>
    <body id="index">
        <div id="wrapper1">
            <div id="wrapper2">
                <div id="wrapper3" class="clearfix">

                    <div class="login_link">
                        <div class="infoBar">
                            <div class="sitelinks left">

                            </div>
                            <ul class="sitelinks left">
                                <li><a class="activeSite" href="http://welook.vn" name="top">WE LOOK</a></li>
                                <li><a href="http://wesale.vn" oldtitle="WE SALE" title="" aria-describedby="ui-tooltip-0">WE SALE</a></li>
                                <li><a href="http://weorder.vn" oldtitle="WE ORDER" title="" aria-describedby="ui-tooltip-1" id="od">WE ORDER</a></li>
                                <li><a href="http://wedrink.vn" oldtitle="WE DRINK" title="">WE DRINK</a></li>
                                <li><a rel="nofollow" href="http://wephoto.vn" oldtitle="WE PHOTO" title="" aria-describedby="ui-tooltip-3"> WE PHOTO</a></li>
                            </ul>
                        </div>
                        <span>
                        <?php if (!$logged) { ?>
                        <?php echo $text_welcome; ?>
                        <?php } else { ?>
                        <?php echo $text_logged; ?>
                        <?php } ?>
                        </span>
                    </div>

                    <header id="header" name="header" style="">                        
                        
                    <?php if ($logo) { ?>
                        <a href="<?php echo $home; ?>" style="text-decoration:none"><img width="130" src="<?php echo $logo; ?>" id="logowesale" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                        <h1 id="sloganws">Ready for better service</h1>
                    <?php } ?>
                        <a href="<?php echo $home; ?>"><img width="250" style="margin:-8px 0px 0px -42px" src="<?php echo HTTP_SERVER; ?>/image/logoweorder-bong.png" id="header_logo"></a>
                    <h1 id="slogan">___  Đặt hàng quốc tế  ___</h1>
                    <div class="top_btn">
                        <div class="topsearch">
                                <form class="" style="width: 37px;" method="get" action="#" id="searchForm">
                                        <input type="submit" class="btn-search" value="Search" id="searchSubmit">
                                        <input type="text" class="stext" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />                                    
                                </form>
                        </div> 
                    </div>
                    <div class="container">
	<div class="header_left">
		<ul id="tabs">
			<li id="current"><a name="#tab1" href="<?php echo $home; ?>"><img width="32" src="<?php echo HTTP_SERVER; ?>/image/home.png"></a></li>
                        <?php if ($categories): ?>
                            <?php foreach ($categories as $category) : ?>
                            <li><a name="#tab2" href="<?php echo $category['href'] ?>"><?php echo $category['name'] ?></a></li>
                        <?php endforeach; endif; ?>
                        <?php if ($categoriesnews): ?>
                            <?php foreach ($categoriesnews as $category) : ?>
                            <li><a name="#tab2" href="<?php echo $category['href'] ?>"><?php echo $category['name'] ?></a></li>
                        <?php endforeach; endif; ?>  
		</ul>
	</div>
                <div class="clear"></div>
		<ul id="nav-sub">
					<li class="">
						<a class="sel-cat-giay-dep" id="cat_164" href="/giay-dep/"><span class="nav-subTxt">Dịch vụ</span></a>
						<div class="nav-layer" style="visibility: hidden;">
							<div class="box unit size1of3">
                    <h4 class="ui-borderBottom pbs">
                        <a href="/men/giay-dep/">Giày Nam</a>
                    </h4>
                                            <div class="line mts">
                            <ul class="cnv unit">
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-xang-dan-dep-kep/"><span class="cnv-name cssicon">Giày Xăng Đan &amp; Dép Kẹp</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-de-mem/"><span class="cnv-name cssicon">Giày Đế Mềm</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-da/">
                                                    <span class="cnv-name cssicon">Giày Da</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-casual/">
                                                    <span class="cnv-name cssicon">Giày Casual</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-tang-chieu-cao/">
                                                    <span class="cnv-name cssicon">Giày Tăng Chiều Cao</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-the-thao-cho-nam/">
                                                    <span class="cnv-name cssicon">Giày Thể Thao</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/phu-kien-giay-nam/">
                                                    <span class="cnv-name cssicon">Phụ Kiện Giày</span>
                                                </a>
                                            </li>
                            </ul>
											</div>
							</div>
							<div class="box unit size1of3">
                    <h4 class="ui-borderBottom pbs">
                        <a href="/men/giay-dep/">Giày Nữ</a>
                    </h4>
                                            <div class="line mts">
                            <ul class="cnv unit">
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-xang-dan-dep-kep/"><span class="cnv-name cssicon">Giày Xăng Đan &amp; Dép Kẹp</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-de-mem/"><span class="cnv-name cssicon">Giày Đế Mềm</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-da/">
                                                    <span class="cnv-name cssicon">Giày Da</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-casual/">
                                                    <span class="cnv-name cssicon">Giày Casual</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-tang-chieu-cao/">
                                                    <span class="cnv-name cssicon">Giày Tăng Chiều Cao</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-the-thao-cho-nam/">
                                                    <span class="cnv-name cssicon">Giày Thể Thao</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/phu-kien-giay-nam/">
                                                    <span class="cnv-name cssicon">Phụ Kiện Giày</span>
                                                </a>
                                            </li>
                            </ul>
											</div>
							</div>
						</div>

					</li>
					<li class="">
						<a style="background-image:none;" id="cat_164" href="/giay-dep/"><span class="nav-subTxt">hướng dẫn đặt hàng</span></a>
						<div class="nav-layer" style="visibility: hidden;">
							<div class="box unit size1of3">
                    <h4 class="ui-borderBottom pbs">
                        <a href="/men/giay-dep/">Trang phục Nam</a>
                    </h4>
                                            <div class="line mts">
                            <ul class="cnv unit">
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-xang-dan-dep-kep/"><span class="cnv-name cssicon">Giày Xăng Đan &amp; Dép Kẹp</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-de-mem/"><span class="cnv-name cssicon">Giày Đế Mềm</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-da/">
                                                    <span class="cnv-name cssicon">Giày Da</span>
                                                </a>
                                            </li>
                            </ul>
											</div>
							</div>
							<div class="box unit size1of3">
                    <h4 class="ui-borderBottom pbs">
                        <a href="/men/giay-dep/">Trang phục Nữ</a>
                    </h4>
                                            <div class="line mts">
                            <ul class="cnv unit">
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-xang-dan-dep-kep/"><span class="cnv-name cssicon">Giày Xăng Đan &amp; Dép Kẹp</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-de-mem/"><span class="cnv-name cssicon">Giày Đế Mềm</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/giay-da/">
                                                    <span class="cnv-name cssicon">Giày Da</span>
                                                </a>
                                            </li>
                                            <li class="cnv-level-1">
                                                <a href="/men/giay-dep/phu-kien-giay-nam/">
                                                    <span class="cnv-name cssicon">Phụ Kiện Giày</span>
                                                </a>
                                            </li>
                            </ul>
											</div>
							</div>
						</div>
					</li>
					<li class="">
						<a style="background-image:none;" id="cat_164" href="/giay-dep/"><span class="nav-subTxt">các thương hiệu</span></a>
					</li>
					<li class="">
						<a style="background-image:none;" id="cat_164" href="/giay-dep/"><span class="nav-subTxt">chính sách ưu đãi</span></a>
					</li>
					<li class="">
						<a style="background-image:none;" id="cat_164" href="/giay-dep/"><span class="nav-subTxt">Liên hệ</span></a>
					</li>
				</ul>
            </div>
                    
                    <!--
                    <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
                    </header>
<?php if ($categories) { ?>
                    <div id="menu">
                        <ul>
    <?php foreach ($categories as $category) { ?>
                            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
                                <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
                                    <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
                                        <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
                                    </ul>
        <?php } ?>
                                </div>
      <?php } ?>
                            </li>
    <?php } ?>
                        </ul>
                    </div>
<?php } ?>
                    <div id="notification"></div>
-->