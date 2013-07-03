<?php echo $header; ?><?php echo $column_left; ?>
<div class="l-pageWrapper l-hasSidebarAndAside l-staticpage">
    <div class="press" id="cms-page">
	<div class="wrapper">
<div class="content"><?php // echo $content_top; ?>
    <img src="<?php echo HTTP_SERVER ?>/image/bg-press.jpg" />
    <!--<div class="press"></div>-->
    <h1><?php echo $heading_title ?></h1>
    <div class="shadow"></div>
    
    <div class="news-list">
<?php foreach ($news as $news_item) { ?>
        <div class="news">
          <div class="thumb">
            <div class="border"> <a href="bung-no-giam-gia-cac-san-pham-tai-zalora/">
            <img width="220" height="153" src="<?php echo $news_item['thumb']; ?>" title="<?php echo $news_item['name']; ?>" alt="<?php echo $news_item['name']; ?>"></a> </div>
            <div class="tl corner"></div>
            <div class="br corner"></div>
          </div>
          <!--.thumb-->
          <div class="info fr" style="width: 505px; height: 190px;">
            <h2><a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['name']; ?></a></h2>
            <p class="meta">EVA <span class="date">- <?php echo date('d/m/Y',strtotime($news_item['date_available'])) ?></span></p>
            <p style="" class="excerpt"> 
                <img width="39" height="33" alt="quote" src="<?php echo HTTP_SERVER?>/image/quote-open.png" class="quote open">
                <?php echo utf8_substr($news_item['short_description'], 0, 300); ?>
                <img width="39" height="33" alt="quote" src="<?php echo HTTP_SERVER?>/image/quote-close.png" class="quote close"> 
            </p>
          </div>
          <div class="cls"></div>
          <!--.info-->
          <div class="more"> <a href="<?php echo $news_item['href']; ?>">Xem Thêm</a> </div>
          <!--.more--> 
        </div>
        <!--.news-->
        
<?php } ?>
    </div>
  <!--<div class="cls"></div>-->
  <div class="pagination"><?php echo $pagination; ?></div>
  
  <?php if (!$categories && !$news) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
            </div> <!-- end content -->
            <div class="sidebar">
                <h3>Thông Tin Liên Hệ</h3>
                <p>Nếu quý khách có những câu hỏi liên quan đến báo chí và truyền thông,vui lòng liên lạc với chúng tôi tại địa chỉ e-mail:</p>
                <div class="email"><a href="mailto:customer@zalora.vn">customer@zalora.vn</a></div>
                <p> Tầng 2, COPAC Centre<br>
                        Số 12 đường Tôn Đản, Phường 13, Quận 4<br>
                        TP. Hồ Chí Minh<br>
                        Việt Nam 
                </p>
            </div> <!-- end sidebar -->
        </div> <!-- end wrapper -->
    </div> <!-- end press -->
</div>
<div class="clearfix"></div>
<?php echo $footer; ?>