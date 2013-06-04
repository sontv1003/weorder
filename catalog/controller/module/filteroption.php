<?php

class ControllerModuleFilteroption extends Controller {

    protected function index() {
        $status = true;

        if ($this->config->get('store_admin')) {
            $this->load->library('user');

            $this->user = new User($this->registry);

            $status = $this->user->isLogged();
        }

        if ($status) {
            $this->language->load('module/filteroption');
            $this->load->model('catalog/category');

            $this->load->model('catalog/product');

            $this->data['heading_title'] = $this->language->get('heading_title');

            $this->load->model('catalog/manufacturer');

            $results = $this->model_catalog_product->getOptions();


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

            if (isset($this->request->get['filter_manufacturer_id'])) {
                $url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
                $data['filter_manufacturer_id'] = $this->request->get['filter_manufacturer_id'];
            }

            $this->load->model('tool/image');
            foreach ($results as $result) {
                $listValue = array();
                foreach ($result['option_value'] as $value) {
                    $data['filter_option'] = $value['option_value_id'];
                    $totalProduct = $this->model_catalog_product->getTotalProducts($data);
                    $dataValue['name'] = $value['name'] . ' ( ' . $totalProduct . ' )';
                    $dataValue['image'] = !empty($value['image']) ? $this->model_tool_image->resize($value['image'], 15, 15) : '';
                    $dataValue['id'] = $value['option_value_id'];
                    $dataValue['href'] = $this->url->link('product/category', $url . '&filter_option=' . $value['option_value_id'], 'SSL');
                    $listValue[] = $dataValue;
                }
                $this->data['options'][] = array(
                    'id' => $result['option_id'],
                    'name' => $result['name'],
                    'type' => $result['type'],
                    'value' => $listValue
                );
            }
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filteroption.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/module/filteroption.tpl';
            } else {
                $this->template = 'default/template/module/filteroption.tpl';
            }

            $this->render();
        }
    }

}
?>
