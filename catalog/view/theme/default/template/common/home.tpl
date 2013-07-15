<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="promotion">
    <img width="100%" src="<?php echo HTTP_SERVER; ?>/image/quy_trinh_mua_hang.jpg">
</div>


<div id="content"><?php echo $content_top; ?>

    <div class="clear"></div>

    <div id="tmslider2">
        <ul>
            <li class="slide1">
                <a href="<?php echo $category_man_href; ?>"><img alt="" src="<?php echo HTTP_SERVER ?>/image/slide_05.jpg"></a>
            </li>
            <li class="slide2">
                <a href="<?php echo $category_woman_href; ?>"><img alt="" src="<?php echo HTTP_SERVER ?>/image/slide_06.jpg"></a>
            </li>
        </ul>
    </div>

    <div id="tmnivoslider2">
        <a href="#"><img alt="" src="<?php echo HTTP_SERVER ?>/image/slide_09.jpg"></a>

    </div>

    <div id="tmslider2">
        <ul>
            <li class="slide3">
                <a href="#"><img alt="" src="<?php echo HTTP_SERVER ?>/image/slide_07.jpg"></a>
            </li>
            <li class="slide4">
                <a href="#"><img alt="" src="<?php echo HTTP_SERVER ?>/image/slide_08.jpg"></a>
            </li>
        </ul>
    </div>    
    <h1 style="display: none;"><?php echo $heading_title; ?></h1>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>