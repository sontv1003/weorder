<?php echo $header; ?>
<?php echo $column_left; ?>
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
                        $avatar = HTTP_SERVER.$account_avatar;
                    } else {
                        $avatar = HTTP_SERVER.'image/avatar_default.png';
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
            <td class="quantity" style="text-align: center; width: 90px;"><?php echo $column_quantity; ?></td>
            <td class="price" style="font-weight: normal; width: 110px; text-align: center;" ><?php echo $column_price; ?></td>
            <td class="total" style="text-align: center; width: 110px;"><?php echo $column_total; ?></td>
            <td class="total" style="text-align: center; width: 60px">Trả lại</td>
          </tr>
        </thead>
        <tbody>       
          
          <?php 
          $total_quantity = 0;          

          foreach ($products as $product) { ?>
          <tr>
            <td class="image">
                <?php if (!empty($product['thumb'])) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <div>
                <?php foreach ($product['option'] as $option) { ?>
                - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
              </div>
            </td>
            <td class="link" style="text-align: center;"><a href="<?php echo $product['link']; ?>" target="_blank">Xem link</a></td>
            <td class="size" style="text-align: center;"><?php echo $product['size']; ?></td>
            <td class="color" style="text-align: center;"><?php echo $product['color']; ?></td>
            <td class="quantity" style="text-align: center;">
                <?php echo $product['quantity']; ?>
            </td>
            <td class="price" style="text-align: center;"><?php echo $product['price']; ?></td>
            <td class="total" style="text-align: center;"><?php echo $product['total']; ?></td>
            <?php $total_quantity += $product['quantity'];?>
            <td class="return">
                <?php if($product['order_status_id'] == 21): ?>
                <a href="<?php echo $product['return']; ?>">Bấm</a>
                <?php endif; ?>
            </td>
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
    <span style="font-family: 'UTM_Bebas'; font-size: 20px;">GHI CHÚ:</span>&nbsp;
    <span style="font-size: 16px; color: #666;"><?php echo $note; ?></span>
  <div class="box-bgcolor payment_cart" style='margin-top: 20px;'>
      
      <?php $i=0; foreach ($totals as $total) { ?>
          <?php if($i == 0) { ?>
              <ul>
                  <li class="head_cart1" style="width: 310px; color:#000;">Tổng số lượng trong giỏ hàng là </li>
                  <li class="head_cart2" style="width: 163px;"><?php echo $total_quantity ?></li>
                  <li class="head_cart1" style="width: 198px; color:#000;"><?php echo $total['title']; ?></li>
                  <li class="head_cart2" style="width: 237px;"><?php echo $total['text']; ?></li>
              </ul>
          <?php } else { ?>

      <div>          
          <div id="phis" class="fr">
                <ul>
                    <li>phí ship quốc tế</li>
                    <li>0</li>
                    <li>phí ship trong nước</li>
                    <li>0</li>
                </ul>
          </div>
          <div class="clear"></div>
      </div>
      <div>
            <div class="fr cost_payment"><b><?php echo $total['text']; ?></b></div>
            <div class="fr total_payment"><b>Tổng tiền bạn phải trả là:<?php //echo $total['title']; ?></b></div>
            <div class="clear"></div>
      </div>
      
    <?php } 
        $i++;
    }?>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#cbSelectAll').click(function(){
    if($(this).is(':checked'))
        $('.cbProdutct').attr('checked', true);
    else 
        $('.cbProdutct').attr('checked', false);
});

$('.cartDelProduct').click(function(){
        var selected = new Array();
        $('.cbProdutct:checked').each(function() {
            selected.push($(this).val());
        });
        
        location.href = '<?php echo $remove_link ?>&remove=' + selected.join(',');
});

//--></script>
<?php echo $footer; ?>
