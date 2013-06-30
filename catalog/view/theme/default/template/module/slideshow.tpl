<div class="slideshow" <?php echo (!empty($banners_image_small))? 'style="width: 75%; float: left"' : '';?>>
  <div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>

<?php if(!empty($banners_image_small)){ ?>
<div class="fr" width="21%">
    <?php foreach ($banners_image_small as $banner) { ?>
    <div class="banner_small">
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    </div>
    <?php } ?>
</div>
<div class="clear"></div>
<?php } ?>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#slideshow<?php echo $module; ?>').nivoSlider({
            directionNav: false,
            directionNavHide: true,
            controlNav: false
        });
});
--></script>