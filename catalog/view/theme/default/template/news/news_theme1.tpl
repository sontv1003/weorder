<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="hot_news">
    <div style="float: left;"><?php echo $content_top; ?></div>
    <?php echo $column_right; ?>
    <?php foreach ($news as $news_item) { ?>
        <div id="news_content" style="position: relative;">
            <div class="date_block">
                <span class="date"><?php echo date('d/m', strtotime($news_item['date_available'])) ?></span>
                <span><?php echo date('Y', strtotime($news_item['date_available'])) ?></span>
            </div>
            <div style="height: 170px; width: 100%; z-index: -1; float: left;"></div> 
            <div class="brand bt_border">
                <?php if (!empty($news_item['thumb_manufacture'])) { ?>
                    <img src="<?php echo $news_item['thumb_manufacture'] ?>" />
                <?php } ?>
                <span id="gioithieuth"><?php echo utf8_substr($news_item['short_description'], 0, 150); ?></span>
                <ul>
                    <?php if ($news_item['thumb']) { ?>
                        <li id="anhtin"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" title="<?php echo $news_item['name']; ?>" alt="<?php echo $news_item['name']; ?>" <?php echo $news_item['width']; ?> <?php echo $news_item['height']; ?> /></a></li>
                    <?php } ?>
                    <a href="<?php echo $news_item['href']; ?>"><button class="float-l2" type="submit" name="newsletter[gender]" value="female">Xem chi tiết</button></a>
                    <li><a href="<?php echo $news_item['href']; ?>"><span id="tinthoitrang"><?php echo $news_item['name']; ?></span></a></li>
                </ul>
            </div>
            <div id="ngan"><img src="<?php echo HTTP_SERVER ?>/image/vien.jpg" height="1px" width="950px"></div>

            <a class="shop_now" href="#">
                <img src="<?php echo HTTP_SERVER ?>/image/shop-now.gif" />
            </a>

            <a class="like_on_face" href="javascript:void(0)">
                <img src="<?php echo HTTP_SERVER ?>/image/face.png" style="width:110px;">
            </a>
            <a class="share_on_face" href="javascript:void(0)" onclick="fb_like('<?php echo $news_item['href']; ?>', '<?php echo $this->db->escape($news_item['name']); ?>', '<?php echo $this->db->escape(utf8_substr($news_item['short_description'], 0, 150)); ?>', '<?php echo $news_item['thumb']; ?>')">
                <img src="<?php echo HTTP_SERVER ?>/image/chiase.jpg" style="width:112px;;">
            </a>
        </div>
    <?php } ?>

    <div class="cls"></div>
    <div class="pagination"><?php echo $pagination; ?></div>

    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
<script>
    function fb_like(url, title, summary, image) {
        var x = screen.width / 2 - 650 / 2;
        var y = screen.height / 2 - 436 / 2;
        var string = 'http://www.facebook.com/sharer.php?s=100&p[title]=' + encodeURIComponent(title) + '&p[summary]=' + encodeURIComponent(summary) + '&p[url]=' + encodeURIComponent(url) + '&p[images][0]=' + encodeURIComponent(image);
        window.open(string, 'sharer', 'toolbar=0,status=0,width=650,height=436,left=' + x + ',top=' + y);
        return false;
    }
</script>