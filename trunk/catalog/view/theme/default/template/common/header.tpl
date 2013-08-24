<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="utf-8"/>
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
            <meta name="keywords" content="<?php echo $keywords; ?>, dathangquocte.vn" />
        <?php } ?>
        <?php if ($icon) { ?>
            <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>

<script type="text/javascript" src="http://carota.vn/samples/ShowMenuWhenScrolling/scripts/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://carota.vn/samples/ShowMenuWhenScrolling/scripts/jquery-1.9.1.min.js"></script>

        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/slideshow.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/jquery00.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/homefeat.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/products.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/sendtoaf.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/global00.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/register.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/style000.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/category.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/alice-min-vnfas.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/jquery-ui-1.10.3.custom.min.css" />        
        <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />

        <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery.carouFredSel.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery-1.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jscript_.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/script00.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/nivo0000.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/tools000.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery00.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/ajaxupload.min.js"></script>


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

                    <header id="header" name="header">
                        <span class="currencyHeader">
                            <?php $currencyText = "<table border='1' class='boxCurrency'><tr><th width='50px' align='center'>MÃ£</th><th align='left' width='70px'>TÃªn</th><th width='60px' align='left'>Tá»· giÃ¡/VNÄ</th></tr>"; ?>
                            <?php foreach ($currencies as $currency) : ?>
                                <?php $currencyText .= "<tr><td align='center'>" . $currency['code'] . "</td><td>" . $currency['title'] . "</td><td>" . $currency['value'] . "</td></tr>"; ?>
                            <?php endforeach; ?>
                            <?php $currencyText .= "</table>"; ?>
                            <a href="javascript:void(0)" class="toolTip" title="<?php echo $currencyText; ?>">Tỉ giá ngoại tệ</a>
                        </span>

                      <span style=" left: 0px; position: absolute; top:60px;">
                       <div style="display: inline-block; padding: 2px 4px; margin: 0px 0px 5px; text-align: center; background-color: transparent;">
<div style="display: inline-block; text-align: center;"><noscript></noscript><script type="text/javascript" src="http://localtimes.info/world_clock2.php?&cp1_Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&fwdt=72&ham=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&sep=0&widget_number=11000&lcid=USNY0996,UKXX0085,SPXX0050,GMXX0007,KSXX0037,FRXX0076"></script></div>
</div>



                        </span>
                        
                        <a href="http://pagerank.chromefans.org" target=_blank title="Dat hang quoc te - Weorder" style="opacity: 0;
"><img src="http://pr.chromefans.org/?u=7f91f6229b1dfc15978cdec9c9250903&amp;style=1" ALT="PageRank Checker" STYLE="border:0px"></a>
                        
                        
                        

                      <span style="left:50px; position: absolute; top: 178px">
                        <!-- <a rel="nofollow" href="http://welook.vn" target="_blank" oldtitle="WE LOOK" title="" aria-describedby="ui-tooltip-3"><p style= "font-size: 1.6em;"> T&#431; V&#7844;N TH&#7900;I TRANG</p> </a> -->
<div role="navigation" class="site-nav">
            
    

<div id="floor_nav">
<div class="menu css-menu">

<ul class="floors">
<li id="floor_1" class="women">
<a href="http://dathangquocte.vn/nu" id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_lnkFloor" tabindex="3" title="WOMEN">
<span>Nữ</span></a>
<div id="sub_floor_1" class="sub-floor-menus">
<div class="sub-menu-wrapper-left">
<div class="sub-menu-wrapper-right">
<div class="sub-menu-wrapper-bottom">
<div class="sub-menu-wrapper-top">
<div class="sub-menu-wrapper">
<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl00_dlDept" class="section branddirectory">
	<dt>DANH MỤC</dt>
    <dd>
        
        <ul class="items">
            <li><a href='http://dathangquocte.vn/nu/Ao-khoac-nu'>Áo khoác</a></li>
         <li><a href='http://dathangquocte.vn/nu/ao-phong-nu'>Áo phông</a></li>
         <li><a href='http://dathangquocte.vn/nu/ao-so-mi-nu'>Áo sơmi</a></li>
         <li><a href='http://dathangquocte.vn/nu/bikini'>Bikini</a></li>
         <li><a href='http://dathangquocte.vn/nu/chan-vay-nu'>Chân váy</a></li>
         <li><a href='http://dathangquocte.vn/nu/quan-short-nu'>Quần short</a></li>
         <li><a href='http://dathangquocte.vn/nu/quan-vai-nu'>Quần vải, kaki</a></li>
         <li><a href='http://dathangquocte.vn/nu/do-bau'>Đồ bà bầu</a></li>
         <li><a href='http://dathangquocte.vn/nu/do-cong-so-nu'>Đồ công sở</a></li>
         <li><a href='http://dathangquocte.vn/nu/do-lot-nu'>Đồ lót</a></li>
         <li><a href='http://dathangquocte.vn/nu/do-ngu'>Đồ ngủ</a></li>
         <li><a href='http://dathangquocte.vn/nu/ao-kieu-nu'>Áo kiểu</a></li>
         <li><a href='http://dathangquocte.vn/nu/quan-bo-nu'>Quần jeans</a></li>
         <li><a href='http://dathangquocte.vn/nu/vay-nu'>Váy</a></li>
        </ul>
        
        <ul class="items">
               <li><a class="red" href='http://dathangquocte.vn/index.php?route=product/category&path=118'>Phụ kiện nữ</a></li>
			   <li><a href='http://dathangquocte.vn/giay-nu'>Giày dép</a></li>
               <li><a href='http://dathangquocte.vn/Kinh-nu'>Kính</a></li>
               <li><a href='http://dathangquocte.vn/mu-nu'>Mũ</a></li>
               <li><a href='http://dathangquocte.vn/nuoc-hoa-nu'>Nước hoa</a></li>
               <li><a href='http://dathangquocte.vn/that-lung-nu'>Thắt lưng</a></li>
               <li><a href='http://dathangquocte.vn/tui-xach-nu'>Túi xách</a></li>
               <li><a href='http://dathangquocte.vn/dong-ho-nu'>Đồng hồ</a></li>
               <li><a href='http://dathangquocte.vn/khan-nu'>Khăn</a></li>
               <li><a href='http://dathangquocte.vn/nu-trang'>Nữ trang</a></li>
               <li><a href='http://dathangquocte.vn/trang-suc-nu'>Trang sức</a></li>
               <li><a href='http://dathangquocte.vn/vali-nu'>ali</a></li>
               <li class='last'><a href='http://dathangquocte.vn/vi-nu'>Ví</a></li>
            </ul>
    </dd>
	</dl>
    
<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl01_dlDept" class="section branddirectory">
	<dt>PHONG CÁCH</dt>
	<dd>
    
        <ul class="items">
            <li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-co-dien-cho-nu'>Cổ điển</a></li>
            <li>&nbsp;</li>
            <li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-tre-trung-nang-dong-chon-nu'>Trẻ trung, năng động</a></li>
            <li>&nbsp;</li>
            <li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-sexy-cho-nu'>Sexy</a></li>
            <li>&nbsp;</li>
            <li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-cong-so-cho-nu'>Công sở</a></li>
            <li>&nbsp;</li>
            <li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-ca-tinh-cho-nu'>Mạnh mẽ, cá tính</a></li>
            <li>&nbsp;</li>
        </ul>
	</dd>
</dl>

<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl02_dlDept" class="section">
	<dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XU HƯỚNG 2013&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</dt>
    <dd>
        
        <ul class="items">
            <li><a  href='#'>Trắng toàn tập lên ngôi</a></li>
            <li><a  href='#'>Những chiếc mũ benie</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Kiểu dáng cổ điển</a></li>
            <li><a  href='#'></a>Bốt over-knee</li>
            <li>&nbsp;</li>
            <li><a  href='#'>Những chiếc áo cổ lọ</a></li>
            <li><a  href='#'>Muôn sắc độ màu xanh</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Quần thụng</a></li>
            <li><a  href='#'>Các kiểu áo khoác</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Họa tiết dân gian</a></li>
            <li><a  href='#'>Cầu vai tròn</a></li>
            <li>&nbsp;</li>
        </ul>
    </dd>
</dl>

<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl02_dlDept">
	<dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WOMEN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</dt>
    <dd>
        <ul class="items">
        	<li><img src="http://demandware.edgesuite.net/aana_prd/on/demandware.static/Sites-ScotchSoda-GB-Site/Sites/en_GB/v1376997107180/images/slot/navigation/dropdown-women.jpg">
        </ul>
    </dd>
</dl>


</div>
</div>
</div>
</div>
</div>
</div>
</li>


<li id="floor_2" class="men">
<a href="http://dathangquocte.vn/nam" id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_lnkFloor" tabindex="3" title="MEN">
<span>NAM</span></a>
<div id="sub_floor_2" class="sub-floor-menus">
<div class="sub-menu-wrapper-left">
<div class="sub-menu-wrapper-right">
<div class="sub-menu-wrapper-bottom">
<div class="sub-menu-wrapper-top">
<div class="sub-menu-wrapper">
<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_rptDept_ctl00_dlDept" class="section">
<dt>DANH MỤC</dt>
<dd>
    
<ul class="items">
         <li><a href='http://dathangquocte.vn/nam/ao-khoac-nam'> Áo khoác </a></li>
         <li><a href='http://dathangquocte.vn/nam/ao-len-nam'> Áo len </a></li>
         <li><a href='http://dathangquocte.vn/nam/ao-phong-nam'> Áo phông </a></li>
         <li><a href='http://dathangquocte.vn/nam/ao-so-mi'> Áo sơmi </a></li>
         <li><a href='http://dathangquocte.vn/nam/quan-bo-nam'> Quần jeans </a></li>
         <li><a href='http://dathangquocte.vn/nam/quan-short'> Quần short </a></li>
         <li><a href='http://dathangquocte.vn/nam/quan-vai'> Quần vải, kaki </a></li>
         <li><a href='http://dathangquocte.vn/nam/do-boi'> Đồ bơi </a></li>
         <li><a href='http://dathangquocte.vn/nam/do-cong-so'> Đồ công sở </a></li>
         <li><a href='http://dathangquocte.vn/nam/do-lot-nam'> Đồ lót </a></li>
</ul>

<ul class="items">
			   <li><a class="red" href='http://dathangquocte.vn/index.php?route=product/category&path=117'> Phụ kiện nam </a></li>
               <li><a href='http://dathangquocte.vn/ca-vat-nam'> Cà vạt, kẹp </a></li>
               <li><a href='http://dathangquocte.vn/tui-xach-nam'> Cặp, túi </a></li>
               <li><a href='http://dathangquocte.vn/giay-nam'> Giày dép </a></li>
               <li><a href='http://dathangquocte.vn/khan-nam'> Khăn </a></li>
               <li><a href='http://dathangquocte.vn/nuoc-hoa-nam'> Nước hoa </a></li>
               <li><a href='http://dathangquocte.vn/that-lung-nam'> Thắt lưng </a></li>
               <li><a href='http://dathangquocte.vn/phu-kien-nam'> Trang sức </a></li>
               <li><a href='http://dathangquocte.vn/vali-nam'> Vali </a></li>
               <li><a href='http://dathangquocte.vn/Vi-da-nam'> Ví </a></li>
               <li><a href='http://dathangquocte.vn/dong-ho-nam'> Đồng hồ </a></li>
</ul>
</dd>
</dl>

<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_rptDept_ctl01_dlDept" class="section branddirectory">
<dt>PHONG CÁCH</dt>
<dd>
    
<ul class="items">
<li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-lich-su-cho-nam'>Lịch sự</a></li>
<li>&nbsp;</li>
<li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-chim-co-cho-nam'>Hoa lá cành</a></li>
<li>&nbsp;</li>
<li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-bui-bam-cho-nam'>Bụi bặm</a></li>
<li>&nbsp;</li>
<li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-hip-hop-cho-nam'>Hip hop</a></li>
<li>&nbsp;</li>
<li><a  href='http://dathangquocte.vn/phong-cach-thoi-trang/phong-cach-sang-trong-cho-nam'>Sang trọng</a></li>
<li>&nbsp;</li>

</ul>
</dd>
</dl>


<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_rptDept_ctl02_dlDept" class="section">
<dt>&nbsp;&nbsp;&nbsp;XU HƯỚNG 2013&nbsp;&nbsp;&nbsp;</dt>
<dd>
    
<ul class="items">
			<li><a  href='#'>Rock thập niên 60</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Màu đỏ đậm</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Mũ trẻ bán báo</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Thời trang phượt</a></li>
            <li>&nbsp;</li>
            <li><a  href='#'>Họa tiết động vật</a></li>
            <li>&nbsp;</li>
</ul>
</dd>
</dl>

<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl02_dlDept">
	<dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</dt>
    <dd>
        <ul class="items">
        	<li><img src="http://demandware.edgesuite.net/aana_prd/on/demandware.static/Sites-ScotchSoda-GB-Site/Sites/en_GB/v1376997107180/images/slot/navigation/dropdown-men.jpg">
        </ul>
    </dd>
</dl>



</div>
</div>
</div>
</div>
</div>
</div>
</li>

<li id="floor_3" class="men">
<a href="http://dathangquocte.vn/index.php?route=news/news_category&cat_id=1" id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_lnkFloor" tabindex="3" title="MEN">
<span>Tin nóng hàng ngày</span></a>
<div id="sub_floor_2" class="sub-floor-menus">
<div class="sub-menu-wrapper-left">
<div class="sub-menu-wrapper-right">
<div class="sub-menu-wrapper-bottom">
<div class="sub-menu-wrapper-top">
<div class="sub-menu-wrapper">
<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_rptDept_ctl00_dlDept" class="section">
<dt>TIN NÓNG HÀNG NGÀY</dt>
<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl02_dlDept">
	<dd>
        <ul class="items">
            <li><a href="http://dathangquocte.vn/index.php?route=news/news_category&cat_id=7">TIN HÀNG MỚI</a></li>
            <li><a class="red" href="http://dathangquocte.vn/index.php?route=news/news_category&cat_id=5">TIN GIẢM GIÁ</a></li>
        </ul>
    </dd>
</dl>

<dl id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl00_rptDept_ctl02_dlDept">
	<dd>
    <ul class="items" style="width:380px">
        	<li><img src="http://demandware.edgesuite.net/aana_prd/on/demandware.static/Sites-ScotchSoda-GB-Site/Sites/en_GB/v1376997107180/images/slot/navigation/dropdown-men.jpg">
        </ul>
    </dd>
</dl>

</div>
</div>
</div>
</div>
</div>
</div>
</li>


<li id="floor_4" class="men">
<a target="_blank" href="http://welook.vn/" id="ctl00_ContentNav_ctlMainNav_ctlMainNavContentCached_rptFloor_ctl01_lnkFloor" tabindex="3" title="MEN">
<span>TƯ VẤN THỜI TRANG</span></a>
</li>


</ul>

</div>
</div>


            


</div>


                      </span>
                        
                        <span id="diachimuahang" style="left:-10px; position: fixed; top:120px;">
                        <form method="post" action="">
<div onclick="return showHide();">
<img src="http://dathangquocte.vn/image/diachidathang.gif";></img></div>
</form>



<div id="showHideDiv" style="display:none;"><iframe src="http://dathangquocte.vn/diachimuahang"; height=436px; width=910px;"></iframe></div>
                        </span>


                      <span style=" left: 830px; position: absolute;  top: 90px; ">
                        	<a href="<?php echo $shopping_cart; ?>"><img   src="<?php echo HTTP_SERVER; ?>image/dat-hang.jpg" height="110px" ></a>
                        </span>
                        <span id="cart_item">
                            <?php echo $cart; ?>
                        </span>
                        <?php if ($logo) { ?>
                            <a href="<?php echo $home; ?>" style="text-decoration:none"><img width="130" src="<?php echo $logo; ?>" id="logowesale" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                            
                        <?php } ?>
                        <a href="<?php echo $home; ?>"><img width="250" style="margin:-8px 0px 0px -42px" src="<?php echo HTTP_SERVER; ?>/image/logoweorder-bong.png" id="header_logo"></a>
                        <h1 id="slogan">___  Đặt hàng quốc tế  ___</h1>
                        <div class="top_btn">
                            <div class="topsearch">
                                <form class="" style="width: 37px;" method="get" action="<?php echo $home; ?>" id="searchForm">
                                    <input type="submit" class="btn-search" value="Search" id="searchSubmit">
                                    <input type="hidden" name="route" value="product/search" />
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
                                            <?php
                                        endforeach;
                                    endif;
                                    ?>
                                    <?php if ($categoriesnews): ?>
                                        <?php foreach ($categoriesnews as $category) : ?>
                                            <li><a name="#tab2" href="<?php echo $category['href'] ?>"><?php echo $category['name'] ?></a></li>
                                            <?php
                                        endforeach;
                                    endif;
                                    ?>  
                                </ul>
                            </div>
                            <div class="clear"></div>
                            <ul id="nav-sub">
                                <?php foreach ($categoriesTop2 as $result) { ?>
                                    <li>
                                        <a style="background-image:none;" href="<?php echo $result['href'] ?>"><span class="nav-subTxt"><?php echo $result['name'] ?></span></a>
                                    </li>
                                <?php } ?>
                                <?php foreach ($informations as $result) { ?>
                                    <li>
                                        <a style="background-image:none;" href="<?php echo $result['href'] ?>"><span class="nav-subTxt"><?php echo $result['title'] ?></span></a>
                                    </li>
                                <?php } ?>
                                <li>
                                    <a style="background-image:none;" href="<?php echo $news_brand_href ?>"><span class="nav-subTxt">Các thương hiệu</span></a>
                                </li>
                                <li>
                                    <a style="background-image:none;" href="<?php echo $contact ?>"><span class="nav-subTxt"><?php echo $text_contact ?></span></a>
                                </li>
                            </ul>
                        </div>

<script type="text/javascript">
    $(document).ready(function() {
   
    $(window).on('scroll', function(){
        var bottom_of_window = $(this).scrollTop();
        if(  $(this).scrollTop() > 250 ){
        $(".hideme").stop().animate({ top: '0px' });
        }
			else
			{
			    $(".hideme").stop().animate({ top: '-65px' });
			}
        
    });
    
});

	
	</script>



                    </header>




<style type="text/css">
.hideme
{   position:fixed;
    top:-65px;
    left:0px;
    height:60px;
    background:#333333;
    width:140px;
    border-bottom:5px solid white;
	
}
.hideme a{
text-decoration:none;
color:white;
}
.btnDownload
{

padding-top:7px;
text-align:center;
position: absolute;
left:4px;
top: 10px;
height:90px;
width:124px;
 -webkit-border-radius:4px;-moz-border-radius:4px;
 background:url(http://dathangquocte.vn/image/DAT%20HANG.png); 
 z-index:1000;
font-family: Myriad Pro;
}

#showHideDiv{
margin-top:-30px;
}
</style>


<script type="text/javascript" language="javascript">// <![CDATA[
function showHide() {
    var ele = document.getElementById("showHideDiv");
    if(ele.style.display == "block") {
            ele.style.display = "none";
      }
    else {
        ele.style.display = "block";
    }
}
// ]]></script>


<div class="hideme"><a href="http://dathangquocte.vn/index.php?route=checkout/cart" alt="MUA HANG"><div class="btnDownload"></div></a></div>
                    <div class="clearfix"></div>

                    <div id="notification"></div>


<!-- Google Analytics-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-43280607-1', 'dathangquocte.vn');
  ga('send', 'pageview');

</script>

<style>
div,dl,dt,dd,ul,ol,li,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td{margin:0;padding:0}table{border-collapse:collapse;border-spacing:0}fieldset,img{border:0}address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal}li{list-style:none}caption,th{text-align:left}h2,h3,h4,h5,h6{font-size:100%;font-weight:normal}q:before,q:after{content:''}abbr,acronym{border:0;font-variant:normal}sup{vertical-align:text-top}sub{vertical-align:text-bottom}input,textarea,select{font-family:inherit;font-size:inherit;font-weight:inherit}input,textarea,select{*font-size:100%}legend{color:#000}del,ins{text-decoration:none}a,:focus{outline:none}button::-moz-focus-inner,input[type="reset"]::-moz-focus-inner,input[type="button"]::-moz-focus-inner,input[type="submit"]::-moz-focus-inner,select::-moz-focus-inner{border:none}html,iframe{background:#fff}body{color:#000;font-family:Myriad Pro;font-size:60%}img{border:0}h2,h3,h4,h5,h6{font-weight:bold}h2{font-size:1.2em;margin:1em 0}h3{margin:1em 0}cite{font-style:normal;font-weight:bold}strong{font-weight:bold}em{font-style:italic}ol li{list-style:decimal outside}p{margin:0 0 1em}div.clear{clear:both}div.clear-left{clear:left}div.clear-right{clear:right}.replace{display:block;margin:0;overflow:hidden;padding:0;position:relative}.replace span{display:block;left:0;position:absolute;top:0;z-index:1}body.ipad input[type="text"],body.ipad input[type="password"],body.ipad input[type="textarea"],body.ipad div.site-nav ul#yourBag{float:right;margin:11px 0 0}.ie6 div.site-nav ul#yourBag{margin:11px -100px 0}div.site-nav ul#yourBag li{float:left}div.site-nav ul#yourBag li a.bag-link{border-right:1px solid #c9c9c9;color:#000;font-family:Myriad Pro;font-size:1.1em;padding:0 10px;z-index:11115}div.site-nav ul#yourBag li a.bag-link:hover{color:#666}div.site-nav ul#yourBag li a.mini-bag-title{border-right:none;display:block;float:left;padding:0 0 0 10px;width:auto}div.site-nav ul#yourBag li a.mini-bag-title:hover{color:#666}div.site-nav ul#yourBag li a.mini-bag-title span.total{margin:2px 0 0 4px}div.site-nav ul#yourBag li a.mini-bag-title span.quantity-wrap{color:#666}div.site-nav ul#yourBag li a.account-link,div.site-nav ul#yourBag li a.saved-items{position:relative}div.site-header .search{height:34px;left:309px;position:absolute;top:23px;z-index:1}div.site-header .search label,div.no-results .search label{font-size:1.2em;height:15px;left:6px;overflow:hidden;position:absolute;top:10px;width:310px;z-index:2}div.site-header .search input.search-box,div.no-results .search input.search-box{border:1px solid #999;border-width:1px 0 1px 1px;color:#000;float:left;font-size:1.2em;height:22px;line-height:22px;padding:5px;position:relative;vertical-align:top;width:310px}div.site-header .search input.add-border,div.no-results .search input.add-border{border:1px solid #000;border-width:1px 0 1px 1px;outline:none}div.site-header .search a.clear-search,div.no-results .search a.clear-search{background:url(/asos-web/images/core/clear-search-x.gif) no-repeat 0 0;color:#fff;font-size:1.1em;height:16px;left:299px;padding-left:5px;position:absolute;top:9px;width:16px;z-index:5}div.site-header .search a.go,div.no-results .search a.go{border:1px solid #999;border-width:1px 1px 1px 0;color:#000;display:block;float:right;font-size:1.3em;font-weight:bold;height:32px;left:321px;line-height:34px;overflow:hidden;position:absolute;text-align:center;text-transform:uppercase;vertical-align:middle;width:34px}div.site-header .search a.go:hover,div.no-results .search a.go:hover{cursor:pointer;text-decoration:underline}div.site-header .search a.go.add-border,div.no-results .search a.go.add-border{border:1px solid #000;border-width:1px 1px 1px 0}div.site-header .search a.go span,div.no-results .search a.go span{background:url(/asos-web/images/buttons/search-magnify.png) no-repeat 0 0;display:block;height:32px;width:34px}div.site-header .search a.go:hover span,div.no-results .search a.go:hover span{background-position:0 -32px}div.site-header .search a.go:focus span,div.no-results .search a.go:focus span{background-position:0 -32px}div.search-suggestions{background:#fff;border:1px solid #a9a9a9;-moz-box-shadow:2px 2px 3px rgba(102,102,102,.5);-webkit-box-shadow:2px 2px 3px rgba(102,102,102,.5);box-shadow:2px 2px 3px rgba(102,102,102,.5);display:none;-ms-filter:"progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#bababa')";filter:progid:DXImageTransform.Microsoft.Shadow(Strength=3,Direction=135,Color='#bababa');left:0;padding:5px 0;position:absolute;top:33px;width:320px}div.recent-searches-header{color:#666}div.recent-searches-header p{border-bottom:1px dotted #a9a9a9;margin:0 10px 6px;padding:5px 0 8px;position:relative;text-transform:uppercase}div.recent-searches-header span.clear-recent-searches{cursor:pointer;left:287px;position:absolute;top:10px}div.suggestions-results li span.suggestion{color:#000;cursor:pointer;display:block;font-size:1.2em;margin:0 5px;padding:5px;position:relative}.ie6 div.suggestions-results li span.suggestion{height:12px}div.suggestions-results li span.suggestion:hover{text-decoration:none}div.suggestions-results li.selected span.suggestion{background:#e8e8e8;color:#000;text-decoration:none}div.suggestions-results li span.suggestion span.result-quantity{color:#999;position:absolute;right:10px}div.content-top{border-bottom:1px solid #e3e3e3;color:#000;margin:10px 0;overflow:hidden;padding-bottom:8px}div.content-top a{color:#000;text-decoration:none}div.content-top a:hover{text-decoration:underline}div.content-top a.back{display:block;float:right;font-size:1.1em}div.content-top div.breadcrumbs{font-size:1.1em}div.content-top div.breadcrumbs span{color:#666}div.content-top div.breadcrumbs span.breadcrumb-arrow{color:#999;font-size:1.2em;line-height:1em;padding:0 4px}div.map-popup{width:820px}div.map-popup .map-canvas{border-top:3px solid gray;height:600px;margin:10px;width:800px}div.map-popup .selected-address{clear:left;margin:10px 0}div.map-popup .store-name{font-size:1em;font-weight:bold;padding:0 0 5px}div.map-popup .store-details{float:left;padding:0 10px 0 0;width:90px}div.map-popup .services{clear:left;float:left;padding:5px 0 0}div.map-popup .store-distance{background:#f4f4f4;float:left;padding:2px 0;text-align:right;width:65px}div.map-popup .store-list-name{clear:right;font-size:1.2em;font-weight:bold;padding:0 0 5px}div.map-popup .store-info{float:left;margin:0 0 0 20px}div.map-popup .address-item{border-bottom:dashed 1px gray;clear:left;float:left;margin:0 0 20px 30px;padding:0 0 5px;width:740px}div.map-popup .view-type{background:#fff;border:2px solid;cursor:pointer;float:right;font-size:1.2em;margin:1px;padding:0 4px;text-align:center;width:60px}div.map-popup .view-type-selected{background:#000;border-color:#000;color:#fff}div.map-popup .search-container{background:#fff;height:130px;margin:0 5px 5px 10px;padding:10px 0 0;width:320px}div.map-popup .search-container-header{background:url(/asos-web/images/deliver-to-store/orange-bullet.gif) no-repeat scroll 0 50% transparent;font-size:2em;font-weight:bold;margin:0 0 0 15px;padding:10px 0 10px 25px}div.map-popup .search-controls{font-size:1.2em;margin:0 0 0 40px}div.map-popup .list-container{display:inline-block;padding:0 10px;width:800px}div.map-popup .selection-container{font-size:1.2em;height:520px;margin:10px;width:800px}div.map-popup .selection-container .left-panel{background:#f4f4f4;float:left;padding:10px;width:150px}div.map-popup .selection-container .left-panel .header{border-bottom:1px solid #c4c4c4;font-weight:bold;height:10px;margin:0 0 10px;padding:0 0 10px}div.map-popup .selection-container .right-panel{float:right;position:relative;width:600px}div.map-popup .selection-container .right-panel .header{border:none;font-size:1.8em;font-weight:bold;height:10px;margin:0 0 20px}div.map-popup .header{border-bottom:1px solid #c4c4c4;height:75px;margin:0 0 10px}div.map-popup img.collectplus-logo{float:left;padding:10px}div.map-popup img.asos-logo{float:right;height:50px;padding:10px;position:relative;width:104px;z-index:2}div.map-popup input.phone{height:18px;margin:0 0 20px 4px;width:80px}div.map-popup input.confirmation{float:right}div.map-popup input.postcode{background:#f0e7b4;margin:0 5px;text-transform:uppercase;width:80px}div.map-popup .orange-button{background:#ee4a00;color:#fff;cursor:pointer;text-align:center;width:58px}div.map-popup .table-header{margin:0 0 5px}div.map-popup .store-key-container{height:30px}div.map-popup .store-key-container .delivery-options{float:right;margin:0 5px 0 0;width:300px}div.map-popup .store-key-container .delivery-options img{float:left}div.map-popup .store-key-container .standard-delivery{float:left}div.map-popup .store-key-container .next-day-delivery{float:left}div.map-popup .store-key-container .delivery-option{float:left;margin:6px 20px 0 5px}div.map-popup .lightbox-close{cursor:pointer;height:12px;position:absolute;right:5px;top:2px;width:12px;z-index:3}div.map-popup .store-details .orange-button{width:40px}div.map-popup .error-message{color:red;margin:10px 0 0}div.map-popup .contact-number-container{height:50px}div.map-popup .contact-number-input{float:left;margin:0 5px 0 0}div.map-popup .contact-number-error{color:red;float:left;margin:2px 0 0;visibility:hidden}div.info-box{height:200px;padding:5px 0 10px 10px;width:254px}div.info-box .store-name{font-size:1.6em;font-weight:bold;padding:5px 0;width:234px}div.info-box .store-info{border-top:dashed 1px gray;float:none;margin:0;padding:5px 0 0}div.info-box .store-address{float:left;width:100px}div.info-box .store-times{border-left:dashed 1px gray;float:right;padding:0 0 0 5px;width:100px}div.info-box .close-button{cursor:pointer;height:15px;padding:5px 0 0;position:absolute;right:10px;top:5px;width:15px}div.info-box .info-box-footer{bottom:20px;position:absolute;right:5px;width:230px}div.info-box .select-store{float:right;margin:0 18px 0 0;padding:10px 0 0}div.info-box .services{float:left}div.site-footer{border-top:4px solid #000;clear:both;color:#666;position:absolute;width:974px}div.site-footer a{color:#666;cursor:pointer;text-decoration:none}div.site-footer a:hover{text-decoration:underline}div.site-footer div{overflow:hidden}div.site-footer div.newsletters{border-bottom:1px solid #e6e6e6;padding:16px 0}div.site-footer div.newsletter-sign-up{margin:0 auto;width:645px}div.site-footer div.newsletter-sign-up a,div.site-footer div.newsletter-sign-up input,div.site-footer div.newsletter-sign-up label{float:left}div.site-footer div.newsletter-sign-up label a{font-size:1.4em;line-height:2.2em}div.site-footer div.newsletter-sign-up a.button.women{margin:3px 7px 0 0;min-width:49px}div.site-footer div.newsletter-sign-up a.button.men{margin:3px 0 0;min-width:49px}div.site-footer div.newsletter-sign-up input.email-address{border:1px solid #c0c1c1;color:#666;font-size:1.1em;height:16px;margin:0 10px;padding:5px;width:295px}div.site-footer div.newsletter-sign-up input:hover{border:1px solid #999}div.site-footer div.newsletter-thank-you{text-align:center}div.site-footer div.newsletter-thank-you span{font-family:Myriad Pro;font-size:1.1em;text-align:center}div.site-footer div.footer-wrapper{background:#f9f9f9;margin:0 0 20px;padding:0 15px 0 15px}div.site-footer div.footer-links{clear:both;overflow:auto;padding:15px 0 30px}div.site-footer div.footer-links ul{float:left;width:188px}div.site-footer div.footer-links ul li{padding:0 20px 0 0}div.site-footer div.footer-links ul li h2{color:#202020;font-family:Myriad Pro;font-size:1.1em;font-weight:normal;margin:0 0 5px;text-transform:uppercase}div.site-footer div.footer-links ul li a{color:#7b7b7b;font-size:1.1em;line-height:1.6em}div.site-footer div div.cards{background:url(/asos-web/images/core/footer-card-images.png) no-repeat 0 0;display:block;float:left;height:22px;margin:2px 0 0;text-indent:-9999px;width:477px}div.site-footer div div.site-selector-list{float:right;margin:6px 0 0}div.site-footer div div.site-selector-list h3{color:#202020;float:left;font-size:1.3em;font-weight:normal;margin:0}div.site-footer div div.site-selector-list ul{float:left}div.site-footer div div.site-selector-list ul li{float:left}div.site-footer div div.site-selector-list ul li a{border-width:0;display:block;height:12px;margin:2px 0 0 10px;text-indent:-9999px;width:17px}div.site-footer div div.site-selector-list ul li a span{background:url(/asos-web/images/core/site-flags.png) no-repeat;-moz-box-shadow:1px 1px 0 #ccc;-webkit-box-shadow:1px 1px 0 #ccc;box-shadow:1px 1px 0 #ccc;display:block;-ms-filter:"progid:DXImageTransform.Microsoft.Shadow(Strength=1, Direction=135, Color='#cccccc')";filter:progid:DXImageTransform.Microsoft.Shadow(Strength=1,Direction=135,Color='#cccccc');height:11px;position:relative;top:-12px;width:16px}div.site-footer div div.site-selector-list ul li a.en-GB span{background-position:0 0}div.site-footer div div.site-selector-list ul li a.en-US span{background-position:0 -11px}div.site-footer div div.site-selector-list ul li a.fr-FR span{background-position:0 -22px}div.site-footer div div.site-selector-list ul li a.de-DE span{background-position:0 -33px}div.site-footer div div.site-selector-list ul li a.it-IT span{background-position:0 -44px}div.site-footer div div.site-selector-list ul li a.es-ES span{background-position:0 -55px}div.site-footer div div.site-selector-list ul li a.en-AU span{background-position:0 -66px}div.site-footer div div.site-selector-list ul li a.ru-RU span{background-position:0 -77px}div.site-footer div.disclaimer{border-top:1px solid #e6e6e6;clear:both;margin:10px 0 0;position:relative;text-align:center}div.site-footer div.disclaimer div a{color:#303030;font-family:Myriad Pro;font-size:1.1em}div.site-footer div.disclaimer div a:hover{color:#303030;text-decoration:underline}div.site-footer div.disclaimer div p{color:#6f6f6f}div.site-footer div.disclaimer div.links{display:inline-block;margin:0 auto;padding:14px 0;text-align:center;width:708px}div.site-footer div.disclaimer div.links ul{overflow:hidden;text-align:center}div.site-footer div.disclaimer div.links ul li{border-left:1px solid #000;display:inline;padding:0 5px}div.site-footer div.disclaimer div.links ul li.first{border:none;padding:0 5px 0 0}div.site-footer div.disclaimer div.links p{clear:left;margin:5px 0 0}div.site-footer div.disclaimer div.legal{float:right;padding:14px 0;position:absolute;right:0;text-align:right;top:0}div.site-footer div.disclaimer div.legal p{margin:5px 0 0}div.site-footer div.disclaimer div.legal p.copyright{color:#303030;font-family:Myriad Pro;font-size:1.1em;margin:0}div.site-footer div.secured-logo{background:url(/asos-web/images/core/comodo-lock.gif) no-repeat;display:block;float:left;height:36px;left:0;margin:-18px 0 0;position:absolute;top:50%;width:80px}div.site-content a.tab-action{background:#000;color:#fff;display:block;letter-spacing:.2em;padding:4px 5px;text-align:right;text-decoration:none;text-transform:uppercase;width:220px}div.site-content a.tab-action:hover,div.site-content a.tab-action.active{background:#797979;text-decoration:none}div.site-content a.button.unsubscribe{min-width:200px}h2.styled{border:none;color:#333;font-size:.9em;letter-spacing:.25em;margin:0 auto 30px;text-align:center;text-transform:uppercase;width:170px}.creative-wrapper{position:relative}.creative-category{left:0;position:absolute;top:0}.creative-html{left:0;position:absolute;top:0}.creative-html a:focus,.creative-category a:focus{outline:none}.creative-html a:hover,.creative-category a:hover{outline:none}#creativeContent{left:0;position:absolute;top:0}div.alert{background:#fff7f7 url(/asos-web/images/core/alert.gif) no-repeat right -20px;border:1px solid #fcc;color:#c33;margin:0 0 2em;padding:5px}div.alert a{color:#c33}div.alert a:hover{color:#933}.bottom{bottom:-1px}.corner{background:url(/asos-web/images/core/corner.gif)}.corner{height:14px;position:absolute;width:14px;z-index:100}.site-content>.corner{background:url(/asos-web/images/core/corner.png)}.site-content>.bottom{bottom:0}.top{top:-28px}.right{right:0}.left{left:0}.top.left,div.tl{background-position:left top}.top.right,div.tr{background-position:right top}.bottom.left,div.bl{background-position:left bottom}.bottom.right,div.br{background-position:right bottom}div.site-nav{font-family:Myriad Pro;font-size:1.1em;height:38px;left:0;position:absolute;width:974px;z-index:98}div.site-nav ul{list-style-type:none}div.site-nav li{list-style-type:none}div.site-nav a{text-decoration:none}div#side-nav{color:#000;float:left;font-family:Myriad Pro;font-size:1.15em;padding:10px 0 0;position:relative;width:180px}div#side-nav h1{border-bottom:1px solid #000;font-family:Myriad Pro;font-size:1em;font-weight:bold;line-height:1em;margin:0 0 10px;padding:0 0 10px;text-transform:uppercase}div#side-nav p.precis{font-family:Myriad Pro;line-height:1.2em;margin:0 0 10px}div#side-nav p.precis a{color:#000;text-decoration:none}div#side-nav p.precis a:hover{color:#969696}div#side-nav p.cat-title{border-top:1px solid #000;font-weight:bold;margin:0 0 10px;padding:10px 0 0}div#side-nav ul{padding-bottom:15px}div#side-nav ul li{display:block;min-height:17px}div#side-nav ul li a{color:#000;height:auto;line-height:1.8em}div#side-nav ul li a:hover{color:#969696;text-decoration:none}div#side-nav ul li a.red{color:#b0171f}div#side-nav ul li a.red:hover{color:#c48189}div.site-nav ul.floors li{float:left;top:0}div.site-nav ul.floors li a{color:#000;display:block;font-family:Myriad Pro;font-size:1.7em;line-height:1.7em;padding:0 14px;position:relative;text-align:center;text-transform:uppercase;z-index:1}.ie6 div.site-nav ul.floors li a{display:inline-block}div.site-nav ul.floors li:last-child a{background:none}div.site-nav ul.floors li a.selected span{border-bottom:1px solid #000}div.site-nav ul.floors li a:hover,div.site-nav ul.floors li a.active{background:#000;color:#fff;left:-1px;position:relative}div.site-nav ul.floors li a:hover span,div.site-nav ul.floors li a span:hover,div.site-nav ul.floors li a.active span,div.site-nav ul.floors li a.selected:hover span{border-bottom:1px solid #fff}div.site-nav ul.floors li.home a{background:none;height:38px;padding:0;width:28px}div.site-nav ul.floors li.home a span{background:url(/asos-web/images/nav/nav-bg.png) no-repeat 0 -115px;height:38px;width:28px}div.site-nav ul.floors li.home a.selected span{background-position:0 -39px}div.site-nav ul.floors li.home a:hover,div.site-nav ul.floors li.home a.active{cursor:pointer;left:0}div.site-nav ul.floors li.home a:hover span{background-position:0 -77px}div.site-nav ul.floors li:hover div.sub-floor-menus dl dd ul.items{margin:0 0 0 1px;width:115px}div.site-nav .menu ul li div.sub-floor-menus{width:837px; left:-9999px;margin:0 0 0 -1px;overflow:hidden;padding:0;position:absolute;z-index:101}div.sub-floor-menus{display:none}div.site-nav .css-menu ul li:hover div.sub-floor-menus{display:inline;left:auto;padding:0;position:absolute}div.site-nav .menu ul li:hover div.sub-floor-menus{display:inline;left:auto;padding:0;position:absolute}div.site-nav .menu div.sub-menu-wrapper-top{border-top:5px solid #000}div.site-nav .menu div.sub-menu-wrapper{background:#fff;overflow:hidden; border:solid 1px;}.ie7 div.site-nav .menu ul :hover div.sub-floor-menus{display:none}div.site-nav div.sub-floor-menus{background:#fff;border-bottom:1px solid #999;border-right:1px solid #999}div.site-nav li>div.sub-floor-menus{background:none;border:none}div.site-nav li>div.sub-floor-menus{border-right:1px solid transparent}div.site-nav li>div.sub-floor-menus div.sub-menu-wrapper-right{background:url(/asos-web/images/nav/sub-nav-vertical-border.png) no-repeat bottom right;padding:0 7px 0 0}div.site-nav li>div.sub-floor-menus div.sub-menu-wrapper-bottom{background:url(/asos-web/images/nav/sub-nav-horizontal-border.png) no-repeat bottom left;padding:0 0 7px}div.sub-floor-menus div.menu:first-child{margin-left:0}div.sub-floor-menus div.menu:first-child div.sub-menu-wrapper-left{background:none;margin:0}div.sub-floor-menus div.menu:first-child div.sub-menu-wrapper-right{padding:0 14px 0 0}div.sub-floor-menus div.menu:first-child div.sub-menu-wrapper{padding:0 0 0 10px}div.sub-floor-menus dl{border-left:1px solid #999;display:inline;float:left;margin-bottom:-10000px;overflow:hidden;padding-bottom:10000px}div.sub-floor-menus dl:first-child{border:none}div.sub-floor-menus dl dt{border-bottom:1px dashed #cacaca;color:#202020;font-family:Myriad Pro;font-size:1.05em;font-weight:normal;letter-spacing:.5px;line-height:2em;padding-left:10px;padding-right:0;width:auto}div.sub-floor-menus dl ul.items{display:inline;float:left;padding:6px 0 10px 10px;width:145px}div.sub-floor-menus dl ul.items li{display:block;float:none;line-height:1.4em;list-style-position:outside;min-height:15px}div.sub-floor-menus dl.featured dt{border:none}div.sub-floor-menus dl.featured ul.items{padding:0}div.sub-floor-menus dl.featured ul.items li{border-top:1px dashed #cacaca;padding:6px}div.site-nav ul.floors li div.sub-floor-menus a{background:none;border:none;display:inline;font-family:Myriad Pro;font-size:1em;font-weight:normal;height:auto;line-height:1.2em;padding:0;text-transform:none;white-space:nowrap}div.site-nav ul.floors li div.sub-floor-menus a:hover{background:#000;color:#fff;margin:0 0 0 -1px;padding:0 1px;text-decoration:none}div.site-nav ul.floors li div.sub-floor-menus a span{display:none}div.site-nav div.sub-floor-menus dl ul.items li a.sale{color:#b0171f}div.site-nav div.sub-floor-menus dl ul.items li a.sale:hover{background:#b0171f;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.clearance{color:#36f}div.site-nav div.sub-floor-menus dl ul.items li a.clearance:hover{background:#36f;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.new{color:#d6b500}div.site-nav div.sub-floor-menus dl ul.items li a.new:hover{background:#d6b500;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.branddirectory{color:#000;font-weight:bold}div.site-nav div.sub-floor-menus dl ul.items li a.branddirectory:hover{background:#000;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.red{color:#b0171f}div.site-nav div.sub-floor-menus dl ul.items li a.red:hover{background:#b0171f;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.blue{color:#36f}div.site-nav div.sub-floor-menus dl ul.items li a.blue:hover{background:#36f;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.black{color:#000}div.site-nav div.sub-floor-menus dl ul.items li a.black:hover{background:#000;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.pink{color:#c48189}div.site-nav div.sub-floor-menus dl ul.items li a.pink:hover{background:#c48189;color:#fff}div.site-nav div.sub-floor-menus dl ul.items li a.yellow{color:#fdd017}div.site-nav div.sub-floor-menus dl ul.items li a.yellow:hover{background:#fdd017;color:#fff}div.creative-panel div#socialSharing{display:none}div.creative-panel div#socialSharing div.facebook-buttons .fb_iframe_widget span iframe{background-color:transparent}.hide{display:none}.js-hide{display:none!important}.mvt-hide{display:none}.cookie-law{position:fixed;background-color:#000;bottom:3%;right:3%;z-index:2001;padding:17px 17px;width:286px;border-radius:10px;-moz-border-radius:10px;-webkit-border-radius:10px;color:#fff}.cookie-acceptance{font-family:Myriad Pro;font-style:normal;font-size:11pt;float:left;font-weight:bold;background-color:#000;color:#fff;padding:4px 5px;border:solid 1px #fff;width:94px}.cookie-info{font-family:Myriad Pro;float:right;font-size:10pt;font-style:normal;padding-top:9px;color:#fff}.cookie-title{font-family:Myriad Pro;font-size:11pt;font-weight:bold;font-style:normal}.cookie-textmessage{font-family:Myriad Pro;font-size:10pt;font-style:normal;padding-bottom:18px}#addToBasketAlert{color:#000;display:none;font-size:1.2em;left:50%;line-height:15px;margin-left:-177px;margin-top:-100px;position:fixed;top:50%;width:355px;z-index:1001}#addToBasketAlert div.ftr{background:url(/asos-web/images/core/add-to-basket-alert-background.png) left bottom no-repeat;height:13px}#addToBasketAlert div.cnt{background:url(/asos-web/images/core/add-to-basket-alert-background.png) left top no-repeat;padding:10px 15px 7px 10px;position:relative}#addToBasketAlert .title{font-weight:bold}#addToBasketAlert .message{font-weight:bold;padding:15px 0 10px}#addToBasketAlert .navBlock{border-top:1px solid #000}#addToBasketAlert a{color:#000;text-decoration:underline}#addToBasketAlert_visibleType_loading{text-align:center}#miniBasket .mini-bag-wrapper{display:none;font-family:Myriad Pro;font-size:.9em;overflow:hidden;position:absolute;right:-5px;text-transform:none;top:0;width:291px;z-index:9999}.ie7 #miniBasket .mini-bag-wrapper{right:-7px}.ie6 #miniBasket .mini-bag-wrapper{background:#fff;border:1px solid #666;right:0;top:30px;width:284px}#miniBasket .mini-bag-wrapper-top{overflow:hidden}#miniBasket .mini-bag-wrapper-bottom{overflow:hidden;padding:0 0 19px}#miniBasket .mini-bag-wrapper-right{margin:31px 0 0;overflow:hidden;text-align:left;width:291px}.ie6 #miniBasket .mini-bag-wrapper-right{margin:23px 0 0}#miniBasket .advert-space{margin:31px 0 0;overflow:hidden;padding:0 0 32px;text-align:left;width:291px}
</style>