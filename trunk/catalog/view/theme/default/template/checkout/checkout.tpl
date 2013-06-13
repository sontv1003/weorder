<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="unit size1of3 vTop checkoutCol1 mrs">
    <div class="mrs">
        <div class="box-hd checkout-step-title timba" style="margin-top: 25px;">
            <h2 class="h2 ui-formTitle">1. Thông tin khách hàng</h2>
        </div>
        <div class="box-bd box-bdr white-box" style="width:331px; float:left; padding-top: 20px;">
            <input id="loggedInCustomer" name="loggedInCustomer" type="hidden" value="1">
            <fieldset id="checkout-address" class="ui-fieldset">
                <div class="ui-formRow frm_register">
                    <p style="background-color:#000; width:44px; color:#fff">E-Mail<input name="email" placeholder="Điền Email vào đây nhé" type="text" style="width:174px; height:25px; border:1px solid #000; padding-left:5px"></p>  
                    <p style="background-color:#000; width:58px; color:#fff">họ và tên<input name="fullname" id="ht" placeholder="Họ và tên" type="text" style="width:174px; height:25px; border:1px solid #000; padding-left:5px"></p>        
                    <p style="background-color:#000; width:79px; color:#fff">số điện thoại<input name="mobile" id="sdt" placeholder="Số điện thoại" type="text" style="width:174px; height:25px; border:1px solid #000; padding-left:5px"></p>      
                    <p style="background-color:#000; width:63px; color:#fff">ngày sinh</p>
                    <select style="width:62px; margin:-35px 0px  0px 71px;height:25px ; position:absolute" id="BillingDate" name="date">
                        <option value="">ngày</option>
                        <?php for($i = 1; $i <= 31; $i++): ?> 
                        <option value="<?php echo $i ?>"><?php echo $i ?></option>
                        <?php endfor; ?>
                    </select>    

                    <select style="width:62px; margin:-35px 0px  0px 132px;height:25px ; position:absolute" id="BillingMonth" name="month">
                        <option value="">tháng</option>
                        <?php for($i = 1; $i <= 12; $i++): ?> 
                        <option value="<?php echo $i ?>"><?php echo $i ?></option>
                        <?php endfor; ?>
                    </select>    

                    <select style="width:62px; margin:-35px 0px  0px 193px;height:25px ; position:absolute" id="BillingYear" name="year">
                        <option value="">năm</option>
                        <?php for($i = date('Y')-10; $i > 1900; $i--): ?> 
                        <option value="<?php echo $i ?>"><?php echo $i ?></option>
                        <?php endfor; ?>
                    </select>    
                    <p style="background-color:#000; width:63px; color:#fff">Giới tính</p>
                    <select style="width:70px; margin:-35px 0px  0px 71px;height:25px ; position:absolute" id="BillingGender" name="gender">                        
                        <option>Nam</option>
                        <option>Nữ</option>
                    </select>
                    
                    <p style="background-color:#000; width:45px; color:#fff">địa chỉ<input name="address" id="dc" placeholder="Địa chỉ của bạn	" type="text" style="width: 244px; height:25px; border:1px solid #000; padding-left:5px"></p>      

                    <p style="background-color:#000; width:102px; color:#fff">Chọn Tỉnh/Thành</p>
                    <select style="width:92px; margin:-35px 0px  0px 110px;height:25px ; position:absolute" id="BillingProvice" name="provice">
                        <option value="">Chọn Tỉnh</option>
                        <option value="272">An Giang</option>
                        <option value="275">Bà Rịa - Vũng Tàu</option>
                        <option value="273">Bình Dương</option>
                        <option value="274">Bình Phước</option>
                        <option value="278">Bình Thuận</option>
                        <option value="261">Bình Định</option>
                        <option value="276">Bạc Liêu</option>
                        <option value="234">Bắc Giang</option>
                        <option value="233">Bắc Kạn</option>
                        <option value="235">Bắc Ninh</option>
                        <option value="277">Bến Tre</option>
                        <option value="236">Cao Bằng</option>
                        <option value="279">Cà Mau</option>
                        <option value="280">Cần Thơ</option>
                        <option value="262">Gia Lai</option>
                        <option value="238">Hà Giang</option>
                        <option value="239">Hà Nam</option>
                        <option value="232">Hà Nội</option>
                        <option value="240">Hà Tĩnh</option>
                        <option value="244">Hòa Bình</option>
                        <option value="243">Hưng Yên</option>
                        <option value="241">Hải Dương</option>
                        <option value="242">Hải Phòng</option>
                        <option value="283">Hậu Giang</option>
                        <option value="271">Hồ Chí Minh</option>
                        <option value="265">Khánh Hòa</option>
                        <option value="284">Kiên Giang</option>
                        <option value="264">Kon Tum</option>
                        <option value="246">Lai Châu</option>
                        <option value="285">Long An</option>
                        <option value="245">Lào Cai</option>
                        <option value="286">Lâm Đồng</option>
                        <option value="247">Lạng Sơn</option>
                        <option value="248">Nam Định</option>
                        <option value="249">Nghệ An</option>
                        <option value="250">Ninh Bình</option>
                        <option value="287">Ninh Thuận</option>
                        <option value="251">Phú Thọ</option>
                        <option value="266">Phú Yên</option>
                        <option value="267">Quảng Bình</option>
                        <option value="269">Quảng Nam </option>
                        <option value="270">Quảng Ngãi</option>
                        <option value="252">Quảng Ninh</option>
                        <option value="268">Quảng Trị</option>
                        <option value="288">Sóc Trăng</option>
                        <option value="253">Sơn La</option>
                        <option value="256">Thanh Hóa</option>
                        <option value="254">Thái Bình</option>
                        <option value="255">Thái Nguyên</option>
                        <option value="263">Thừa Thiên Huế</option>
                        <option value="290">Tiền Giang</option>
                        <option value="291">Trà Vinh</option>
                        <option value="257">Tuyên Quang</option>
                        <option value="289">Tây Ninh</option>
                        <option value="299">Vinh</option>
                        <option value="292">Vĩnh Long</option>
                        <option value="258">Vĩnh Phúc</option>
                        <option value="259">Yên Bái</option>
                        <option value="237">Điện Biên</option>
                        <option value="260">Đà Nẵng</option>
                        <option value="293">Đắk Lắk</option>
                        <option value="294">Đắk Nông</option>
                        <option value="281">Đồng Nai</option>
                        <option value="282">Đồng Tháp</option>
                    </select>   
                </div>

                <script type="text/javascript">
                    $('#BillingAddressForm_cell_phone').mask('999?99999999999999999', {placeholder : '' });
                    $('#BillingAddressForm_phone').mask('999?99999999999999999', {placeholder : '' });
                </script><!--https://jira.rocket-internet.de/browse/SEAFAS-5978-->
                <!--<div class="ui-formRow">
                        <div class="collection" id="address-2">
                                    </div>
                </div>-->

            </fieldset>
            <script type="text/javascript">
                $(document).ready(function(){
                    checkout.recalculateCartWithSelfPickup($("#shippingSelfPickup").is(":checked"));
                    $('#shippingAddressDifferent').click(function() {
                        checkout.loadDifferentShippingWithSelfPickup($(this));
                    });
                    var selfCollectionLocationId = 271;
                    // checkout_form_address('BillingAddressForm');
                    // checkout_form_address('ShippingAddressForm');
                    // checkout_form_address('AddressForm');
                    function handleSelfPickupBtn(){
                        var selectedRegion = $('#BillingAddressForm_fk_customer_address_region option:selected').val();
                        if(selectedRegion == selfCollectionLocationId){
                            $.get('/checkout/finish/selfPickup/', function(data) {
                                $('#shippingSelfPickupButtonDiv').slideDown(500, function() {
                                    $('#checkout-selfPickup').show();
                                    $('#checkout-selfPickup-content').html(data);
                                    $('#checkout .checkoutCol1').removeClass('scrolling');
                                    $('#checkoutAjaxLoader').hide();

                                });
                            });
                        }else{
                            checkout.recalculateCartWithSelfPickup(false);
                            $('#shippingAddressDifferent').attr('checked', true);
                            $('#shippingSelfPickupButtonDiv').slideUp(500, function() {
                                $('#checkout .checkoutCol1').removeClass('scrolling');
                                $('#checkoutAjaxLoader').hide();
                            });
                            $('#shippingSelfPickup').attr('checked', false);
                            $('#checkout-selfPickup-content').slideUp(500, function() {
                                $('#checkout .checkoutCol1').removeClass('scrolling');
                                $('#checkoutAjaxLoader').hide();
                                $('#checkout-selfPickup-content').html('');
                            });
                        }
                        _checkCodAvailability();
                    }
                    $(document).on('change', '#BillingAddressForm_fk_customer_address_region', function(){
                        handleSelfPickupBtn();

                    });
                    $('#BillingAddressForm_fk_customer_address_region').change();
                });
            </script>
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
                            <input type="checkbox" id="newsletter_signup" class="ui-inputCheckbox" name="newsletter_signup" value="1" checked="checked">
                            Đăng ký bản tin qua email                        </label>
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
                        <input type="hidden" name="PaymentMethod[empty]" value="1">
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
                                    <input id="cardName" type="hidden" name="PaymentMethodForm[parameter][cc_type]" value="">
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
                                            <label class=" required" for="CreditcardForm_cc_number">Số thẻ tín dụng <span class="required">*</span></label>                    <input name="PaymentMethodForm[parameter][cc_number]" class="ui-inputText" autocomplete="off" onkeydown="checkout.detectCard($(this));" onblur="checkout.detectCard($(this));" id="PaymentMethodForm_parameter_cc_number" type="text">                                        <div id="numberError" class="s-error msg" style="display:none">Số điện thoại không hợp lệ</div>
                                        </div>

                                        <div style="margin-top:8px" id="cc_holder">
                                            <label for="CreditcardForm_cc_holder" class="required">Tên thẻ <span class="required">*</span></label>                    <input name="PaymentMethodForm[parameter][cc_holder]" class="ui-inputText" autocomplete="off" id="PaymentMethodForm_parameter_cc_holder" type="text">                                    </div>

                                        <div style="margin-top:8px" id="cc_valid">
                                            <label for="CreditcardForm_cc_exp_month" class="required">Ngày hết hạn <span class="required">*</span></label>                    <select name="PaymentMethodForm[parameter][cc_exp_month]" style="width:54%" autocomplete="off" id="PaymentMethodForm_parameter_cc_exp_month">
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
                                            </select>                    <select name="PaymentMethodForm[parameter][cc_exp_year]" style="width:40%" autocomplete="off" id="PaymentMethodForm_parameter_cc_exp_year">
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
                                            <label for="CreditcardForm_cc_security_code" class="required">Mã xác minh <span class="required">*</span></label>                    <input name="PaymentMethodForm[parameter][cc_security_code]" style="width:40px" class="ui-inputText" autocomplete="off" id="PaymentMethodForm_parameter_cc_security_code" type="text">                    <a href="" class="cvv-what-is-this ui-formLabel ui-hint" id="cvv-what-is-this">Đây là gì?</a>
                                        </div>

                                        <div style="margin-top:10px" id="cc_save">
                                            <input id="ytPaymentMethodForm_parameter_cc_save" type="hidden" value="0" name="PaymentMethodForm[parameter][cc_save]"><input name="PaymentMethodForm[parameter][cc_save]" class="lfloat ui-inputCheckbox" checked="checked" value="1" id="PaymentMethodForm_parameter_cc_save" type="checkbox">                    <label for="CreditcardForm_cc_save">Lưu thông tin thẻ của tôi</label>                                    </div><div class="cc-vouchers-base"><style type="text/css">#voucher_box {border: 1px solid orange;}.voucher_tag {background: #F7F7F7;}.cc-vouchers-base {border: 1px solid orange; padding: 5px;}#salesrule-set-promo h4 {color: #f88b08;}#salesrule-set-promo span {font-size: 13px !important;}#salesrule-set-promo {border: 1px solid orange; background: #f7f7f7; padding: 10px;}#applySalesRule {color: #f88b08 ;font-weight: bold;padding: 3px 8px 5px 8px;border: 1px solid lightgrey;margin-left: 33%;}</style></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="display: none;" id="payment-tool-tip" class="checkout-tool-tip">
                            <div class="btn-close"><a id="payment-tool-tip-close" href=""><img alt="" src="https://d20w110bpmr136.cloudfront.net/images/core/btn_window_close.gif"></a></div>
                            <div class="block-content"><img alt="" src="https://d20w110bpmr136.cloudfront.net/images/core/cvv.gif"></div>
                        </div>
                        <script type="text/javascript">
                            $('#CreditcardForm_cc_number').mask('99999999999999?99999', {placeholder : '' });
                            $('#CreditcardForm_cc_security_code').mask('999?9', {placeholder : ''});
                        </script>
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
                        <script type="text/javascript">
                            $('#RecurringForm_cc_security_code').mask('999?9', {placeholder : ''});
                            $('#cvv-what-is-this-recurring,#payment-tool-tip-close-recurring').click(function(){
                                $("#payment-tool-tip-recurring").toggle($.show, $.hide);
                                return false;
                            });
                        </script>                </div>
                </fieldset>
            </div>
        </div>
        <div class="fl" style="width: 320px; margin: -54px -25px 0px 25px;">
            <div class="box-hd checkout-step-title">
                <h2 class="h2 ui-formTitle pts">3. Đơn hàng</h2>
            </div>
            <div class="box-bd box-bdr white-box">
                <fieldset class="ui-fieldset">
                    <div id="checkoutGrandTotal"><table id="checkoutCart" class="ui-grid ui-gridFull">
                            <thead class="fsn fwn ui-formHeader">
                                <tr>
                                    <th class="pbs article txtLeft">Sản phẩm</th>
                                    <th class="pbs amount">SL</th>
                                    <th class="pbs total txtRight">Giá </th>
                                </tr>
                            </thead>
                            <tbody class="cartItems">

                                <tr>
                                    <td class="article pas txtLeft vMid">
                                        <div class="mrs  cart-img">
                                            <img width="37" height="54" src="https://d20w110bpmr136.cloudfront.net/p/new-balance-9148-87397-1-gallery.jpg" onerror="$(this).attr('src','https://d20w110bpmr136.cloudfront.net/images/core/placeholder/placeholder-small.jpg');">
                                        </div>

                                        <div class="cart-txt">
                                            <div><span class="ui-formDetailLabel txtDarkGray">Ennergie</span></div>
                                            <div class="txtDark ui-formDetailLabel">Từ Website:http//www.ennergie.com</div>
                                            <div>
                                                <div class="txtDarkGray ui-formDetailLabel">
                                                    <p>Size: 41.5</p>
                                                    <p>Màu: Be</p>
                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                    <td class="amount pas txtCenter ui-formRow txtDark sel-cart-quantity-NE840SE21NLAVN-215818">1</td>
                                    <td class="total pas txtRight ui-formRow txtDark sel-cart-item-total-NE840SE21NLAVN-215818">1,199,000&nbsp;VND</td>
                                </tr>
                                <tr class="ui-borderBottom">
                                    <td class="article pas txtLeft vMid">
                                        <div class="mrs  cart-img">
                                            <img width="37" height="54" src="https://d20w110bpmr136.cloudfront.net/p/new-balance-9148-87397-1-gallery.jpg" onerror="$(this).attr('src','https://d20w110bpmr136.cloudfront.net/images/core/placeholder/placeholder-small.jpg');">
                                        </div>

                                        <div class="cart-txt">
                                            <div><span class="ui-formDetailLabel txtDarkGray">Ennergie</span></div>
                                            <div class="txtDark ui-formDetailLabel">Từ Website:http//www.ennergie.com</div>
                                            <div>
                                                <div class="txtDarkGray ui-formDetailLabel">
                                                    <p>Size: 41.5</p>
                                                    <p>Màu: Be</p>
                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                    <td class="amount pas txtCenter ui-formRow txtDark sel-cart-quantity-NE840SE21NLAVN-215818">1</td>
                                    <td class="total pas txtRight ui-formRow txtDark sel-cart-item-total-NE840SE21NLAVN-215818">1,199,000&nbsp;VND</td>
                                </tr>

                            </tbody>
                            <tfoot class="cartSummary txtLeft">
                                <tr class="uc txtDark frm_register">
                                    <td colspan="2" class="txtRight">Tổng cộng</td>
                                    <td class="value hRght sel-subtotal">1,199,000&nbsp;VND</td>
                                </tr>
                                <tr class="free-shipping">
                                    <td colspan="2" class="txtRight txtHighlight">Vận chuyển                                
                                    </td>
                                    <td class="value hRght txtHighlight sel-shipping-free">Miễn phí</td>
                                </tr>
                                <tr class="grandTotal frm_registerl uc txtDark">
                                    <td colspan="2" class="txtRight">Thành tiền</td>
                                    <td class="value hRght sel-total">1,199,000&nbsp;VND</td>
                                </tr>
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
                <a href="danh-sach-don-hang.html" target="_blank">
                    <button id="checkoutBtn" class="rfloat ui-button ui-buttonCta iBuyNow newIconsWithoutText sel-checkout-send" type="submit" style="opacity: 1;">
                        <span class="fontUTM" style="padding-left: 15px; padding-right: 15px; color: #000;">thanh toán và tới trang theo dõi đơn hàng</span>
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<?php echo $content_bottom; ?>
<script type="text/javascript"><!--
    $('#checkout .checkout-content input[name=\'account\']').live('change', function() {
        if ($(this).attr('value') == 'register') {
            $('#payment-address .checkout-heading span').html('<?php echo $text_checkout_account; ?>');
        } else {
            $('#payment-address .checkout-heading span').html('<?php echo $text_checkout_payment_address; ?>');
        }
    });

    $('.checkout-heading a').live('click', function() {
        $('.checkout-content').slideUp('slow');
	
        $(this).parent().parent().find('.checkout-content').slideDown('slow');
    });
<?php if (!$logged) { ?> 
        $(document).ready(function() {
            $.ajax({
                url: 'index.php?route=checkout/login',
                dataType: 'html',
                success: function(html) {
                    $('#checkout .checkout-content').html(html);
    				
                    $('#checkout .checkout-content').slideDown('slow');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });	
        });		
<?php } else { ?>
        $(document).ready(function() {
            $.ajax({
                url: 'index.php?route=checkout/payment_address',
                dataType: 'html',
                success: function(html) {
                    $('#payment-address .checkout-content').html(html);
    				
                    $('#payment-address .checkout-content').slideDown('slow');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });	
        });
<?php } ?>

    // Checkout
    $('#button-account').live('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').attr('value'),
            dataType: 'html',
            beforeSend: function() {
                $('#button-account').attr('disabled', true);
                $('#button-account').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
            },		
            complete: function() {
                $('#button-account').attr('disabled', false);
                $('.wait').remove();
            },			
            success: function(html) {
                $('.warning, .error').remove();
			
                $('#payment-address .checkout-content').html(html);
				
                $('#checkout .checkout-content').slideUp('slow');
				
                $('#payment-address .checkout-content').slideDown('slow');
				
                $('.checkout-heading a').remove();
				
                $('#checkout .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Login
    $('#button-login').live('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/login/validate',
            type: 'post',
            data: $('#checkout #login :input'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-login').attr('disabled', true);
                $('#button-login').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
            },	
            complete: function() {
                $('#button-login').attr('disabled', false);
                $('.wait').remove();
            },				
            success: function(json) {
                $('.warning, .error').remove();
			
                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    $('#checkout .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
				
                    $('.warning').fadeIn('slow');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });	
    });

    // Register
    $('#button-register').live('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/register/validate',
            type: 'post',
            data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-register').attr('disabled', true);
                $('#button-register').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
            },	
            complete: function() {
                $('#button-register').attr('disabled', false); 
                $('.wait').remove();
            },			
            success: function(json) {
                $('.warning, .error').remove();
						
                if (json['redirect']) {
                    location = json['redirect'];				
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                        $('.warning').fadeIn('slow');
                    }
				
                    if (json['error']['firstname']) {
                        $('#payment-address input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
                    }
				
                    if (json['error']['lastname']) {
                        $('#payment-address input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
                    }	
				
                    if (json['error']['email']) {
                        $('#payment-address input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
                    }
				
                    if (json['error']['telephone']) {
                        $('#payment-address input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
                    }	
					
                    if (json['error']['company_id']) {
                        $('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
                    }	
				
                    if (json['error']['tax_id']) {
                        $('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
                    }	
																		
                    if (json['error']['address_1']) {
                        $('#payment-address input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
                    }	
				
                    if (json['error']['city']) {
                        $('#payment-address input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
                    }	
				
                    if (json['error']['postcode']) {
                        $('#payment-address input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
                    }	
				
                    if (json['error']['country']) {
                        $('#payment-address select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
                    }	
				
                    if (json['error']['zone']) {
                        $('#payment-address select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
                    }
				
                    if (json['error']['password']) {
                        $('#payment-address input[name=\'password\'] + br').after('<span class="error">' + json['error']['password'] + '</span>');
                    }	
				
                    if (json['error']['confirm']) {
                        $('#payment-address input[name=\'confirm\'] + br').after('<span class="error">' + json['error']['confirm'] + '</span>');
                    }																																	
                } else {
<?php if ($shipping_required) { ?>				
                                                        var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
    				
                                                        if (shipping_address) {
                                                            $.ajax({
                                                                url: 'index.php?route=checkout/shipping_method',
                                                                dataType: 'html',
                                                                success: function(html) {
                                                                    $('#shipping-method .checkout-content').html(html);
    							
                                                                    $('#payment-address .checkout-content').slideUp('slow');
    							
                                                                    $('#shipping-method .checkout-content').slideDown('slow');
    							
                                                                    $('#checkout .checkout-heading a').remove();
                                                                    $('#payment-address .checkout-heading a').remove();
                                                                    $('#shipping-address .checkout-heading a').remove();
                                                                    $('#shipping-method .checkout-heading a').remove();
                                                                    $('#payment-method .checkout-heading a').remove();											
    							
                                                                    $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');									
                                                                    $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	

                                                                    $.ajax({
                                                                        url: 'index.php?route=checkout/shipping_address',
                                                                        dataType: 'html',
                                                                        success: function(html) {
                                                                            $('#shipping-address .checkout-content').html(html);
                                                                        },
                                                                        error: function(xhr, ajaxOptions, thrownError) {
                                                                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                        }
                                                                    });	
                                                                },
                                                                error: function(xhr, ajaxOptions, thrownError) {
                                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                }
                                                            });	
                                                        } else {
                                                            $.ajax({
                                                                url: 'index.php?route=checkout/shipping_address',
                                                                dataType: 'html',
                                                                success: function(html) {
                                                                    $('#shipping-address .checkout-content').html(html);
    							
                                                                    $('#payment-address .checkout-content').slideUp('slow');
    							
                                                                    $('#shipping-address .checkout-content').slideDown('slow');
    							
                                                                    $('#checkout .checkout-heading a').remove();
                                                                    $('#payment-address .checkout-heading a').remove();
                                                                    $('#shipping-address .checkout-heading a').remove();
                                                                    $('#shipping-method .checkout-heading a').remove();
                                                                    $('#payment-method .checkout-heading a').remove();							

                                                                    $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
                                                                },
                                                                error: function(xhr, ajaxOptions, thrownError) {
                                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                }
                                                            });			
                                                        }
<?php } else { ?>
                                                        $.ajax({
                                                            url: 'index.php?route=checkout/payment_method',
                                                            dataType: 'html',
                                                            success: function(html) {
                                                                $('#payment-method .checkout-content').html(html);
    						
                                                                $('#payment-address .checkout-content').slideUp('slow');
    						
                                                                $('#payment-method .checkout-content').slideDown('slow');
    						
                                                                $('#checkout .checkout-heading a').remove();
                                                                $('#payment-address .checkout-heading a').remove();
                                                                $('#payment-method .checkout-heading a').remove();								
    						
                                                                $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
                                                            },
                                                            error: function(xhr, ajaxOptions, thrownError) {
                                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                            }
                                                        });					
<?php } ?>

                                                    $.ajax({
                                                        url: 'index.php?route=checkout/payment_address',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#payment-address .checkout-content').html(html);
							
                                                            $('#payment-address .checkout-heading span').html('<?php echo $text_checkout_payment_address; ?>');
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

                                    // Payment Address	
                                    $('#button-payment-address').live('click', function() {
                                        $.ajax({
                                            url: 'index.php?route=checkout/payment_address/validate',
                                            type: 'post',
                                            data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
                                            dataType: 'json',
                                            beforeSend: function() {
                                                $('#button-payment-address').attr('disabled', true);
                                                $('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },	
                                            complete: function() {
                                                $('#button-payment-address').attr('disabled', false);
                                                $('.wait').remove();
                                            },			
                                            success: function(json) {
                                                $('.warning, .error').remove();
			
                                                if (json['redirect']) {
                                                    location = json['redirect'];
                                                } else if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                                                        $('.warning').fadeIn('slow');
                                                    }
								
                                                    if (json['error']['firstname']) {
                                                        $('#payment-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
                                                    }
				
                                                    if (json['error']['lastname']) {
                                                        $('#payment-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
                                                    }	
				
                                                    if (json['error']['telephone']) {
                                                        $('#payment-address input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
                                                    }		
				
                                                    if (json['error']['company_id']) {
                                                        $('#payment-address input[name=\'company_id\']').after('<span class="error">' + json['error']['company_id'] + '</span>');
                                                    }	
				
                                                    if (json['error']['tax_id']) {
                                                        $('#payment-address input[name=\'tax_id\']').after('<span class="error">' + json['error']['tax_id'] + '</span>');
                                                    }	
														
                                                    if (json['error']['address_1']) {
                                                        $('#payment-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
                                                    }	
				
                                                    if (json['error']['city']) {
                                                        $('#payment-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
                                                    }	
				
                                                    if (json['error']['postcode']) {
                                                        $('#payment-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
                                                    }	
				
                                                    if (json['error']['country']) {
                                                        $('#payment-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
                                                    }	
				
                                                    if (json['error']['zone']) {
                                                        $('#payment-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
                                                    }
                                                } else {
<?php if ($shipping_required) { ?>
                                                        $.ajax({
                                                            url: 'index.php?route=checkout/shipping_address',
                                                            dataType: 'html',
                                                            success: function(html) {
                                                                $('#shipping-address .checkout-content').html(html);
    					
                                                                $('#payment-address .checkout-content').slideUp('slow');
    						
                                                                $('#shipping-address .checkout-content').slideDown('slow');
    						
                                                                $('#payment-address .checkout-heading a').remove();
                                                                $('#shipping-address .checkout-heading a').remove();
                                                                $('#shipping-method .checkout-heading a').remove();
                                                                $('#payment-method .checkout-heading a').remove();
    						
                                                                $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
                                                            },
                                                            error: function(xhr, ajaxOptions, thrownError) {
                                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                            }
                                                        });
<?php } else { ?>
                                                        $.ajax({
                                                            url: 'index.php?route=checkout/payment_method',
                                                            dataType: 'html',
                                                            success: function(html) {
                                                                $('#payment-method .checkout-content').html(html);
    					
                                                                $('#payment-address .checkout-content').slideUp('slow');
    						
                                                                $('#payment-method .checkout-content').slideDown('slow');
    						
                                                                $('#payment-address .checkout-heading a').remove();
                                                                $('#payment-method .checkout-heading a').remove();
    													
                                                                $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
                                                            },
                                                            error: function(xhr, ajaxOptions, thrownError) {
                                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                            }
                                                        });	
<?php } ?>
				
                                                    $.ajax({
                                                        url: 'index.php?route=checkout/payment_address',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#payment-address .checkout-content').html(html);
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

                                    // Shipping Address			
                                    $('#button-shipping-address').live('click', function() {
                                        $.ajax({
                                            url: 'index.php?route=checkout/shipping_address/validate',
                                            type: 'post',
                                            data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
                                            dataType: 'json',
                                            beforeSend: function() {
                                                $('#button-shipping-address').attr('disabled', true);
                                                $('#button-shipping-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },	
                                            complete: function() {
                                                $('#button-shipping-address').attr('disabled', false);
                                                $('.wait').remove();
                                            },			
                                            success: function(json) {
                                                $('.warning, .error').remove();
			
                                                if (json['redirect']) {
                                                    location = json['redirect'];
                                                } else if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#shipping-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                                                        $('.warning').fadeIn('slow');
                                                    }
								
                                                    if (json['error']['firstname']) {
                                                        $('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
                                                    }
				
                                                    if (json['error']['lastname']) {
                                                        $('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
                                                    }	
				
                                                    if (json['error']['email']) {
                                                        $('#shipping-address input[name=\'email\']').after('<span class="error">' + json['error']['email'] + '</span>');
                                                    }
				
                                                    if (json['error']['telephone']) {
                                                        $('#shipping-address input[name=\'telephone\']').after('<span class="error">' + json['error']['telephone'] + '</span>');
                                                    }		
										
                                                    if (json['error']['address_1']) {
                                                        $('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
                                                    }	
				
                                                    if (json['error']['city']) {
                                                        $('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
                                                    }	
				
                                                    if (json['error']['postcode']) {
                                                        $('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
                                                    }	
				
                                                    if (json['error']['country']) {
                                                        $('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
                                                    }	
				
                                                    if (json['error']['zone']) {
                                                        $('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
                                                    }
                                                } else {
                                                    $.ajax({
                                                        url: 'index.php?route=checkout/shipping_method',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#shipping-method .checkout-content').html(html);
						
                                                            $('#shipping-address .checkout-content').slideUp('slow');
						
                                                            $('#shipping-method .checkout-content').slideDown('slow');
						
                                                            $('#shipping-address .checkout-heading a').remove();
                                                            $('#shipping-method .checkout-heading a').remove();
                                                            $('#payment-method .checkout-heading a').remove();
						
                                                            $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');							
						
                                                            $.ajax({
                                                                url: 'index.php?route=checkout/shipping_address',
                                                                dataType: 'html',
                                                                success: function(html) {
                                                                    $('#shipping-address .checkout-content').html(html);
                                                                },
                                                                error: function(xhr, ajaxOptions, thrownError) {
                                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                }
                                                            });
                                                        },
                                                        error: function(xhr, ajaxOptions, thrownError) {
                                                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                        }
                                                    });	
				
                                                    $.ajax({
                                                        url: 'index.php?route=checkout/payment_address',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#payment-address .checkout-content').html(html);
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

                                    // Guest
                                    $('#button-guest').live('click', function() {
                                        $.ajax({
                                            url: 'index.php?route=checkout/guest/validate',
                                            type: 'post',
                                            data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
                                            dataType: 'json',
                                            beforeSend: function() {
                                                $('#button-guest').attr('disabled', true);
                                                $('#button-guest').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },	
                                            complete: function() {
                                                $('#button-guest').attr('disabled', false); 
                                                $('.wait').remove();
                                            },			
                                            success: function(json) {
                                                $('.warning, .error').remove();
			
                                                if (json['redirect']) {
                                                    location = json['redirect'];
                                                } else if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                                                        $('.warning').fadeIn('slow');
                                                    }
								
                                                    if (json['error']['firstname']) {
                                                        $('#payment-address input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
                                                    }
				
                                                    if (json['error']['lastname']) {
                                                        $('#payment-address input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
                                                    }	
				
                                                    if (json['error']['email']) {
                                                        $('#payment-address input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
                                                    }
				
                                                    if (json['error']['telephone']) {
                                                        $('#payment-address input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
                                                    }	
					
                                                    if (json['error']['company_id']) {
                                                        $('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
                                                    }	
				
                                                    if (json['error']['tax_id']) {
                                                        $('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
                                                    }	
																		
                                                    if (json['error']['address_1']) {
                                                        $('#payment-address input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
                                                    }	
				
                                                    if (json['error']['city']) {
                                                        $('#payment-address input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
                                                    }	
				
                                                    if (json['error']['postcode']) {
                                                        $('#payment-address input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
                                                    }	
				
                                                    if (json['error']['country']) {
                                                        $('#payment-address select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
                                                    }	
				
                                                    if (json['error']['zone']) {
                                                        $('#payment-address select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
                                                    }
                                                } else {
<?php if ($shipping_required) { ?>	
                                                        var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
    				
                                                        if (shipping_address) {
                                                            $.ajax({
                                                                url: 'index.php?route=checkout/shipping_method',
                                                                dataType: 'html',
                                                                success: function(html) {
                                                                    $('#shipping-method .checkout-content').html(html);
    							
                                                                    $('#payment-address .checkout-content').slideUp('slow');
    							
                                                                    $('#shipping-method .checkout-content').slideDown('slow');
    							
                                                                    $('#payment-address .checkout-heading a').remove();
                                                                    $('#shipping-address .checkout-heading a').remove();
                                                                    $('#shipping-method .checkout-heading a').remove();
                                                                    $('#payment-method .checkout-heading a').remove();		
    															
                                                                    $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
                                                                    $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');									
    							
                                                                    $.ajax({
                                                                        url: 'index.php?route=checkout/guest_shipping',
                                                                        dataType: 'html',
                                                                        success: function(html) {
                                                                            $('#shipping-address .checkout-content').html(html);
                                                                        },
                                                                        error: function(xhr, ajaxOptions, thrownError) {
                                                                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                        }
                                                                    });
                                                                },
                                                                error: function(xhr, ajaxOptions, thrownError) {
                                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                }
                                                            });					
                                                        } else {
                                                            $.ajax({
                                                                url: 'index.php?route=checkout/guest_shipping',
                                                                dataType: 'html',
                                                                success: function(html) {
                                                                    $('#shipping-address .checkout-content').html(html);
    							
                                                                    $('#payment-address .checkout-content').slideUp('slow');
    							
                                                                    $('#shipping-address .checkout-content').slideDown('slow');
    							
                                                                    $('#payment-address .checkout-heading a').remove();
                                                                    $('#shipping-address .checkout-heading a').remove();
                                                                    $('#shipping-method .checkout-heading a').remove();
                                                                    $('#payment-method .checkout-heading a').remove();
    							
                                                                    $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
                                                                },
                                                                error: function(xhr, ajaxOptions, thrownError) {
                                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                                }
                                                            });
                                                        }
<?php } else { ?>				
                                                        $.ajax({
                                                            url: 'index.php?route=checkout/payment_method',
                                                            dataType: 'html',
                                                            success: function(html) {
                                                                $('#payment-method .checkout-content').html(html);
    						
                                                                $('#payment-address .checkout-content').slideUp('slow');
    							
                                                                $('#payment-method .checkout-content').slideDown('slow');
    							
                                                                $('#payment-address .checkout-heading a').remove();
                                                                $('#payment-method .checkout-heading a').remove();
    														
                                                                $('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
                                                            },
                                                            error: function(xhr, ajaxOptions, thrownError) {
                                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                            }
                                                        });				
<?php } ?>
                                                }	 
                                            },
                                            error: function(xhr, ajaxOptions, thrownError) {
                                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                            }
                                        });	
                                    });

                                    // Guest Shipping
                                    $('#button-guest-shipping').live('click', function() {
                                        $.ajax({
                                            url: 'index.php?route=checkout/guest_shipping/validate',
                                            type: 'post',
                                            data: $('#shipping-address input[type=\'text\'], #shipping-address select'),
                                            dataType: 'json',
                                            beforeSend: function() {
                                                $('#button-guest-shipping').attr('disabled', true);
                                                $('#button-guest-shipping').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },	
                                            complete: function() {
                                                $('#button-guest-shipping').attr('disabled', false); 
                                                $('.wait').remove();
                                            },			
                                            success: function(json) {
                                                $('.warning, .error').remove();
			
                                                if (json['redirect']) {
                                                    location = json['redirect'];
                                                } else if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#shipping-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                                                        $('.warning').fadeIn('slow');
                                                    }
								
                                                    if (json['error']['firstname']) {
                                                        $('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
                                                    }
				
                                                    if (json['error']['lastname']) {
                                                        $('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
                                                    }	
										
                                                    if (json['error']['address_1']) {
                                                        $('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
                                                    }	
				
                                                    if (json['error']['city']) {
                                                        $('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
                                                    }	
				
                                                    if (json['error']['postcode']) {
                                                        $('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
                                                    }	
				
                                                    if (json['error']['country']) {
                                                        $('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
                                                    }	
				
                                                    if (json['error']['zone']) {
                                                        $('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
                                                    }
                                                } else {
                                                    $.ajax({
                                                        url: 'index.php?route=checkout/shipping_method',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#shipping-method .checkout-content').html(html);
						
                                                            $('#shipping-address .checkout-content').slideUp('slow');
						
                                                            $('#shipping-method .checkout-content').slideDown('slow');
						
                                                            $('#shipping-address .checkout-heading a').remove();
                                                            $('#shipping-method .checkout-heading a').remove();
                                                            $('#payment-method .checkout-heading a').remove();
							
                                                            $('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
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

                                    $('#button-shipping-method').live('click', function() {
                                        $.ajax({
                                            url: 'index.php?route=checkout/shipping_method/validate',
                                            type: 'post',
                                            data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
                                            dataType: 'json',
                                            beforeSend: function() {
                                                $('#button-shipping-method').attr('disabled', true);
                                                $('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },	
                                            complete: function() {
                                                $('#button-shipping-method').attr('disabled', false);
                                                $('.wait').remove();
                                            },			
                                            success: function(json) {
                                                $('.warning, .error').remove();
			
                                                if (json['redirect']) {
                                                    location = json['redirect'];
                                                } else if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#shipping-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                                                        $('.warning').fadeIn('slow');
                                                    }			
                                                } else {
                                                    $.ajax({
                                                        url: 'index.php?route=checkout/payment_method',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#payment-method .checkout-content').html(html);
						
                                                            $('#shipping-method .checkout-content').slideUp('slow');
						
                                                            $('#payment-method .checkout-content').slideDown('slow');

                                                            $('#shipping-method .checkout-heading a').remove();
                                                            $('#payment-method .checkout-heading a').remove();
						
                                                            $('#shipping-method .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
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

                                    $('#button-payment-method').live('click', function() {
                                        $.ajax({
                                            url: 'index.php?route=checkout/payment_method/validate', 
                                            type: 'post',
                                            data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
                                            dataType: 'json',
                                            beforeSend: function() {
                                                $('#button-payment-method').attr('disabled', true);
                                                $('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },	
                                            complete: function() {
                                                $('#button-payment-method').attr('disabled', false);
                                                $('.wait').remove();
                                            },			
                                            success: function(json) {
                                                $('.warning, .error').remove();
			
                                                if (json['redirect']) {
                                                    location = json['redirect'];
                                                } else if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
                                                        $('.warning').fadeIn('slow');
                                                    }			
                                                } else {
                                                    $.ajax({
                                                        url: 'index.php?route=checkout/confirm',
                                                        dataType: 'html',
                                                        success: function(html) {
                                                            $('#confirm .checkout-content').html(html);
						
                                                            $('#payment-method .checkout-content').slideUp('slow');
						
                                                            $('#confirm .checkout-content').slideDown('slow');
						
                                                            $('#payment-method .checkout-heading a').remove();
						
                                                            $('#payment-method .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
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
<?php echo $footer; ?>