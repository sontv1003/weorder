<?php echo $header; ?><?php echo $column_right; ?>
<div class="columns clearfix">
    <div class="l-sidebar">
        <?php echo $column_left; ?>
    </div>
    <div class="l-main">
        <?php echo $content_top; ?>
        <div class="pathway-items" style="margin-bottom: 20px;">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
        </div>

        <h2><?php echo $heading_title; ?></h2>
        <div style="margin-bottom: 10px;	color: gray; font-size: 11px;"><?php echo $text_post_on; ?> <?php echo $date_added; ?> - <?php echo $text_viewed; ?> <?php echo $viewed; ?></div>
        <div style="margin-top: 15px; margin-bottom: 20px; font-weight: bold;"><?php echo $short_description; ?></div>
        <?php echo $description; ?>

        <?php if ($tags) { ?>
            <div class="tags"><b><?php echo $text_tags; ?></b>
                <?php foreach ($tags as $tag) { ?>
                    <a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>,
                <?php } ?>
            </div>
        <?php } ?> 

        <div class="share" style="margin-top: 30px;"><!-- AddThis Button BEGIN -->
            <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script> 
        </div><br />  

        <?php if ($news) { ?>
            <div class="news_relate_title"><?php echo $tab_related; ?></div>
            <div class="news_relate"><ul>
                    <?php foreach ($news as $related_news) { ?>
                        <li style="padding: 2px;"><a href="<?php echo $related_news['href']; ?>"><?php echo $related_news['name']; ?></a> <span style="color: gray; font-size: 11px;">(<?php echo $related_news['date_added']; ?>)</span></li>
                    <?php } ?>
                </ul>
            </div>
        <?php } ?>

        <?php if ($other_news) { ?>
            <div class="news_relate_title"><?php echo $tab_others; ?></div>
            <div class="news_relate"><ul>
                    <?php foreach ($other_news as $other_news_item) { ?>
                        <li style="padding: 2px;"><a href="<?php echo $other_news_item['href']; ?>"><?php echo $other_news_item['name']; ?></a> <span style="color: gray; font-size: 11px;">(<?php echo $other_news_item['date_added']; ?>)</span></li>
                    <?php } ?>
                </ul></div>
        <?php } ?>
        <div class="box_facebook_comment">
            <div id="fb-root"></div>
            <script>(function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id))
                        return;
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=542409615782070";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>

            <fb:comments href="<?php echo $current_url; ?>" width="780" num_posts="10"></fb:comments>
        </div>

        <?php echo $content_bottom; ?></div>
</div>
<script type="text/javascript"><!--
    $('.fancybox').fancybox({cyclic: true});
    //--></script>
<?php echo $footer; ?>