<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?>    </div>
    <div class="box-content">
        <ul class="box-category">
            <?php foreach ($manufacturers as $manufacturer) { ?> 
                <li class="cnv-level-1  ">
                    <a href="<?php echo $manufacturer['href']; ?>">
                        <?php echo $manufacturer['name']; ?>
                    </a>
                </li>
            <?php } ?>
        </ul>
    </div>
</div>