<?php echo $header; ?>
<?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div id="content"><?php echo $content_top; ?>
    <?php echo $column_left; ?><?php echo $column_right; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <h1><?php echo $heading_title; ?></h1>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="frmEditAccount">
        <h2><?php echo $text_your_details; ?></h2>
        <div class="content">
            <table class="form">
                <tr>
                    <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
                    <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
                        <?php if ($error_firstname) { ?>
                            <span class="error"><?php echo $error_firstname; ?></span>
                        <?php } ?></td>
                </tr>
                <tr>
                    <td><span class="required">*</span> <?php echo $entry_email; ?></td>
                    <td><input type="text" name="email" value="<?php echo $email; ?>" />
                        <?php if ($error_email) { ?>
                            <span class="error"><?php echo $error_email; ?></span>
                        <?php } ?></td>
                </tr>
                <tr>
                    <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
                    <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
                        <?php if ($error_telephone) { ?>
                            <span class="error"><?php echo $error_telephone; ?></span>
                        <?php } ?></td>
                </tr>
                <tr>
                    <td><?php echo $entry_fax; ?></td>
                    <td><input type="text" name="fax" value="<?php echo $fax; ?>" /></td>
                </tr>
                <tr>
                    <td>Ảnh đại diện</td>
                    <td>
                        <a id="UploadButton" class="UploadButton">Chọn ảnh đại diện</a>
                        <input type="hidden" name="avatar" id="avatar" value="<?php echo $avatar; ?>" />
                        <div id="InfoBox" style="width: 100px; margin-top: 10px; height: 100px; border: 1px solid #ccc;">
                            <img src="<?php echo $account_avatar; ?>" width="100px" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons">
            <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
            <div class="right">
                <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
            </div>
        </div>
    </form>
    <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
    $("#UploadButton").ajaxUpload({
        url: "index.php?route=account/register/upload",
        name: "file",
        onSubmit: function() {
            $('#InfoBox').html('Đang upload ảnh ... ');
        },
        onComplete: function(result) {
            var data = $.parseJSON(result);
            $('#InfoBox').html('<img src="' + data.image + '" width="100px" />');
            $('#avatar').val(data.short_link);
        }
    });
//--></script>