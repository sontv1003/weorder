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
    <div id="tbm2">
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
    <div class="l-pageWrapper" style="margin-top: 20px;">
        <img class="fl" src="catalog/view/theme/default/images/giohang.png" style="height: 115px; padding-bottom: 17px; margin-top: 20px; margin-right: 30px;">
        <img class="fl" style="width: 855px;" id="camket" src="catalog/view/theme/default/images/camket.jpg">
        <div class="clear"></div>
    </div>
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
    <div class="cart-info">
      <table>
        <thead>
          <tr>
            <td class="image"><?php echo $column_image; ?></td>
            <td class="name"><?php echo $column_name; ?></td>
            <td class="model"><?php echo $column_link; ?></td>
            <td class="model"><?php echo $column_size; ?></td>
            <td class="model"><?php echo $column_color; ?></td>
            <td class="quantity"><?php echo $column_quantity; ?></td>
            <td class="price" style="font-weight: normal"><?php echo $column_price; ?></td>
            <td class="total"><?php echo $column_total; ?></td>
          </tr>
        </thead>
        <tbody>
            
<!-- Empty Cart -->            
        <?php if(!$hasProducts): ?>
        <tr>
            <td colspan="8"><span class="empty_cart"><?php echo $text_empty; ?></span></td>            
          </tr>
        <?php endif; ?>
<!-- End Empty Cart -->          
          
          <?php 
          $total_quantity = 0;
          foreach ($products as $product) { ?>
          <tr>
            <td class="image">
                <input type="checkbox" class="cbProdutct" value="<?php echo $product['key'] ?>"/>
                
                <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
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
              <?php } ?></td>
            <td class="link"><input type="text" name="link" value="<?php echo $product['link']; ?>" /></td>
            <td class="size"><input type="text" name="size" value="" style="width: 50px" /></td>
            <td class="color"><input type="text" name="color" value="" style="width: 50px" /></td>
            <td class="quantity">
              <input style="float: left; margin-right: 10px;" type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
              &nbsp;
              <input style="float: left; margin-right: 10px;" type="image" src="catalog/view/theme/default/images/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
              &nbsp;
              <a style="float: left;" href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/images/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>
              <div class="clear"></div>
            </td>
            
            <td class="price"><?php echo $product['price']; ?></td>
            <td class="total"><?php echo $product['total']; ?></td>
            <?php $total_quantity += $product['quantity'];?>
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
    <div id="ghichu">
        <h5>Ghi chú</h5>
        <input type="text" placeholder=". . . ." onfocus="if(this.value == ' . . . .') this.value = '';"><a href="#"><img src="images/save-icon.png"></a><p><span id="wsbb">website:</span>http://www.energie.it</p>
    </div>
    <div class="clear"></div>
  <div class="box-bgcolor payment_cart">
      
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
          <a href="<?php echo $checkout; ?>"><div class="fl dytt fontUTM" style="width: 518px;"><?php echo $button_checkout; ?></div></a>
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
            <div class="fl dky fontUTM">Hủy đơn hàng</div>
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
