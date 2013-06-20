<?php echo $header; ?>
<div id="content">    
    <?php $status_id = (!empty($_GET['status_id'])) ? $_GET['status_id'] : ''; ?>
    <div id="ttcanhan">
        <img src="<?php echo HTTP_SERVER; ?>image/camket.jpg" id="ck">
        <ul>
            <li class="ttcn ttcnd "><img src="images/tranminhduc.png" id="kh"><a href="<?php echo $account_info_href; ?>">thông tin cá nhân</a></li>
            <li class="ttcc"><a href="<?php echo $account_order_info_href; ?>">danh sách đơn hàng cá nhân</a></li>
            <li class="ttcn"><a href="<?php echo $account_transaction_href; ?>" href="thuchitaichinh.html">thu chi tài chính</a></li>
            <li class="ttcc"><a href="<?php echo $account_order_info_href; ?>">khiếu nại</a></li>
        </ul>
    </div>

    <div class="clear-both"></div>
    <div style="  width:80%; margin:10px auto; padding:0px; ">
        <table width="100%" cellspacing="10px;" cellpadding="5px" bordercolor="#CCCCCC" align="center">
            <tbody>
                <tr>
                    <td align="center" colspan="5" class="font-chu"><span style="font-size:36px; margin-top:-10px;color:#333">Danh sách đơn hàng cá nhân</span></td>
                </tr>
                <tr bgcolor="#CCCCCC">
                    <td width="160px" bgcolor="#cdcdcd" align="center" style="background-color: #333;color: #FFFFFF; margin: 8px; vertical-align: middle;" class="font-chu boder-1">Đơn hàng</td>
                    <td width="20%" bgcolor="#cdcdcd" align="center" style="background-color: #333;color: #FFFFFF;margin: 8px; vertical-align: middle;" class="font-chu boder-1">Giao dịch thành công</td>
                    <td width="20%" bgcolor="#cdcdcd" align="center" style="background-color: #333;color: #FFFFFF; margin: 8px; vertical-align: middle;" class="font-chu boder-1">Đơn hàng bị hủy</td>
                    <td width="20%" bgcolor="#cdcdcd" align="center" style="background-color: #333; color: #FFFFFF; margin: 8px; vertical-align: middle;" class="font-chu boder-1">Đơn hàng chưa thanh toán</td>
                    <td width="*" bgcolor="#cdcdcd" align="center" style="background-color: #333; color: #FFFFFF; margin: 8px; vertical-align: middle;" class="font-chu boder-1">Đơn hàng đã thanh toán đang chờ mua</td>
                </tr>
                <tr bgcolor="#CCCCCC">
                    <td bgcolor="#cdcdcd" align="center" style="background-color: #333333; color: #FFFFFF; margin: 2px; vertical-align: middle;" class="boder-1 font-chu">Số lượng ( đơn )</td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(0, 0, 0); font-family: 'UTM_Avo'; font-size: 16px;" class="boder-1"><?php echo $summary_orders['Complete']['quantity']; ?></td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(0, 0, 0); font-family: 'UTM_Avo'; font-size: 16px;" class="boder-1"><?php echo $summary_orders['Canceled']['quantity']; ?></td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(0, 0, 0); font-family: 'UTM_Avo'; font-size: 16px;" class="boder-1"><?php echo $summary_orders['Pending']['quantity']; ?></td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(0, 0, 0); font-family: 'UTM_Avo'; font-size: 16px;;" class="boder-1"><?php echo $summary_orders['Processing']['quantity']; ?></td>
                </tr>
                <tr bgcolor="#CCCCCC">
                    <td bgcolor="#fff" align="center" style="background-color: #333333; color: #FFFFFF; margin: 2px; vertical-align: middle;" class="boder-1 font-chu">Trị Giá ( vnđ )</td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(000, 000, 000); font-family: 'UTM_Avo'; font-size: 16px;color:#f00" class="boder-1"><?php echo $summary_orders['Complete']['currency']; ?></td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(000, 000, 000); font-family: 'UTM_Avo'; font-size: 16px;color:#f00" class="boder-1"><?php echo $summary_orders['Canceled']['currency']; ?></td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(000, 000, 000); font-family: 'UTM_Avo'; font-size: 16px;color:#f00" class="boder-1"><?php echo $summary_orders['Pending']['currency']; ?></td>
                    <td bgcolor="#fff" align="center" style="margin: 2px; background-color: rgb(153, 153, 153); border: 1px solid rgb(000,000, 000); font-family: 'UTM_Avo'; font-size: 16px; color:#f00" class="boder-1"><?php echo $summary_orders['Processing']['currency']; ?></td>
                </tr>
            </tbody></table>
        <div class="clear-both"></div>
    </div>

    <div id="timkiemmahang">
        <ul>
            <li style="width:295px">Tìm Kiếm mã đơn hàng <input id="order_id" type="text" style="width:174px; height:30px; border:1px solid #000"></li>
            <li style="width:166px">Từ ngày/tháng <input id="order_from" type="text" style="width:80px; height:30px; border:1px solid #000"></li>

            <li style="width:174px">Đến ngày/tháng <input id="order_to" type="text" style="width:80px; height:30px; border:1px solid #000"></li>

            <li style="width:113px">năm <input id="order_year" type="text" style="width:80px; height:30px; border:1px solid #000"></li>

            <li style="width:202px">
                <button style="border: 1px solid rgb(51, 51, 51); background-color: rgb(51, 51, 51); margin-left: -13px; width: 215px; height: 34px;" type="button" id="tim">
                    <a href="#">tìm</a>
                </button>
            </li>

        </ul>
    </div>
    <div class="clear"></div>
    <div style="width:100%; margin:0px auto; padding:0px;">
        <ul id="tatcadonhang">
            <li>
                <a href="javascript:void(0)" class="filter_selected">
                    <input type="hidden" class="filter_status_id" value ="" />
                    <input type="button" value="Tất cả đơn hàng" style="background-color:#666">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <input type="hidden" class="filter_status_id" value ="1" />
                    <input type="button" value="Chưa Thanh Toán" style="background-color:#666">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <input type="hidden" class="filter_status_id" value ="15" />
                    <input type="button" value="Đã Thanh Toán" style="background-color:#666">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <input type="hidden" class="filter_status_id" value ="3" />
                    <input type="button" value="Đã Mua Xong" style="background-color:#666">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <input type="hidden" class="filter_status_id" value ="3" />
                    <input type="button" value="Đã Giao hàng" style="background-color:#666">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <input type="hidden" class="filter_status_id" value ="0" />
                    <input type="button" value="Đã Nhận hàng" style="background-color:#666">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <input type="hidden" class="filter_status_id" value ="10" />
                    <input type="button" value="Khiếu Nại" style="background-color:#666">
                </a>
            </li>
        </ul><table width="100%" cellspacing="10px;" cellpadding="5px" bordercolor="#CCCCCC" align="center">

        </table>
    </div>

    <div class="clearfix"></div>

    <div style="  width:100%; margin:0px auto; padding:0px; ">
        <table class="cartTable ui-gridFull">
            <tbody class="cartHead">
                <tr class="ui-borderTop ui-borderRight ui-borderLeft">
                    <th width="15%" align="center" style=" background-color:#000; color: #fff; vertical-align: middle;" class="font-chu">Mã đơn hàng</th>
                    <th width="30%" align="center" style=" background-color:#000; color: #fff;" class="font-chu">Ghi chú</th>
                    <th width="15%" align="center" style=" background-color:#000; color: #fff;" class="font-chu">tổng tiền</th>
                    <th width="10%" align="center" style=" background-color:#000; color: #fff;" class="font-chu">Số llượng</th>
                    <th width="20%" align="center" style=" background-color:#000; color: #fff;" class="font-chu">Trạng thái</th>
                    <th width="*" align="center" style=" background-color:#000; color: #fff;" class="font-chu">Xem</th>
                </tr>
            </tbody>
            <tbody id="tdLists">
                <?php if ($orders) { ?>
                    <?php foreach ($orders as $order) { ?>
                        <tr class="ui-border">
                            <th width="15%" align="center" class="v_center" style="padding-top: 10px; padding-bottom: 10px;">
                                <a href="<?php echo $order['href']; ?>">#<?php echo $order['order_id']; ?> - <?php echo $order['date_added']; ?></a>
                            </th>
                            <th width="30%" align="center" class="boder-1 v_center">
                                <textarea onfocus="this.value=''; this.onfocus=null;" style="border: 1px solid;
                                          color: #999999;width: 200px !important;
                                          height: 19px; margin-top:10px" name="domainNameInput2" id="domainNameInput2" class="txt-reg-domain"> 

                                </textarea>
                                <a href="#"><img style="margin:10px 0px 0px 4px" src="<?php echo HTTP_SERVER; ?>image/save-icon.png"></a>
                            </th>
                            <th width="15%" align="center" valign="middle" class="boder-1 v_center"><?php echo $order['total']; ?></th>
                            <th width="10%" align="center" valign="middle" class="boder-1 v_center"><?php echo $order['products']; ?></th>
                            <th width="20%" align="center" valign="middle" class="boder-1 v_center"><span id="tt"><?php echo $order_status[$order['status']]; ?></span></th>
                            <th width="*" align="center" valign="middle" class="boder-1 v_center"><a href="<?php echo $order['href']; ?>">Chi tiết</a></th>
                        </tr>
                        <?php
                    }
                } else {
                    ?>
                    <tr class="ui-border">
                        <td colspan="6"><p style="margin-left: 20px; margin-top: 10px; color: #ff0000; font-size: 16px;">Bạn không có đơn hàng nào</p></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>

    <div class="clearfix"></div>
    <div class="pagination"><?php echo $pagination; ?></div>
    <?php echo $content_bottom; ?></div>
    <?php echo $footer; ?>

<script type="text/javascript"><!--
    
$('#tatcadonhang a').click('click', function() {
    filter(0, $(this));
});

function filter(status, obj) {
    var status_id;
    if(status==0) {
        status_id = $('.filter_status_id', obj).val();
    } else {
        status_id = $('.filter_status_id', '#tatcadonhang .filter_selected').val();
    }
    
    $.ajax({
        url: 'index.php?route=account/order/ajax_order',
        dataType: 'html',
        data: {
            status_id: status_id,
            order_id: $('#order_id').val(), 
            order_from: $('#order_from').val(), 
            order_to: $('#order_to').val(), 
            order_year: $('#order_year').val()
        },
        beforeSend: function() {
            $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/images/loading.gif" alt="" /></span>');
        },
        complete: function() {
            $('.wait').remove();
            if(status==0) {
                $('#tatcadonhang a').removeClass('filter_selected');
                obj.addClass('filter_selected');
            }
        },			
        success: function(data) {
            $('#tdLists').html(data);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
$('#tim').click('click', function() {
    filter(1, $(this));
});
    //--></script>