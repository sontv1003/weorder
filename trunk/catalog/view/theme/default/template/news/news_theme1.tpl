<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="hot_news">
  <div style="float: left;"><?php echo $content_top; ?></div>
  <?php echo $column_right; ?>
  <?php foreach ($news as $news_item) { ?>
        <div id="news_content" style="position: relative;">
              <div class="date_block">
              <span class="date"><?php echo date('d/m',strtotime($news_item['date_available'])) ?></span>
              <span><?php echo date('Y',strtotime($news_item['date_available'])) ?></span>
              </div>
              <div style="height: 170px; width: 100%; z-index: -1; float: left;"></div> 
              <div class="brand bt_border">
                      <?php if(!empty($news_item['thumb_manufacture'])) { ?>
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
                      <object width="120" height="30" id="shop">
                        <embed wmode="transparent" width="120" height="30" align="top" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high" src="<?php echo HTTP_SERVER ?>/image/shopnow.swf" style="margin:10px 35px 10px 30px">
                        </object>
                      <span>From Zara.com</span>
              </a>
              <a class="like_on_face" href="#"><img src="<?php echo HTTP_SERVER ?>/image/face.png" style="width:110px; margin:-5px 0px 0px -5px "></a>
              <a class="like_on_face" href="#"><img src="<?php echo HTTP_SERVER ?>/image/chiase.jpg" style="width:112px; margin:-5px 0px 0px -227px"></a>
      </div>
  <?php } ?>

  <div class="cls"></div>
  <div class="pagination"><?php echo $pagination; ?></div>
  
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>