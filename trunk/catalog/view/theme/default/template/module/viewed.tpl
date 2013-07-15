<?php if (count($products) > 0) { ?>

    <section class="box box-bgcolor mtm" style="margin: 0px 0px 0px 3px;">
        <div id="recommengine_recommendations">
            <div class="box box-bdr box-bgcolor mbm mtl sel-lastviewed-products-product" data-recommid="recommBox2" style="margin: 0px 0px 0px 3px; padding-bottom: 0px">
                <h3 class="mam pbm ui-borderBottom"><?php echo $heading_title; ?></h3>
                <div style="width: 980px; height: 380px; overflow-y: hidden; overflow-x: auto;">
                    <ul class="catalog_grid" style="width: <?php echo count($products) * 244; ?>px">
                        <?php foreach ($products as $product): ?>
                            <li id="LE490AC74PWJVN" class="itm itm-small unit size1of4  pbl" style="width: 244px;">
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

        </div>
    </section>
<?php } ?>
