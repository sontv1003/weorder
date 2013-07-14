<?php echo $header; ?>
<div id="content">
    <?php echo $content_top; ?>
    <div id="ttcanhan">
        <img id="ck" src="<?php echo HTTP_SERVER; ?>image/camket.jpg">
        <ul>
            <li class="ttcn ttcnd ">
                <a href="<?php echo $account_info_href; ?>">
                    <?php
                    if (!empty($account_avatar)) {
                        $avatar = HTTP_SERVER.$account_avatar;
                    } else {
                        $avatar = HTTP_SERVER.'image/avatar_default.png';
                    }
                    ?>
                    <img class="avatar" src="<?php echo $avatar; ?>" id="kh" width="80px">
                </a>
                <a style="margin-left: 30px;" href="<?php echo $account_info_href; ?>">thông tin cá nhân</a>
            </li>
            <li class="ttcc"><a href="<?php echo $account_order_info_href; ?>">danh sách đơn hàng cá nhân</a></li>
            <li class="ttcn"><a href="<?php echo $account_transaction_href; ?>">thu chi tài chính</a></li>
            <li class="ttcc"><a href="<?php echo $account_order_info_href; ?>">khiếu nại</a></li>
        </ul>
    </div>
    <h1 id="ls" style="margin: 10px auto !important;">thu chi tài chính</h1>
    <h1 class="qui" style="font-family: 'UTM_Bebas'; font-size: 20px; margin-bottom: 30px;">lịch sử giao dịch</h1>
    <p style="font-size: 16px; font-family: 'UTM_Bebas';"><?php echo $text_total; ?>&nbsp;&nbsp;<span style="color:#f00; font-size: 16px;"><?php echo $total; ?></span></p>
    <table>
        <tr>
            <td width="80px" align="left"><h2 class="qui" style="margin:0px;">Lọc theo:</h2></td>
            <td width="25px" align="left"><label for="BillingAddressForm_gender" style="font-size:17px; font-family: 'UTM_Bebas'; color: #000;">Quí</label></td>
            <td width="70px" align="left">                <div id="gender_select" class="collection">
                    <select id="BillingAddressForm_gender" name="BillingAddressForm[gender]">
                        <option selected="selected" value="">Chọn</option>
                        <option value="male">Tất cả</option>
                        <option value="female">cả tất</option>
                    </select>                    
                </div>
            </td>
            <td width="30px" align="left">
                <label for="BillingAddressForm_gender" style="font-size:17px; font-family: 'UTM_Bebas'; color: #000;">Năm</label>        
            </td>
            <td width="70px" align="left">
                <div id="gender_select" class="collection">
                    <select id="BillingAddressForm_gender" name="BillingAddressForm[gender]">
                        <option selected="selected" value="">Chọn</option>
                        <option value="male">Tất cả</option>
                        <option value="female">cả tất</option>
                    </select>                    
                </div>
            </td>
            <td width="*" align="left">
                <button type="button">Tìm kiếm</button>
            </td>
        </tr>
    </table>
    <br/>
    <br/>   
    <table id="thuchitaichinh" style="border-collapse: collapse; border: 1px solid #000;" width="100%">
        <tr>
            <th>Ngày</th>
            <th>Mã đơn hàng</th>
            <th>Tiền hóa đơn</th>
            <th>Tiền nạp</th>
            <th>Công nợ</th>
            <th>Trạng thái</th>
        </tr>
        <?php if ($transactions) {
     echo '<pre>' . print_r($transactions, true) . '</pre>';
            
            ?>
            <?php foreach ($transactions as $transaction) { ?>
                <tr>
                    <td><span>30/4/2013</span></td>
                    <td><span style="color: #09F;">tmđ 1-30/4/2013</span></td>
                    <td><span style="color: #060;">30.000.000vnđ</span></td>
                    <td><span style="color: #930;">±20.000.000 vnđ</span></td>
                    <td><span style="color: #c00;">30.250.000</span></td>
                    <td><span style="color: #09F;">đã hoàn thành giao dịch</span></td>
                </tr>
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td class="center" colspan="7" style="text-align: left"><span style="font-family: Arial; font-size: 16px; color: #f00;"><?php echo $text_empty; ?></span></td>
            </tr>
        <?php } ?>
    </table>
    <div class="clearfix"></div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>