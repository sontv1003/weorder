<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="columns clearfix"><?php echo $content_top; ?>
    <div class="pathway-items">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <h1><?php echo $heading_title; ?></h1><br />
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="contact_frm">
        <div style="width: 35%; border: 1px solid #ccc; padding: 20px; border-radius: 5px;" class="fr">
            <h2><?php echo $text_location; ?></h2>
            <div class="contact-info">
                <div class="content">
                    <div class="left"><span><?php echo $text_address; ?></span><br /><br />
                        <?php echo $store; ?><br /><br />
                        <?php echo $address; ?></div><br />
                    <div class="right">
                        <?php if ($telephone) { ?>
                            <span><?php echo $text_telephone; ?></span><br />
                            <?php echo $telephone; ?><br />
                            <br /><br />
                        <?php } ?>
                        <?php if ($fax) { ?>
                            <span><?php echo $text_fax; ?></span><br />
                            <?php echo $fax; ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 55%; border: 1px solid #ccc; padding: 20px; border-radius: 5px;" class="fl frn_form">
            <h2><?php echo $text_contact; ?></h2>
            <div class="content">
                <span class="txt_label"><?php echo $entry_name; ?></span><br />
                <input type="text" name="name" value="<?php echo $name; ?>" />
                <br />
                <?php if ($error_name) { ?>
                    <span class="error"><?php echo $error_name; ?></span>
                <?php } ?>
                <br />
                <span class="txt_label"><?php echo $entry_email; ?></span><br />
                <input type="text" name="email" value="<?php echo $email; ?>" />
                <br />
                <?php if ($error_email) { ?>
                    <span class="error"><?php echo $error_email; ?></span>
                <?php } ?>
                <br />
                <span class="txt_label"><?php echo $entry_enquiry; ?></span><br />
                <textarea name="enquiry" cols="40" rows="10" style="width: 500px !important;"><?php echo $enquiry; ?></textarea>
                <br />
                <?php if ($error_enquiry) { ?>
                    <span class="error"><?php echo $error_enquiry; ?></span>
                <?php } ?>
                <br />
                <span class="txt_label"><?php echo $entry_captcha; ?></span><br />
                <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
                <br />
                <img src="index.php?route=information/contact/captcha" alt="" />
                <?php if ($error_captcha) { ?>
                    <span class="error"><?php echo $error_captcha; ?></span>
                <?php } ?>
            </div>
            <div class="clear"></div>
            <div class="buttons">
                <div><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
            </div>
        </div>

        <br/>
        <br/>
    </form>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>