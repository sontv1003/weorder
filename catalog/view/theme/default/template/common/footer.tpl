<div class="clearfix" id="footer">
    <div>
        <div class="float-l" id="tmfooterlinks">
            <?php if ($informations) { ?>
            <div id="gct">
                <h4><?php echo $text_information; ?></h4>
                <ul>
                  <?php foreach ($informations as $information) { ?>
                  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                  <?php } ?>
                </ul>
            </div>
            <?php } ?>           

            <div id="knv">
              <h4>Kết nối với weorder</h4>
              <ul>
                <li><a href="#"><img src="<?php echo HTTP_SERVER; ?>/image/facebook1.png" id="face"></a></li>
                <li><a href="#"><img src="<?php echo HTTP_SERVER; ?>/image/gmail1.png" id="emaill"></a></li>
              </ul>
            </div>
            
            <div id="ckct">
                <h4><?php echo $text_account; ?></h4>
                <ul>
                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                  <!--<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>-->
                </ul>
            </div>
            <p>&copy; 2012 Powered by <a href="http://www.weorder.vn/">Weorder.vn</a>&trade;. All rights reserved</p>
            
          </div>
          <div class="float-r" id="tmfooterright">
            <div class="ui-formRow">
              <p class="fsm strong dknq"> Đăng ký để nhận các thông tin của chúng tôi </p>
              <div class="collection">
                <form position="nl_footer_notification" method="post" action="/newsletter/validate/" class="newsletter-signup">
                  <input type="email" name="newsletter[email]" required="" placeholder="Địa chỉ email" class="input-text">
                  <button value="female" name="newsletter[gender]" type="submit" class="float-l">Đăng ký</button>
                </form>
              </div>
            </div>
            <div style="margin-bottom:0px;" class="clr-both"></div>
            <p></p>
          </div>
          
          <!-- [[%FOOTER_LINK]] -->
        </div>
      </div>



<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered"><?php echo $powered; ?></div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
</div>
</div>
</body></html>