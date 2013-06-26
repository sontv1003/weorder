<?php if ($orders) { ?>
    <?php foreach ($orders as $order) { ?>
        <tr class="ui-border">
            <th width="15%" class="v_center" align="center" valign="middle" style="padding-top: 10px; padding-bottom: 10px;">
                <a href="<?php echo $order['href']; ?>">#<?php echo $order['order_id']; ?> - <?php echo $order['date_added']; ?></a>
            </th>
            <th width="30%" align="center" valign="middle" class="boder-1 v_center">
        <div class="order_note" style="position: relative;">
            <textarea class="txt_note" style="border: 1px solid; color: #333; width: 200px !important; height: 25px; margin-top: 4px;"><?php echo $order['note']; ?></textarea>
            <a href="javascript:void(0)" class="update_note">
                <input type="hidden" value="<?php echo $order['order_id']; ?>" class="hidden_order_id" />
                <img style="margin:6px 0px 0px 4px" src="<?php echo HTTP_SERVER; ?>image/save-icon.png">
            </a>
        </div>
        </th>
        <th width="15%" align="center" valign="middle" class="boder-1 v_center"><?php echo $order['total']; ?></th>
        <th width="10%" align="center" valign="middle" class="boder-1 v_center"><?php echo $order['products']; ?></th>
        <th width="20%" align="center" valign="middle" class="boder-1 v_center"><span id="tt"><?php echo $order['status']; ?></span></th>
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