<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		$this->data['category_man_href'] = $this->url->link('product/category', 'path=33', 'SSL');
		$this->data['category_woman_href'] = $this->url->link('product/category', 'path=25', 'SSL');
                
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
                
		$this->data['link_order_now'] = $this->url->link('checkout/cart');
                
		$this->response->setOutput($this->render());
	}
}
?>