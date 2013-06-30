<?php echo $header; ?>
<?php if ($success) { ?>
    <div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
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
                    <a href="<?php echo $account_info_href; ?>">
                        <?php
                        if (!empty($account_avatar)) {
                            $avatar = HTTP_SERVER . $account_avatar;
                        } else {
                            $avatar = HTTP_SERVER . 'image/avatar_default.png';
                        }
                        ?>
                        <img style="margin-top: 4px;" class="avatar" src="<?php echo $avatar; ?>" height="85px">
                    </a>
                </td>
                <td width="*" style="padding-left: 15px;">
                    <ul class="cart_acc_info">
                        <li><b>Xin chào: <?php echo $account_name; ?></b></li>
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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="cart-info">
            <table>
                <thead>
                    <tr>
                        <td class="image" style="text-align: center; width: 120px;"><?php echo $column_image; ?></td>
                        <td class="name" style="text-align: center; width: 110px;"><?php echo $column_name; ?></td>
                        <td class="link" style="text-align: center; width: 140px;"><?php echo $column_link; ?></td>
                        <td class="size" style="text-align: center; width: 60px;"><?php echo $column_size; ?></td>
                        <td class="color" style="text-align: center; width: 60px;"><?php echo $column_color; ?></td>
                        <!--<td class="quantity" style="text-align: center; width: 90px;"><?php echo $column_quantity; ?></td>-->
                        <td class="price" style="font-weight: normal; width: 110px; text-align: center;" ><?php echo $column_price; ?></td>
                        <!--<td class="total" style="text-align: center; width: 110px;"><?php echo $column_total; ?></td>-->
                        <td class="total" style="text-align: center; width: 60px">Đặt hàng</td>
                    </tr>
                </thead>
                <tbody>       

                    <?php
                    $total_quantity = 0;
        if ($products) { 
                    foreach ($products as $product) {
                        ?>
                        <tr>
                            <td class="image" style="text-align: center;">
                                <?php if (!empty($product['thumb'])) { ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
    <?php } ?></td>
                            <td class="name">
                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <div class="clear"></div>
                                <a style="font-size: 15px;" href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" />&nbsp;Xóa</a>
                            </td>
                            <td class="link" style="text-align: center;"><a href="<?php echo $product['link']; ?>" target="_blank">Xem link</a></td>
                            <td class="size" style="text-align: center;"><?php echo $product['size']; ?></td>
                            <td class="color" style="text-align: center;"><?php echo $product['color']; ?></td>
                            <td class="price" style="text-align: center;"><?php echo $product['price']; ?></td>
                            <!--<td class="total" style="text-align: center;"><?php echo $product['total']; ?></td>-->
    <?php //$total_quantity += $product['quantity']; ?>
                            <td class="cart_later" style="text-align: center;">
                                <a href="javascript:void(0)" class="order_later" onclick="addToCart('<?php echo $product['product_id']; ?>');" alt="<?php echo $button_cart; ?>" title="<?php echo $button_cart; ?>">Đặt hàng</a>
                            </td>
                        </tr>
                    <?php } ?>
        <?php } else { ?>
                    <tr><td colspan="7" align="left"><div style="color: #f00; font-size: 16px; margin-left: 15px;text-align: left;"><?php echo $text_empty; ?></div></td></tr>
        <?php } ?>

                </tbody>
            </table>
        </div>
    </form>
<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>