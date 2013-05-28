<?php if (count($products) > 0) { ?>

    <section class="box box-bgcolor mtm">
        <div id="recommengine_recommendations">
            <div class="box box-bdr box-bgcolor mbm mtl sel-lastviewed-products-product" data-recommid="recommBox2">
                <h3 class="mam pbm ui-borderBottom"><?php echo $heading_title; ?></h3>
                <ul class="catalog_grid">
                    <?php foreach ($products as $product): ?>
                        <li id="LE490AC74PWJVN" class="itm itm-small unit size1of4  pbl">
                            <a class="itm-link" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                                <span class="lazyImage lazyRecommended loaded" id="pht_LE490AC74PWJVN">
                                    <span class="itm-imageWrapper itm-imageWrapper-LE490AC74PWJVN_recommend" id="images/lee-tee-0120-52018-1-catalog.jpg">
                                        <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                    </span>
                                </span>

                                <span class="itm-newFlag">Mới</span>
                                <span class="itm-brand strong"><?php echo $product['manufacturer_name']; ?></span>
                                <em class="itm-title itm-product-title">
                                   <?php echo $product['name']; ?>
                                </em>


                                <span class="itm-priceBox strong">
                                    <span class="itm-price"><?php echo ($product['price']); ?></span>
                                </span>
                            </a>

                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>

        </div>
    </section>
<?php } ?>
