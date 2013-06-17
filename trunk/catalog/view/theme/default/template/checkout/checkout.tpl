<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="unit size1of3 vTop checkoutCol1 mrs">
    <form onsubmit="return false;">
    <div class="mrs">
        <div class="box-hd checkout-step-title timba" style="margin-top: 25px;">
            <h2 class="h2 ui-formTitle">1. Thông tin khách hàng</h2>
        </div>
        <div class="box-bd box-bdr white-box" style="width:331px; float:left; padding-top: 20px;">
            <input id="loggedInCustomer" name="loggedInCustomer" type="hidden" value="1">
            <fieldset id="checkout-address" class="ui-fieldset">
                <div class="ui-formRow frm_register">
                    <p style="background-color:#000; width:44px; color:#fff">E-Mail<input name="email" value="<?php echo $email ?>" placeholder="Điền Email vào đây nhé" type="text" style="width:174px; height:25px; border:1px solid #000; padding-left:5px"></p>  
                    <p style="background-color:#000; width:60px; color:#fff">Mật khẩu<input type="password" name="password" placeholder="Mật khẩu" style="width:150px; height:25px; border:1px solid #000; padding-left:5px; margin:-23px 0px  0px 60px;"></p>  
                    <p style="background-color:#000; width:90px; color:#fff">Nhắc mật khẩu<input type="password" name="confirm" placeholder="Nhắc lại mật khẩu"  style="width:150px; height:25px; border:1px solid #000; padding-left:5px; margin:-23px 0px  0px 90px;"></p>                         
                    <p style="background-color:#000; width:58px; color:#fff">Họ và tên<input name="firstname" value="<?php echo $firstname ?>" id="ht" placeholder="Họ và tên" type="text" style="width:174px; height:25px; border:1px solid #000; padding-left:5px"></p>        
                    <p style="background-color:#000; width:79px; color:#fff">Số điện thoại<input name="telephone" value="<?php echo $telephone ?>" id="sdt" placeholder="Số điện thoại" type="text" style="width:174px; height:25px; border:1px solid #000; padding-left:5px"></p>      
                    <p style="background-color:#000; width:63px; color:#fff">Ngày sinh</p>
                    <select style="width:62px; margin:-35px 0px  0px 71px; height:25px ; position:absolute" id="BillingDate" name="date">
                        <option value="">ngày</option>
                        <?php for ($i = 1; $i <= 31; $i++): ?> 
                            <option value="<?php echo $i ?>" <?php echo (!empty($birthday) && date('d', strtotime($birthday)) == $i) ? 'selected="selected"' : ''?>><?php echo $i ?></option>
                        <?php endfor; ?>
                    </select>    

                    <select style="width:62px; margin:-35px 0px  0px 132px;height:25px ; position:absolute" id="BillingMonth" name="month">
                        <option value="">tháng</option>
                        <?php for ($i = 1; $i <= 12; $i++): ?> 
                            <option value="<?php echo $i ?>" <?php echo (!empty($birthday) && date('m', strtotime($birthday)) == $i) ? 'selected="selected"' : ''?>><?php echo $i ?></option>
                        <?php endfor; ?>
                    </select>    

                    <select style="width:62px; margin:-35px 0px  0px 193px;height:25px ; position:absolute" id="BillingYear" name="year">
                        <option value="">năm</option>
                        <?php for ($i = date('Y') - 10; $i > 1900; $i--): ?> 
                            <option value="<?php echo $i ?>" <?php echo (!empty($birthday) && date('Y', strtotime($birthday)) == $i) ? 'selected="selected"' : ''?>><?php echo $i ?></option>
                        <?php endfor; ?>
                    </select>    
                    <p style="background-color:#000; width:63px; color:#fff">Giới tính</p>
                    <select style="width:70px; margin:-35px 0px  0px 71px;height:25px ; position:absolute" id="BillingGender" name="gender">
                        <?php if(empty($gender)):?>
                        <option value="1">Nam</option>
                        <option value="0" selected="selected">Nữ</option>
                        <?php else: ?>
                        <option value="1" selected="selected">Nam</option>
                        <option value="0">Nữ</option>
                        <?php endif; ?>
                    </select>

                    <p style="background-color:#000; width:45px; color:#fff">địa chỉ<input name="address_1" value="<?php echo $address ?>" id="dc" placeholder="Địa chỉ của bạn" type="text" style="width: 244px; height:25px; border:1px solid #000; padding-left:5px"></p>      

                    <p style="background-color:#000; width:102px; color:#fff">Thành phố
                    <select name="country_id" style="display: none;">
                        <option value=""></option>
                        <?php foreach ($countries as $country) { ?>
                            <?php if ($country['country_id'] == $country_id) { ?>
                                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>
                    <select name="zone_id" style="width: 100px; margin: 0px 0px  0px 10px;height:25px ; position:absolute" id="BillingZone">
                    </select>
                    </p>
                </div>

            </fieldset>
            <fieldset class="mtl"><div id="shippingSelfPickupButtonDiv" style="display:none">
                    <div class="icon i-checkoutSelfPickup">
                        <input class="ui-inputSelfPickup" id="shippingSelfPickup" type="checkbox" name="shippingSelfPickup" value="1">
                        <label for="shippingSelfPickup" class="inline">Tự lấy hàng</label>
                    </div>
                </div></fieldset>
            <fieldset class="mtl">
                <div class="icon i-checkoutShipping">
                    <input class="ui-inputCheckbox" id="shippingAddressDifferent" type="checkbox" name="shippingAddressDifferent" checked="checked" value="1">
                    <label for="shippingAddressDifferent" class="inline">Giao hàng tới cùng địa chỉ</label>
                </div>
            </fieldset>
            <fieldset id="checkout-selfPickup" class="ui-fieldset mtm" style="display:block;display:none;">
                <div id="checkout-selfPickup-content" style="display: none;"></div>
            </fieldset>
            <fieldset id="checkout-shipping" class="ui-fieldset mtm" style="">
                <div id="checkout-shipping-content">
                </div>
            </fieldset>
            <fieldset>
                <div class="col1">
                    <span id="newsletterSignupWrapper" class="lfloat" style="opacity: 0.5;padding-left: 30px; margin-bottom:5px;">
                        <label>
                            <input type="checkbox" id="newsletter_signup" class="ui-inputCheckbox" name="newsletter" value="1" checked="checked">
                            Đăng ký bản tin qua email                        
                        </label>
                    </span>
                    <div class="clearfix"></div>
                </div>
                <div class="rfloat">
                    <span class="requiredInfo mvm">* Mục bắt buộc</span>
                </div>
            </fieldset>
        </div>
        <div class="mrs" style="width: 284px; margin: -55px 0px 0px 30px; float:left">
            <div class="box-hd checkout-step-title">
                <h2 class="h2 ui-formTitle pts">2. Phương thức thanh toán</h2>
            </div>
            <div class="box-bd white-box box-bdr">
                <fieldset>
                    <div id="PaymentMethodError" class="s-error msgBox" style="display: none;"></div>
                    <div id="checkout-payment">
                        <input type="hidden" name="PaymentMethod[empty" value="1">
                        <div class="ui-formRow payment-method ">
                            <div class="collection pbs">
                                <input id="cod" value="CashOnDelivery" class="payment-method-option ui-inputRadio lfloat codbased" checked="checked" type="radio" name="PaymentMethodForm[payment_method]">        <label for="cod" style="display: inline;" class="codbasedlabel">
                                    <strong>THANH TOÁN trực tiếp</strong>

                                </label>
                            </div>
                        </div>
                        <div class="payment-disabled-msg" style="display: none;">
                            Xin quý khách vui lòng chọn hình thức thanh toán khác. Phương thức thanh toán khi giao hàng không được áp dụng tại thành phố/tỉnh quý khách đã chọn.    <div class="arrow"></div>
                        </div>
                        <div class="ui-formRow payment-method-form payment-method-cod" style="">

                            <div id="cod-normaltext" style="color: #000000; font-size: 11px; margin-top: 5px;">Quý khách sẽ thanh toán trực tiếp với nhân viên của chúng tôi bằng tiền mặt tại địa chỉ giao hàng.</div>
                            <div id="cod-creditcardtext" style="color: #000000; font-size: 11px; font-weight:bold; margin-top: 5px; display:none">Quý khách sẽ thanh toán trực tiếp với nhân viên của chúng tôi bằng tiền mặt tại địa chỉ giao hàng.</div>

                        </div>
                        <div class="ui-formRow payment-method" style="overflow: visible;">
                            <div class="collection pbs"><div style="position: relative; float: right;"><style>#footer .footer-container .lfloat {font-size: 0px;}</style><ul class="cc-vouchers hover-hint" style="position: absolute; left: 0px; display: none;"><li class="cc-vouchers-hover"></li><li class="cc-vouchers-hover"></li><li class="cc-vouchers-hover"></li></ul></div>
                                <input id="creditcard" class="payment-method-option ui-inputRadio lfloat" value="Adyen_CreditCard" type="radio" name="PaymentMethodForm[payment_method]">        <label class="adyen_creditcard the" for="creditcard">THẺ TÍN DỤNG</label>
                            </div>

                            <div class="ui-formRow payment-method-form payment-method-creditcard" style="display:none">
                                <div style="clear:both;">
                                    <input id="cardName" type="hidden" name="cc_type" value="">
                                    <div class="select">
                                        <div class="creditcards ui-listHorizontal mtm mbm">
                                            <span title="VISA" id="visa" class="ui-listItem icon i-payVisa ">
                                                1                    </span>
                                            <span title="MasterCard" id="mastercard" class="ui-listItem icon i-payMasterCard ">
                                                2                    </span>
                                            <span title="Maestro" id="maestro" class="ui-listItem icon i-payMaestro">
                                                6
                                            </span>
                                            <div style="float:left;width:80px" class="ui-formLabel ui-hint">Các loại thẻ được chấp nhận</div>
                                            <div style="clear:both"></div>
                                        </div>

                                        <div id="cc_number">
                                            <label class=" required" for="CreditcardForm_cc_number">Số thẻ tín dụng <span class="required">*</span></label>                    <input name="cc_number" class="ui-inputText" autocomplete="off" onkeydown="checkout.detectCard($(this));" onblur="checkout.detectCard($(this));" id="PaymentMethodForm_parameter_cc_number" type="text">                                        <div id="numberError" class="s-error msg" style="display:none">Số điện thoại không hợp lệ</div>
                                        </div>

                                        <div style="margin-top:8px" id="cc_holder">
                                            <label for="CreditcardForm_cc_holder" class="required">Tên thẻ <span class="required">*</span></label>                    <input name="cc_holder" class="ui-inputText" autocomplete="off" id="PaymentMethodForm_parameter_cc_holder" type="text">                                    </div>

                                        <div style="margin-top:8px" id="cc_valid">
                                            <label for="CreditcardForm_cc_exp_month" class="required">Ngày hết hạn <span class="required">*</span></label>                    <select name="cc_exp_month" style="width:54%" autocomplete="off" id="PaymentMethodForm_parameter_cc_exp_month">
                                                <option value="" selected="selected">Tháng</option>
                                                <option value="1">01 - January</option>
                                                <option value="2">02 - February</option>
                                                <option value="3">03 - March</option>
                                                <option value="4">04 - April</option>
                                                <option value="5">05 - May</option>
                                                <option value="6">06 - June</option>
                                                <option value="7">07 - July</option>
                                                <option value="8">08 - August</option>
                                                <option value="9">09 - September</option>
                                                <option value="10">10 - October</option>
                                                <option value="11">11 - November</option>
                                                <option value="12">12 - December</option>
                                            </select>                    <select name="cc_exp_year" style="width:40%" autocomplete="off" id="PaymentMethodForm_parameter_cc_exp_year">
                                                <option value="" selected="selected">Năm</option>
                                                <option value="2013">2013</option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                            </select>                </div>

                                        <div style="margin-top:8px" id="cc_security_code">
                                            <label for="CreditcardForm_cc_security_code" class="required">Mã xác minh <span class="required">*</span></label>                    <input name="cc_security_code" style="width:40px" class="ui-inputText" autocomplete="off" id="PaymentMethodForm_parameter_cc_security_code" type="text">                    <a href="" class="cvv-what-is-this ui-formLabel ui-hint" id="cvv-what-is-this">Đây là gì?</a>
                                        </div>

                                        <div style="margin-top:10px" id="cc_save">
                                            <input id="ytPaymentMethodForm_parameter_cc_save" type="hidden" value="0" name="cc_save]"><input name="cc_save" class="lfloat ui-inputCheckbox" checked="checked" value="1" id="PaymentMethodForm_parameter_cc_save" type="checkbox">                    <label for="CreditcardForm_cc_save">Lưu thông tin thẻ của tôi</label>                                    </div><div class="cc-vouchers-base"><style type="text/css">#voucher_box {border: 1px solid orange;}.voucher_tag {background: #F7F7F7;}.cc-vouchers-base {border: 1px solid orange; padding: 5px;}#salesrule-set-promo h4 {color: #f88b08;}#salesrule-set-promo span {font-size: 13px !important;}#salesrule-set-promo {border: 1px solid orange; background: #f7f7f7; padding: 10px;}#applySalesRule {color: #f88b08 ;font-weight: bold;padding: 3px 8px 5px 8px;border: 1px solid lightgrey;margin-left: 33%;}</style></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="display: none;" id="payment-tool-tip" class="checkout-tool-tip">
                            <div class="btn-close"><a id="payment-tool-tip-close" href=""><img alt="" src="https://d20w110bpmr136.cloudfront.net/images/core/btn_window_close.gif"></a></div>
                            <div class="block-content"><img alt="" src="https://d20w110bpmr136.cloudfront.net/images/core/cvv.gif"></div>
                        </div>
                        <div class="ui-formRow payment-method">
                            <div class="collection pbs">
                                <input id="bankTransfer" value="BankTransfer" class="payment-method-option ui-inputRadio lfloat" type="radio" name="PaymentMethodForm[payment_method]">        <label for="bankTransfer"><strong>Chuyển khoản Ngân hàng</strong></label>
                            </div>
                        </div>
                        <div class="payment-disabled-msg" style="display: none;">
                            Phương thức thanh toán này không áp dụng cho một số khu vực thuộc TP.HCM, Hà Nội và Bà Rịa - Vũng Tàu    <div class="arrow"></div>
                        </div>
                        <div class="ui-formRow payment-method-form payment-method-bankTransfer" style="margin: 0 0 15px 25px;display:none;">
                            <div class="creditcard-small creditcard-master-small ui-listItem icon i-payVietinBank" title="VietinBank">VCB</div>
                            <div style="color: rgb(145, 145, 145); font-size: 11px; margin-top: 5px;">Thông tin tài khoản của ZALORA và hướng dẫn sẽ được gửi đến hộp thư của quý khách.</div>
                        </div><div style="display: none" id="payment-tool-tip-recurring" class="checkout-tool-tip">
                            <div class="btn-close"><a id="payment-tool-tip-close-recurring" href=""><img alt="" src="https://d20w110bpmr136.cloudfront.net/images/core/btn_window_close.gif"></a></div>
                            <div class="block-content"><img alt="" src="https://d20w110bpmr136.cloudfront.net/images/core/cvv.gif"></div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="fl" style="width: 320px; margin: -54px -25px 0px 25px;">
            <div class="box-hd checkout-step-title">
                <h2 class="h2 ui-formTitle pts">3. Đơn hàng</h2>
            </div>
            <div class="box-bd box-bdr white-box">
                <fieldset class="ui-fieldset">
                    <div id="checkoutGrandTotal">
                        <table id="checkoutCart" class="ui-grid ui-gridFull">
                            <thead class="fsn fwn ui-formHeader">
                                <tr>
                                    <th class="pbs article txtLeft">Sản phẩm</th>
                                    <th class="pbs amount">SL</th>
                                    <th class="pbs total txtRight">Giá </th>
                                </tr>
                            </thead>
                            <tbody class="cartItems">
                                <?php foreach ($products as $product): ?>                        
                                    <tr classs="ui-borderBottom">
                                        <td class="article pas txtLeft vMid">
                                            <div class="mrs  cart-img">                                            
                                                <img src="<?php echo $product['image'] ?>" />
                                            </div>

                                            <div class="cart-txt">
                                                <div><span class="ui-formDetailLabel txtDarkGray"><?php echo $product['name'] ?></span></div>
                                                <div class="txtDark ui-formDetailLabel">Từ Website:http//www.ennergie.com</div>
                                                <div>
                                                    <div class="txtDarkGray ui-formDetailLabel">
                                                        <p>Size: 41.5</p>
                                                        <p>Màu: Be</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                        <td class="amount pas txtCenter ui-formRow txtDark sel-cart-quantity-NE840SE21NLAVN-215818"><?php echo $product['quantity'] ?></td>
                                        <td class="total pas txtRight ui-formRow txtDark sel-cart-item-total-NE840SE21NLAVN-215818"><?php echo $product['price'] ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                        <table id="checkoutCart" class="ui-grid ui-gridFull">
                            <tfoot class="cartSummary txtLeft">
                                <?php foreach($totals as $total):?>
                                <tr class="uc txtDark frm_register">
                                    <td class="txtRight" width="60%"><?php echo $total['title'] ?></td>
                                    <td class="value hRght sel-subtotal" width="*"><?php echo $total['text'] ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tfoot>
                        </table>
                        <div style=" text-align:left; margin:20px 0px; ">
                            <span id="coupon-label" class="ui-formHeader strong mrs" style="font-weight:bold">MÃ GIẢM GIÁ/ĐIỂM TÍN DỤNG</span>
                            <span id="coupon-body"><!--If you have a coupon add here.-->
                                <input class="ui-inputText mls" name="couponcode" id="coupon" type="text" placeholder="Điền mã giảm giá vào đây" "="">
                                <span id="couponSendButton" class="iUse2Box">
                                    <input class="voucher-code-btn-checkout mls iUse2 newIconsWithoutText sel-coupon-button" value="Sử dụng" type="button" id="couponSend">
                                    <span class="iUse2RightEdge">&nbsp;</span>
                                </span>

                            </span>
                        </div><div id="salesrule-set-promo" style="display: none; text-align: left; margin: 20px 0px 0px; ">
                            <h4 style="line-height: 25px;" id="salesrule-set-name">&nbsp;</h4>
                            <span style="font-size:11px;" id="salesrule-set-description">&nbsp;</span><br><br>
                            <input class="voucher-code-btn-checkout" value="Redeem" type="button" id="applySalesRule" data-salesrule-id="0">
                        </div></div>
                </fieldset>
            </div>

            <div class="mtl">
                <a href="javascript:void(0)">
                    <button id="checkoutBtn" class="rfloat ui-button ui-buttonCta iBuyNow newIconsWithoutText sel-checkout-send" type="submit" style="opacity: 1;">
                        <span class="fontUTM" style="padding-left: 15px; padding-right: 15px; color: #000;">thanh toán và tới trang theo dõi đơn hàng</span>
                    </button>
                </a>
            </div>
        </div>
    </div>
</form>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
<script type="text/javascript"><!--
    $('#checkoutBtn').live('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/checkout/validate', 
            type: 'post',
            data: $('form').serialize(),
            dataType: 'json',		
            success: function(json) {
                $('.warning, .error').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    
                    if (json['error']['warning']) {		
                        $('.warning').fadeIn('slow');
                    }
								
                    if (json['error']['firstname']) {
                        $('form input[name=\'firstname\']').parent().after('<span class="error">' + json['error']['firstname'] + '</span>');
                    }
				
                    if (json['error']['email']) {
                        $('form input[name=\'email\']').parent().after('<span class="error">' + json['error']['email'] + '</span>');
                    }
				
                    if (json['error']['password']) {
                        $('form input[name=\'password\']').parent().after('<span class="error">' + json['error']['password'] + '</span>');
                    }
				
                    if (json['error']['confirm']) {
                        $('form input[name=\'confirm\']').parent().after('<span class="error">' + json['error']['confirm'] + '</span>');
                    }
				
                    if (json['error']['telephone']) {
                        $('form input[name=\'telephone\']').parent().after('<span class="error">' + json['error']['telephone'] + '</span>');
                    }	
																		
                    if (json['error']['address_1']) {
                        $('form input[name=\'address_1\']').parent().after('<span class="error">' + json['error']['address_1'] + '</span>');
                    }	
                    
                    if (json['error']['zone']) {
                        $('form select[name=\'zone_id\']').parent().after('<span class="error">' + json['error']['zone'] + '</span>');
                    }	
                    
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/checkout/order',
                        dataType: 'json',
                        type: 'post',
                        data: $('form').serialize(),
                        success: function(json) {
                            if (json['redirect']) {
                                location = json['redirect'];
                            }
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });	
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });	
    });
    //--></script> 



<script type="text/javascript"><!--
    $('select[name=\'country_id\']').bind('change', function() {
        $.ajax({
            url: 'index.php?route=account/register/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/images/loading.gif" alt="" /></span>');
            },
            complete: function() {
                $('.wait').remove();
            },			
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('#postcode-required').show();
                } else {
                    $('#postcode-required').hide();
                }
			
                html = '<option value="">Chọn tỉnh</option>';
			
                if (json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }
	
                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }
			
                $('select[name=\'zone_id\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
    //--></script> 
<script type="text/javascript">
    <?php echo $footer; ?>