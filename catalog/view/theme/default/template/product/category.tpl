<?php echo $header; ?>
<div class="columns clearfix">
    <div class="l-sidebar">
        <?php echo $column_left; ?>
        
    </div>
    <div class="l-main">
        <?php echo $content_top; ?>
        <div id="product-list-filters">

            <div class="pathway-items">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                <?php } ?>
            </div>

            <div class="filter-display">
                <span><?php echo $text_sort; ?></span>
                <select onchange="location = this.value;">
                    <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
                <span style="margin-left: 10px;"><?php echo $text_limit; ?></span>
                <select onchange="location = this.value;" id="itemsPerPage9">
                    <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </div>

        </div>
        <div class="list-product">
            <ul>
                <?php foreach ($products as $product) {
                    ?>
                    <li class="ajax_block_product">
                        <div class="mousehover">
                            <?php if ($product['thumb']) { ?>
                                <div class="fader"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                            <?php } ?>
                        </div>
                        <div class="list_thumbnail">
                            <div class="manufacturer-product">
                                <span class="product-date"><?php echo date('d/m/Y', strtotime($product['date'])); ?></span>
                                <?php if (!empty($product['man_thumb'])) { ?>
                                    <img src="<?php echo $product['man_thumb'] ?>" />
                                <?php } ?>
                            </div>
                            <?php
                            $i = 0;
                            foreach ($product['thumbs'] as $thumb) {
                                $i++;
                                if ($i <= 3) {
                                    ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb['thumb'] ?>" /></a>
                                <?php }
                            }
                            ?>
                        </div>
                        <div id="tinsp">
                            <ul>
                                <li><p class="aosomi"><?php echo $product['name']; ?></p></li>
                                <li><p class="xemlink" style="margin-top: -5px; margin-bottom: -5px;"><a href="<?php echo $product['link']; ?>" target="_blank">Xem link</a></p></li>
                                <li>
                                    <p class="pro_description"><?php echo $product['sort_description']; ?></p>
                                </li>
                                <li class="price">
                                        <?php if (!$product['special']) { ?>
                                        <p class="size" >Giá:
                                            <span style="color: #BF0000; font-weight: bold;"><?php echo $product['price']; ?></span>
                                        </p>
                                    <?php } else { ?>
                                        <span class="price-old size">Giá: <?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                    <?php } ?>
    <?php if ($product['tax']) { ?>
                                        <br />
                                        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
    <?php } ?>
                                </li>                                
                                <li>
                                    <div class="cart">
                                        <button class="float-l" onclick="addToCart('<?php echo $product['product_id']; ?>');" /><?php echo $button_cart; ?></button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
<?php } ?>
            </ul>
        </div>

        <div class="pagination" style="margin-top: 30px;"><?php echo $pagination; ?></div>

    </div>

</div>




<script type="text/javascript"><!--
    function display(view) {
        if (view == 'list') {
            $('.product-grid').attr('class', 'product-list');
		
            $('.product-list > div').each(function(index, element) {
                html  = '<div class="right">';
                html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
                html += '</div>';			
			
                html += '<div class="left">';
			
                var image = $(element).find('.image').html();
			
                if (image != null) { 
                    html += '<div class="image">' + image + '</div>';
                }
			
                var price = $(element).find('.price').html();
			
                if (price != null) {
                    html += '<div class="price">' + price  + '</div>';
                }
					
                html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
                html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
                var rating = $(element).find('.rating').html();
			
                if (rating != null) {
                    html += '<div class="rating">' + rating + '</div>';
                }
				
                html += '</div>';
						
                $(element).html(html);
            });		
		
            $('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
            $.totalStorage('display', 'list'); 
        } else {
            $('.product-list').attr('class', 'product-grid');
		
            $('.product-grid > div').each(function(index, element) {
                html = '';
			
                var image = $(element).find('.image').html();
			
                if (image != null) {
                    html += '<div class="image">' + image + '</div>';
                }
			
                html += '<div class="name">' + $(element).find('.name').html() + '</div>';
                html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
                var price = $(element).find('.price').html();
			
                if (price != null) {
                    html += '<div class="price">' + price  + '</div>';
                }
			
                var rating = $(element).find('.rating').html();
			
                if (rating != null) {
                    html += '<div class="rating">' + rating + '</div>';
                }
						
                html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
                $(element).html(html);
            });	
					
            $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
            $.totalStorage('display', 'grid');
        }
    }

    view = $.totalStorage('display');

    if (view) {
        display(view);
    } else {
        display('list');
    }
    //--></script> 
<script type="text/javascript"><!--
    $(document).ready(function() {
        $('.colorbox').colorbox({
            width: 640,
            height: 480
        });
    });
    //--></script> 
<?php echo $footer; ?>

