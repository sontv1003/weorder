<?php

class ControllerCatalogMessage extends Controller {

    private $error = array();

    function index() {

        $this->load->language('catalog/message');
        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/category');

        $this->template = 'catalog/message_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    function add() {

        $this->template = 'catalog/message_form.tpl';
    }

}
