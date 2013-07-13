<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content" class="product-info" role="main">
    <?php echo $content_top; ?>

    <div class="bcr mbm fsm breadcrumbs">
        <ul>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>﻿
                <li class="prs"> <a href="<?php echo $breadcrumb['href']; ?>" title="<?php echo $breadcrumb['text']; ?>"><?php echo $breadcrumb['text']; ?></a> </li>
            <?php } ?>
        </ul>
    </div>

    <div id="product-box" typeof="gr:Offering" xmlns:v="#" xmlns:gr="http://purl.org/goodrelations/v1#" xmlns:foaf="http://xmlns.com/foaf/0.1/">
        <div class="r-main">
            <section class="box-bgcolor mbm">
                <div class="">
                    <div class="clearfix">
                        <div class="prd-details ">
                            <?php if (!empty($manufacturer_image)) { ?>
                                <a href="" class="prd-brand-img">
                                    <img title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" src="<?php echo $manufacturer_image ?>" height="80" width="100">
                                </a>
                            <?php } ?>
                            <div id="product-option-stock-hint" class="mtm" style="">
                                <!--Lựa chọn của quý khách: <strong><span id="product-option-stock-number" style="color:#D02700">Chỉ còn lại 32 mục</span></strong>-->
                            </div>

                            <div class="bService overflow marginBottom ">
                                <div class="iconSprite"></div>
                                <p>Mọi câu hỏi vui lòng liên hệ Chăm Sóc Khách Hàng qua hotline miễn phí (08) 6 288 5678</p>
                            </div>
                            <div class="clear"></div>
                            <div class="prd-hd">
                                <h1 class="h2 mtm lhl">
                                    <?php if ($manufacturer) { ?>
                                        <span class="prd-brand" property="gr:BusinessEntity">
                                            <a href="<?php echo $manufacturers; ?>">THƯƠNG HIỆU: <?php echo $manufacturer; ?></a>
                                        </span>
                                    <?php } ?>
                                    <span class="prd-title fsm" property="gr:name"><?php echo $heading_title; ?></span>
                                    <p class="xemlink"><a href="<?php echo $product_link; ?>" target="_blank">Xem link</a></p>
                                    <span class="prd-price fsm" property="gr:name"><?php echo $text_price; ?> <span class="lbPrice"><?php echo $price; ?></span></span>
                                </h1>
                                <div class="l-row vMid">
                                </div>
                                <?php if ($tags) { ?>

                                    <p class="moreOf fsm l-cell vMid">
                                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                            <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                            <?php if ($i < (count($tags) - 1)) { ?>
                                                <span>&nbsp;|&nbsp;</span>
                                            <?php } ?>
                                        <?php } ?>
                                    </p>
                                <?php } ?>
                            </div>
                            <?php echo $sort_description ?>

                            <?php if ($options) { ?>
                                <div class="options">
                                    <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <select name="option[<?php echo $option['product_option_id']; ?>]">
                                                    <option value=""><?php echo $text_select; ?></option>
                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                        <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />


                                                <ul class="prd-option-collection ui-listHorizontal ui-listItemBorder size">
                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                        <li data-value-class="opt-One-Sizeitem-0" data-attribute="size" data-js-function="selectOption" class="prd-option-item ui-listItem ui-border ui-listItem-margin pas opt-One-Sizeitem-0 selected" style="opacity: 1;">
                                                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                            <?php echo $option_value['name']; ?>       
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'checkbox') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />

                                                <ul class="prd-option-collection ui-listHorizontal ui-listItemBorder size">
                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                        <li data-value-class="opt-One-Sizeitem-0" data-attribute="size" data-js-function="selectOption" class="prd-option-item ui-listItem ui-border ui-listItem-margin pas opt-One-Sizeitem-0 selected" style="opacity: 1;">
                                                            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />                                                       
                                                            <?php echo $option_value['name']; ?>       
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </li>
                                                    <?php } ?>
                                                </ul>

                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'image') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <ul class="prd-option-collection ui-listHorizontal ui-listItemBorder size">
                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                        <li data-value-class="opt-One-Sizeitem-0" data-attribute="size" data-js-function="selectOption" class="prd-option-item ui-listItem ui-border ui-listItem-margin pas opt-One-Sizeitem-0" style="opacity: 1;">
                                                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />                                                  
                                                            <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"  width="20px" />
                                                        </li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'textarea') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'file') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div>
                                                <br />
                                                <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'date') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'datetime') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                                            </div>
                                            <br />
                                        <?php } ?>
                                        <?php if ($option['type'] == 'time') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <div class="option-name">
                                                    <?php if ($option['required']) { ?>
                                                        <span class="required">*</span>
                                                    <?php } ?>
                                                    <b><?php echo $option['name']; ?>:</b>
                                                </div><br />
                                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
                                            </div>
                                            <br />
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            <?php } ?>

                            <div class="mtm mbm"> </div>

                            <div class="cart">
                                <div>
                                    <div style="line-height: 35px; display: inline-block;"><?php echo $text_qty; ?></div>
                                    <input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                                    &nbsp;
                                    <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" />
                                </div>
                                <?php if ($minimum > 1) { ?>
                                    <div class="minimum"><?php echo $text_minimum; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div id="prdMedia" class="prd-media">
                            <?php if ($thumb || $images) { ?>
                                <div class="left">
                                    <?php if ($thumb) { ?>
                                        <div class="prd-imageBoxLayout ui-border">
                                            <a class="prd-imageBox colorbox" id="prdZoomBox" rel="colorbox">
                                                <span rel="foaf:depiction">
                                                    <img class="prd-image" id="prdImage" data-js-function="setPlaceholderOnError" data-placeholder="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" src="<?php echo $popup; ?>" height="400" width="277">
                                                </span>
                                                <div style="width: 148px; height: 172.3px; display: none; top: 0px; left: 129px;" id="magnifier"></div>
                                            </a>
                                        </div>
                                    <?php } ?>
                                    <?php if ($images) { ?>
                                        <div class="prd-moreImages" data-thumbnailcount="5">
                                            <h2 class="s-visuallyhidden">Thêm hình ảnh khác</h2>
                                            <div class="prd-moreImagesListWrapper" data-simple-sku="default" id="prdMoreImagesList-default">
                                                <div class="prd-moreImagesListContainer">
                                                    <ul class="prd-moreImagesList ui-listItemBorder ui-listLight clearfix">
                                                        <?php foreach ($images as $key => $image) { ?>
                                                            <li class="lfloat ui-border" data-js-function="setImage" data-image-product="<?php echo $image['popup']; ?>" data-image-big="<?php echo $image['popup']; ?>">
                                                                <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox">
                                                                    <img data-js-function="setPlaceholderOnError" data-placeholder="<?php echo $image['thumb']; ?>" id="gal<?php echo $key ?>" src="<?php echo $image['thumb']; ?>" alt="<?php echo $image['thumb']; ?>" height="54" width="37">
                                                                </a>
                                                            </li>
                                                        <?php } ?>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    <?php } ?>
                                </div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="prd-description ui-tabViewBox">

                        <div id="jtabs" class="htabs">
                            <a href="#productDetails" class="selected">Chi tiết sản phẩm</a>
                            <a href="#brandInformation">THÔNG TIN NHÃN HIỆU</a>
                            <a href="#productReviews">NHẬN XÉT SẢN PHẨM</a>
                            <a href="#facebookComment">BÌNH LUẬN</a>
                        </div>
                        <div style="clear: both"></div>
                        <div class="ui-tabViewCont box-bdr">
                            <div class="box-bd ui-tabViewContent">
                                <div id="productDetails" style="display: block;">
                                    <h2 class="mbm">Chi tiết sản phẩm</h2>
                                    <div class="prd-description mbm">
                                        <?php echo $description; ?>
                                    </div>
                                    <table class="ui-grid ui-gridFull prd-attributes">
                                        <tbody>
                                            <tr class="odd">
                                                <td class="" style="width: 200px;"><?php echo $text_model; ?></td>
                                                <td class=""><?php echo $model; ?></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <div id="brandInformation" class="detailTab pbl" style="display: none;">
                                    <h2 class="mbm">THÔNG TIN NHÃN HIỆU</h2>
                                    <div class="product-additionals">
                                        <h1><?php echo $manufacturer; ?></h1>
                                        <?php if (!empty($manufacturer_description)) { ?>
                                            <?php echo $manufacturer_description ?>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div id="productReviews" class="detailTab pbl" style="display: none;">

                                    <div id="review"></div>
                                    <h2 class="mbm" id="review-title"><?php echo $text_write; ?></h2>
                                    <div id="productReview">
                                        <div id="ProductRating">
                                            <h3 class="mbm">Chúng tôi muốn biết ý kiến của bạn</h3>
                                            <form id="ProductRatingForm" action="javascript:void(0);" method="post">

                                                <div id="ProductRatingFormOptions" class="box box-bdr phm">
                                                    <fieldset id="ProductRatingFormOption_quality" class="prd-ratingOption mvm clearfix">
                                                        <legend id="rating" class="prd-ratingOptionTitle lfloat strong">Chất Lượng <span class="required">*</span></legend>
                                                        <label for="quality_1">
                                                            <input class="" id="quality_1" name="rating" value="11" type="radio"><span title="1"></span> 
                                                        </label>
                                                        <label for="quality_2">
                                                            <input class="" id="quality_2" name="rating" value="12" type="radio"><span title="2"></span> 
                                                        </label>
                                                        <label for="quality_3">
                                                            <input class="" id="quality_3" name="rating" value="13" type="radio"><span title="3"></span> 
                                                        </label>
                                                        <label for="quality_4">
                                                            <input class="" id="quality_4" name="rating" value="14" type="radio"><span title="4"></span> 
                                                        </label>
                                                        <label for="quality_5">
                                                            <input class="" id="quality_5" name="rating" value="15" type="radio"><span title="5"></span> 
                                                        </label>
                                                        <div class="wrapper"></div>
                                                    </fieldset>
                                                </div>
                                                <div style="clear: both"></div>
                                                <fieldset id="ProductRatingFormSender" class="mtl clearfix">

                                                    <label for="RatingForm_name" class="required"><?php echo $entry_name; ?> <span class="required">*</span></label>       
                                                    <input class="required ui-inputText" name="name" id="RatingForm_name" type="text">      
                                                    <label for="RatingForm_comment" class="required"><?php echo $entry_review; ?> <span class="required">*</span></label>   
                                                    <textarea class="required ui-inputText" name="text" id="RatingForm_comment"></textarea>   
                                                    <label for="RatingForm_name" class="required"><?php echo $entry_captcha; ?> <span class="required">*</span></label>       
                                                    <div><img src="index.php?route=product/product/captcha" alt="" id="captcha" /></div>
                                                    <input class="required ui-inputText" type="text" name="captcha">  

                                                </fieldset><!-- #ProductRatingFormSender -->
                                                <div id="" class="mtl">
                                                    <input id="button-review" class="ui-button" name="rating-submit" value="Gửi nhận xét" type="button">
                                                </div><!-- #ProductRatingFormAction -->
                                            </form>                  
                                        </div><!-- #ProductRating -->
                                    </div>
                                </div>
                                <div id="facebookComment">
                                    <div class="box_facebook_comment" style="margin: 5px auto;">
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

                                        <fb:comments href="<?php echo $current_url; ?>" width="750" num_posts="10"></fb:comments>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            var rating = {
                                performSend: function() {
                                    var data = this.getForm();
                                    if (this.isValid(data) == true) {
                                        this.send(data);
                                    } else {
                                        msg = "Không thể gửi đánh giá, một vài thông tin còn thiếu.";
                                        $('#ProductRatingFormErrors').html(msg).show();
                                    }
                                },
                                getForm: function() {
                                    var data = new Object();
                                    $(':input', '#ProductRatingForm').each(function() {
                                        type = $('#' + this.id).attr('type');
                                        name = '';
                                        value = '';
                                        if (type == 'radio') {
                                            if (!data[this.name]) {
                                                data[this.name] = 'VALUE_MISSING';
                                            }
                                            ;
                                            if ($('#' + this.id).is(':checked')) {
                                                data[this.name] = this.value;
                                            }
                                        } else {
                                            data[this.name] = this.value;
                                        }
                                    });
                                    return data;
                                },
                                isValid: function(data) {
                                    var valid = true;
                                    $.each(data, function(name, value) {
                                        console.debug(name);
                                        name = name.replace('[', '_').replace(']', '');
                                        if (name != 'rating-customer' && (value == '' || value == 'VALUE_MISSING')) {
                                            /*TODO: more validation!?*/
                                            $('#' + name).css('border', '1px solid #f16048');
                                            $('span#' + name).css('color', '#df280a').css('border', 'none');
                                            $('legend#' + name).css('color', '#df280a').css('border', 'none');
                                            $('label[for=' + name + ']').css('color', '#df280a').css('border', 'none');

                                            if (['INPUT', 'TEXTAREA'].indexOf($('#' + name)[0].tagName) != -1)
                                                $('#' + name).css('background-color', '#FFC0C0');
                                            valid = false;
                                        } else {
                                            $('#' + name).css('border', '1px solid #000');
                                            $('#' + name).css('border-color', '#8E8E8E #C2C2C2 #E2E2E2');
                                            $('span#' + name).css('color', '#000').css('border', 'none');
                                            $('legend#' + name).css('color', '#000').css('border', 'none');
                                            $('label[for=' + name + ']').css('color', '#000').css('border', 'none');
                                        }
                                    });
                                    return valid;
                                },
                                send: function(data) {
                                    var successText = '<div class="msg-success">Cám ơn nhận xét của quý khách. Nhận xét sẽ hiển thị sau khi được thông qua.</div>';
                                    var errorText = '<div class="msg-error">Quá trình lưu đánh giá xảy ra lỗi. Xin hãy thử lại lần nữa</div>';
                                    var post = '';
                                    $.each(data, function(name, value) {
                                        post += '&' + name + '=' + value;
                                    });
                                    $.ajax({
                                        async: false,
                                        type: 'POST',
                                        url: '/catalog/sendRating/',
                                        data: post + '&YII_CSRF_TOKEN=88541ada72b317ffd4dd28215375541e119c9ce8' + '&ajax=1',
                                        success: function(rtn) {
                                            if (rtn == 'true') {
                                                $('#ProductRating').html(successText);
                                            } else {
                                                $('#ProductRating').html(errorText);
                                            }
                                        }
                                    });
                                }
                            };

                            $('.prd-ratingOption label span').mouseenter(function() {
                                $(this).parents('.prd-ratingOption').find('label span').removeAttr('class');
                                $(this).addClass('active').parent('label').prevAll('label').children('span').addClass('fill');
                            }).mouseleave(function() {
                                $(this).parents('.prd-ratingOption').find('label span').removeAttr('class');
                                $('.prd-ratingOption label input:checked').next('span').addClass('active').parent('label').prevAll('label').children('span').addClass('fill');
                            }).click(function() {
                                $(this).prev('input').attr("checked", "checked");
                            });
                        </script></div>
                </div>
            </section>

            <section class="box box-bgcolor mtm">
                <div id="recommengine_lastproductsviewed"></div>
            </section>

            <?php if ($products) { ?>
                <section class="box box-bgcolor mtm" style="margin: 0px;">
                    <div id="recommengine_recommendations">
                        <div class="box box-bdr box-bgcolor mbm mtl" data-recommid="recommBox1" style="margin: 0px;">
                            <h3 class="mam pbm ui-borderBottom">Giới thiệu cho bạn</h3>
                            <ul class="catalog_grid">
                                <?php foreach ($products as $product) { ?>
                                    <li id="LE490AC78PWFVN" class="itm itm-small unit size1of4  pbl">
                                        <a class="itm-link" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                                            <?php if ($product['thumb']) { ?>
                                                <span class="lazyImage lazyRecommended loaded" id="pht_LE490AC78PWFVN">
                                                    <span class="itm-imageWrapper itm-imageWrapper-LE490AC78PWFVN_recommend" id="images/lee-tee-0129-12018-1-catalog.jpg">
                                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                                    </span>
                                                </span>
                                            <?php } ?>
                                            <span class="itm-newFlag">Mới</span>
                                            <span class="itm-brand strong"><?php echo $product['manufacturer_name']; ?></span>
                                            <em class="itm-title itm-product-title">
                                                <?php echo $product['name']; ?>     
                                            </em>


                                            <span class="itm-priceBox strong">
                                                <span class="itm-price"><?php echo $product['price']; ?></span>
                                            </span>
                                        </a>
                                    </li>

                                <?php } ?>
                            </ul>
                        </div>
                </section>

            <?php } ?>

        </div>
    </div>

</div>
<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
    $('#button-cart').bind('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
            dataType: 'json',
            success: function(json) {
                $('.success, .warning, .attention, information, .error').remove();

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
                        }
                    }
                }
                if (json['success']) {
                    $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                    $('.success').fadeIn('slow');

                    $('#cart-total').html(json['total']);

                    //Nhay den trang gio hang
                    location = json['redirect'];
                    //$('html, body').animate({ scrollTop: 0 }, 'slow'); 
                }
            }
        });
    });
    //--></script>
<?php if ($options) { ?>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
    <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'file') { ?>
            <script type="text/javascript"><!--
                new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
                    action: 'index.php?route=product/product/upload',
                    name: 'file',
                    autoSubmit: true,
                    responseType: 'json',
                    onSubmit: function(file, extension) {
                        $('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
                        $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
                    },
                    onComplete: function(file, json) {
                        $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);

                        $('.error').remove();

                        if (json['success']) {
                            alert(json['success']);

                            $('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
                        }

                        if (json['error']) {
                            $('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
                        }

                        $('.loading').remove();
                    }
                });
                //--></script>
        <?php } ?>
    <?php } ?>
<?php } ?>
<script type="text/javascript"><!--
    $('#review .pagination a').live('click', function() {
        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');

        return false;
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').bind('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function() {
                $('.success, .warning').remove();
                $('#button-review').attr('disabled', true);
                $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
            },
            complete: function() {
                $('#button-review').attr('disabled', false);
                $('.attention').remove();
            },
            success: function(data) {
                if (data['error']) {
                    $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
                }

                if (data['success']) {
                    $('#review-title').after('<div class="success">' + data['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').attr('checked', '');
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });
    //--></script> 
<script type="text/javascript"><!--
    $('#jtabs a').tabs();
    //--></script> 

<script type="text/javascript"><!--
    $(document).ready(function() {
        $('.colorbox').colorbox({
            width: 640,
            height: 480,
            overlayClose: true,
            opacity: 0.5
        });
    });
    //--></script> 
