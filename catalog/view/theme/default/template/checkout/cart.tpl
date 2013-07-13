<?php echo $header; ?>
<?php if ($attention) { ?>
    <div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
    <div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
    <div id="tbm2" style="width: 65%" class="fl">
        <ul>
            <li>
                <a href="javascript:void(0)" id="chot">cho link sản phẩm vào giỏ hàng</a>
            </li>
            <li>
                <a href="javascript:void(0)">gửi đơn hàng và xác nhận thông tin</a>
            </li>
            <li>
                <a href="javascript:void(0)">thanh toán</a>
            </li>
            <li>
                <a href="javascript:void(0)">nhận hàng</a>
            </li>
        </ul>
    </div>
    <div style="width: 32%;" class="fl">
        <table>
            <tr>
                <td width="85px">
                    <?php
                    if (!empty($account_avatar)) {
                        $avatar = HTTP_SERVER . $account_avatar;
                    } else {
                        $avatar = HTTP_SERVER . 'image/avatar_default.png';
                    }
                    ?>
                    <a href="<?php echo $account_info_href; ?>">
                        <img style="margin-top: 4px;" class="avatar" src="<?php echo $avatar; ?>" height="85px">
                    </a>
                </td>
                <td width="*" style="padding-left: 15px;">
                    <ul class="cart_acc_info">
                        <li><b>Xin chào: <?php echo $name; ?></b></li>
                        <li><a href="<?php echo $account_info_href; ?>">thông tin cá nhân</a></li>
                        <li><a href="<?php echo $account_order_info_href; ?>">danh sách đơn hàng cá nhân</a></li>
                        <li><a href="<?php echo $account_transaction_href; ?>">thu chi tài chính</a></li>
                        <li><a href="<?php echo $account_wishlist_href; ?>">Danh sách mua sau</a></li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>    
    <div class="clear"></div>
    <div class="l-pageWrapper" style="margin-top: 20px;">
        <img class="fl" src="catalog/view/theme/default/images/giohang.png" style="height: 115px; padding-bottom: 17px; margin-top: 20px; margin-right: 30px;">
        <img class="fl" style="width: 855px;" id="camket" src="catalog/view/theme/default/images/camket.jpg">
        <div class="clear"></div>
    </div>
    <!--
        <div id="ttcanhan">
            <ul>
                <li class="ttcn ttcnd" style="padding-top: 2px; padding-bottom: 5px;">
                    <a href="<?php echo $account_info_href; ?>">thông tin cá nhân</a>
                </li>
                <li class="ttcc" style="padding-top: 2px; padding-bottom: 5px;">
                    <a href="<?php echo $account_order_info_href; ?>">danh sách đơn hàng cá nhân</a>
                </li>
                <li class="ttcn" style="padding-top: 2px; padding-bottom: 5px;">
                    <a href="<?php echo $account_transaction_href; ?>">thu chi tài chính</a>
                </li>
                <li class="ttcc" style="padding-top: 2px; padding-bottom: 5px;">
                    <a href="javascript:void(0)">khiếu nại</a>
                </li>
            </ul>
            <div class="clear"></div>
        </div>
    -->
    <p>
        <b style="font-size: 14px;">Chú thích:</b> 
        <b style="font-size: 15px; font-family: Arial;">Giá của sản phẩm khi về đến Việt Nam = Giá sản phẩm tại website + Phí ship quốc tế (nếu có)
            + Tiền công + 8 Bảng / kg
        </b>
    </p>
    <div>
        <div class="fl cartSelectAll">
            <input type="checkbox" id="cbSelectAll" />
            <label for="cbSelectAll">CHỌN TẤT CẢ</label>
        </div>
        <div class="fl cartDelProduct">
            XÓA SẢN PHẨM
        </div>
        <div class="fr" style="border-top: 1px solid #000; width: 690px; height: 30px;">
            <div id="hotline" class="fl" style="width: 60%;">
                <p>HOTLINE: MR.LONG: <span id="sohl">092 883 688</span><img src="catalog/view/theme/default/images/ip.png"></p>
            </div>
            <div id="httt" class="fr" style="width: 35%;">
                <p>HỖ TRỢ TRỰC TUYẾN<img src="catalog/view/theme/default/images/phone.png"></p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="cart-info" style="position: relative;">
            <div id="loading"></div>
            <table>
                <thead>
                    <tr>
                        <td class="image a_center"><?php echo $column_image; ?></td>
                        <td class="name a_center" style="width: 110px;"><?php echo $column_name; ?></td>
                        <td class="model a_center"><?php echo $column_link; ?></td>
                        <td class="model a_center"><?php echo $column_size; ?></td>
                        <td class="model a_center"><?php echo $column_color; ?></td>
                        <td class="quantity a_center" style="width: 130px;"><?php echo $column_quantity; ?></td>
                        <td class="price a_center" style="font-weight: normal; width: 120px;"><?php echo $column_price; ?></td>
                        <td class="total a_center" style="width: 110px;"><?php echo $column_total; ?></td>
                    </tr>
                </thead>
                <tbody>

                    <!-- Empty Cart -->            
                    <?php if (!$hasProducts): ?>
                        <tr>
                            <td colspan="8"><span class="empty_cart"><?php echo $text_empty; ?></span></td>            
                        </tr>
                    <?php endif; ?>
                    <!-- End Empty Cart -->          

                    <?php
                    $total_quantity = 0;
                    foreach ($products as $product) {
                        ?>
                        <tr>
                            <td class="image" style="padding-left: 15px;">
                                <input type="checkbox" class="cbProdutct" value="<?php echo $product['key'] ?>"/>

                                <?php if ($product['thumb']) { ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                <?php } ?>
                            </td>
                            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <?php if (!$product['stock']) { ?>
                                    <span class="stock">***</span>
                                <?php } ?>
                                <div>
                                    <?php foreach ($product['option'] as $option) { ?>
                                        - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                                    <?php } ?>                                     
                                </div>
                                <?php if ($product['reward']) { ?>
                                    <small><?php echo $product['reward']; ?></small>
                                <?php } ?>             
                                <div class="clear"></div>
                                <a style="font-size: 15px;" href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" />&nbsp;Xóa</a>
                                <br/>
                                <img src="<?php echo HTTP_SERVER . 'image/cart.png' ?>" width="16px" />
                                <a style="font-size: 15px;" href="javascript:void(0)" onclick="addToWishList('<?php echo $product['key']; ?>')">Mua sau</a>
                            </td>
                            <td class="link"><input type="text" name="link[<?php echo $product['key']; ?>]" value="<?php echo $product['link']; ?>" /></td>
                            <td class="size"><input type="text" name="size[<?php echo $product['key']; ?>]" value="<?php echo $product['size']; ?>" style="width: 50px" /></td>
                            <td class="color"><input type="text" name="color[<?php echo $product['key']; ?>]" value="<?php echo $product['color']; ?>" style="width: 50px" /></td>
                            <td class="quantity">
                                <input style="float: left; margin-right: 10px; width: 30px;" type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                                <!--<input style="float: left; margin-right: 10px;" type="image" src="catalog/view/theme/default/images/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />-->
                                <input class="btn-update fl" type="submit" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" value="Cập nhật thông tin"/>
                                <div class="clear"></div>
                            </td>

                            <td class="price" style="font-size: 14px;"><?php echo $product['price']; ?></td>
                            <td class="total" style="padding-right: 15px;"><?php echo $product['total']; ?></td>
                            <?php $total_quantity += $product['quantity']; ?>
                        </tr>
                    <?php } ?>
                    <?php foreach ($vouchers as $vouchers) { ?>
                        <tr>
                            <td class="image"></td>
                            <td class="name"><?php echo $vouchers['description']; ?></td>
                            <td class="model"></td>
                            <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
                                &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
                            <td class="price"><?php echo $vouchers['amount']; ?></td>
                            <td class="total"><?php echo $vouchers['amount']; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </form>
    <h2 style="text-transform: uppercase; font-family: 'UTM_Bebas'; font-size: 18px; font-weight: normal">
        đặt hàng ở các website khác
    </h2>
    <div id="order_products_frm" style="margin-bottom: 20px; border: 1px solid #ccc; padding: 10px 0px">
        <table width="100%" style="border-collapse: collapse;" border="1">
            <tr>
                <td class="name" width="15%" style="padding-left: 15px;">
                    <input type="text" size="100" name="order_name" id="order_name" value="" placeholder="Tên sản phẩm" /></td>
                </td>
                <td class="link" width="*">
                    <input type="text" size="500" name="order_link" id="order_link" value="" placeholder="Link của sản phẩm" /></td>
                <td class="size" width="8%">
                    <input type="text" size="50" name="order_size" id="order_size" value="" placeholder="Size"/></td>
                <td class="color" width="10%">
                    <input type="text" size="50" name="order_color" id="order_color" value="" placeholder="Màu" />
                </td>
                <td class="quantity" width="8%">
                    <input type="text" size="2" name="order_quantity" id="order_quantity" value="" placeholder="Số lượng" />
                </td>
                <td class="price" width="10%"><input type="text" size="10" value="" name="order_price" id="order_price" placeholder="Đơn giá" /></td>
                <td class="currency" width="8%">
                    <select name="currency" style="padding: 5px 5px;" id="cb_currency">
                        <?php foreach ($currencies as $value): ?>
                            <option value="<?php echo $value['value'] ?>"><?php echo $value['code'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </td>
                <td class="total" width="12%">
                    <input type="text" value="" name="order_total" id="order_total" placeholder="Thành tiền" style="width: 65%" />
                    &nbsp<span style="font-size: 18px; font-family: 'UTM_Bebas'">VNĐ</span>
                </td>
                <td class="order_submit" width="8%"><input type="button" value="Thêm vào giỏ" name="add_order_product" id="add_order_product" /></td>
            </tr>
        </table>
    </div>
    <div class="clear"></div>

    <div class="box-bgcolor payment_cart">
        <?php
        $count = count($totals);
        ?>
        <ul>
            <li class="head_cart1" style="width: 310px; color:#000;">Tổng số lượng trong giỏ hàng là </li>
            <li class="head_cart2" style="width: 163px;"><?php echo $total_quantity ?></li>
            <li class="head_cart1" style="width: 198px; color:#000;"><?php echo $totals[0]['title']; ?></li>
            <li class="head_cart2" style="width: 237px;"><?php echo $totals[0]['text']; ?></li>
        </ul>

        <?php if ($count == 2): ?>
            <div>
                <a href="<?php echo $checkout; ?>"><div class="fl dytt fontUTM" style="width: 518px;"><?php echo $button_checkout; ?></div></a>
                <div id="phis" class="fr">
                    <ul>
                        <li>phí ship quốc tế</li>
                        <li>0 VNĐ (Tính sau)</li>
                        <li>Tiền công </li>
                        <li>0 VNĐ (Tính sau)</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        <?php else: ?>
            <a href="<?php echo $checkout; ?>"><div class="fl dytt fontUTM" style="width: 518px;"><?php echo $button_checkout; ?></div></a>
            <div>          
                <div id="phis" class="fr">
                    <ul>
                        <?php for ($i = 1; $i < $count - 1; $i++) { ?>
                            <li><?php echo $totals[$i]['title']; ?></li>
                            <li><?php echo $totals[$i]['text']; ?></li>
                        <?php } ?>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        <?php endif; ?>
        <div>
            <div class="fl dky fontUTM">Hủy đơn hàng</div>
            <div class="fr cost_payment"><b><?php echo $totals[$count - 1]['text']; ?></b></div>
            <div class="fr total_payment"><b>Tổng tiền bạn phải trả là:</b></div>
            <div class="clear"></div>
        </div>

    </div>
    <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
    $('#cbSelectAll').click(function() {
        if ($(this).is(':checked'))
            $('.cbProdutct').attr('checked', true);
        else
            $('.cbProdutct').attr('checked', false);
    });

    $('.cartDelProduct').click(function() {
        var selected = new Array();
        $('.cbProdutct:checked').each(function() {
            selected.push($(this).val());
        });

        location.href = '<?php echo $remove_link ?>&remove=' + selected.join(',');
    });

    $('#order_quantity').keyup(function() {
        getTotal($(this), 1);
    });

    $('#order_price').keyup(function() {
        getTotal($(this), 2);
    });

    function getTotal(obj, sign) {
        var quantity = $('#order_quantity').val();
        var price = $('#order_price').val();
        var currency = $('#cb_currency').val();
        var total = 0;

        if (isNaN(price) && sign == 1) {
            price = 0;
        }

        if (isNaN(quantity) && sign == 2) {
            quantity = 1;
        }

        total = quantity * price * currency;

        $('#order_total').val(total);
    }

    $('#cb_currency').change(function() {
        var currency = $(this).val();
        var quantity = $('#order_quantity').val();
        var price = $('#order_price').val();
        var total = 0;
        if (!isNaN(price) && !isNaN(quantity)) {
            total = Math.round(quantity * price * currency);
        }

        $('#order_total').val(total);

    });

    $('#add_order_product').click(function() {
        $('#order_products_frm input').removeClass('error');
        var currency = $('#cb_currency').val();
        var flag = true;
        if ($('#order_name').val() == '') {
            $('#order_name').addClass('error');
            flag = false;
        }

        if ($('#order_link').val() == '') {
            $('#order_link').addClass('error');
            flag = false;
        }

        if ($('#order_size').val() == '') {
            $('#order_size').addClass('error');
            flag = false;
        }

        if (isNaN($('#order_price').val())) {
            $('#order_price').addClass('error');
            flag = false;
        }

        if (isNaN($('#order_quantity').val())) {
            $('#order_quantity').addClass('error');
            flag = false;
        }

        if (!flag || $('#order_products_frm .error').length > 0) {
            return false;
        }

        var quantity = $('#order_quantity').val();
        var price = $('#order_price').val();

        if (quantity == '' || quantity == '0') {
            quantity = 1;
        }
        if (price == '') {
            price = 0;
        } else {
            price = Math.round(price * currency);
        }

        var link = $.trim($('#order_link').val());
        if (link != '') {
            if (!link.match('http://') && !link.match('https://')) {
                link = 'http://' + link;
            }
        }

        var params = {
            name: $('#order_name').val(),
            link: link,
            size: $('#order_size').val(),
            color: $('#order_color').val(),
            model: '',
            sku: '',
            upc: '',
            ean: '',
            jan: '',
            isbn: '',
            mpn: '',
            location: '',
            minimum: '',
            subtract: '',
            stock_status_id: '',
            date_available: '',
            manufacturer_id: '',
            shipping: '',
            points: '',
            weight: '',
            weight_class_id: '',
            length: '',
            width: '',
            height: '',
            length_class_id: '',
            status: '1',
            tax_class_id: '',
            sort_order: '',
            product_description: {2: {name: $('#order_name').val(),
                    meta_keyword: '', sort_description: '', tag: '',
                    meta_description: '', description: ''
                }},
            product_category: [66],
            product_store: {0: ''},
            keyword: '',
            quantity: quantity,
            price: price,
            total: quantity * price
        };

        $('#loading').show();
        $.ajax({
            url: 'index.php?route=checkout/cart/add_product',
            type: 'post',
            data: params,
            dataType: 'json',
            success: function(product_id) {
                $('#loading').hide();
                addToCart(product_id, quantity);
            }
        });
    });

    //--></script>
<?php echo $footer; ?>
