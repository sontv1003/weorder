<?php

class ControllerModuleManufacturersdropdown extends Controller {

    protected function index() {
        $status = true;

        if ($this->config->get('store_admin')) {
            $this->load->library('user');

            $this->user = new User($this->registry);

            $status = $this->user->isLogged();
        }

        if ($status) {
            $this->language->load('module/manufacturersdropdown');
            $this->load->model('catalog/category');

            $this->load->model('catalog/product');

            $this->data['heading_title'] = $this->language->get('heading_title');

            $this->load->model('catalog/manufacturer');

            $results = $this->model_catalog_manufacturer->getManufacturers();

            if (isset($this->request->get['path'])) {
                $parts = explode('_', (string) $this->request->get['path']);
            } else {
                $parts = array();
            }

            if (isset($this->request->get['path'])) {
                $parts = explode('_', (string) $this->request->get['path']);
            } else {
                $parts = array();
            }

            if (isset($parts[0])) {
                $data['filter_category_id'] = end($parts);
            }
            
            $url = '';
            if (isset($this->request->get['path'])) {
                $url .= 'path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter_option'])) {
                $url .= '&filter_option=' . $this->request->get['filter_option'];
                $data['filter_option'] = $this->request->get['filter_option'];
            }
            
            $this->data['manufacturers'] = array();
            foreach ($results as $result) {
                $data['filter_manufacturer_id'] = $result['manufacturer_id'];

                $total = $this->model_catalog_product->getTotalProducts($data);
                $this->data['manufacturers'][] = array(
                    'id' => $result['manufacturer_id'],
                    'name' => $result['name'] . ' ( ' . $total . ' )',
                    'href' => $this->url->link('product/category', $url.'&filter_manufacturer_id=' . $result['manufacturer_id'], 'SSL')
                );
            }
            
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturersdropdown.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/module/manufacturersdropdown.tpl';
            } else {
                $this->template = 'default/template/module/manufacturersdropdown.tpl';
            }

            $this->render();
        }
    }

}

?>