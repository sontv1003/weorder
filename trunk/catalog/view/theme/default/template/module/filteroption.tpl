

<div class="categoryMenu box">
    <ul class="fct-list">

        <?php foreach ($options as $option) { ?>
            <li class="pbs color-all">
               

                <div class="box-heading"> <?php echo $option['name'] ?>      </div>

                <?php if ($option['type'] == 'image') { ?>
                    <div style="" class="fct-bd">
                        <ul class="fct-colorPicker clearfix">
                            <?php foreach ($option['value'] as $value) { ?>
                                <li class="lfloat <?php echo ($value['id'] == $this->request->get['filter_option']) ? 'selected' : '' ?>">
                                    <a href="<?php echo $value['href'] ?>" class="" title="<?php echo $value['name'] ?>" rel="follow">
                                        <img src="<?php echo $value['image'] ?>" title="<?php echo $value['name'] ?>" alt="<?php echo $value['name'] ?>"/>                      
                                    </a>
                                </li>
                            <?php } ?>
                        </ul>
                    <?php } else { ?>
                        <ul style="margin-top:2px" class="cnv fct-scroll box-bdr">
                            <?php foreach ($option['value'] as $value) { ?>
                                <li class="cnv-level-1">
                                    <a href="<?php echo $value['href'] ?>" class="" title="<?php echo $value['name'] ?>" rel="follow"><?php echo $value['name'] ?> </span></a>
                                </li>
                            <?php } ?>
                        </ul>
                    <?php } ?>
                <?php } ?>
        </li>
    </ul>
</div>