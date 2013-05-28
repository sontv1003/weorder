<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="columns clearfix" style="min-height: 400px;"><?php echo $content_top; ?>
  <div class="pathway-items">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $description; ?>
  <div class="clear"></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <br/>
  <br/>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>