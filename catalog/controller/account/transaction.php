<?php

class ControllerAccountTransaction extends Controller {

    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/transaction', '', 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->language->load('account/transaction');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/account', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_transaction'),
            'href' => $this->url->link('account/transaction', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->load->model('account/transaction');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['column_date_added'] = $this->language->get('column_date_added');
        $this->data['column_description'] = $this->language->get('column_description');
        $this->data['column_amount'] = sprintf($this->language->get('column_amount'), $this->config->get('config_currency'));

        $this->data['text_total'] = $this->language->get('text_total');
        $this->data['text_empty'] = $this->language->get('text_empty');

        $this->data['button_continue'] = $this->language->get('button_continue');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $this->data['transactions'] = array();

        $data = array(
            'sort' => 'date_added',
            'order' => 'DESC',
            'start' => ($page - 1) * 10,
            'limit' => 10
        );

        $transaction_total = $this->model_account_transaction->getTotalTransactions($data);

        $results = $this->model_account_transaction->getTransactions($data);
        
        foreach ($results as $result) {
            $order_id = $result['order_id'];
            $order_total = 0;
            if(!empty($order_id)) {
                $order_total = $this->model_account_transaction->getTotalOrder($order_id);
            }

            $this->data['transactions'][] = array(
                'order_id' => $result['order_id'],
                'amount' => $this->currency->format($result['amount'], $this->config->get('config_currency')),
                'order_total' => $this->currency->format($order_total, $this->config->get('config_currency')),
                'sub_total' => $this->currency->format($order_total + $result['amount'], $this->config->get('config_currency')),
                'description' => $result['description'],
                'order_status' => $result['order_status'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
            );
        }

        $pagination = new Pagination();
        $pagination->total = $transaction_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('account/transaction', 'page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->data['total'] = $this->currency->format($this->customer->getBalance());

        $this->data['continue'] = $this->url->link('account/account', '', 'SSL');
        $this->data['account_info_href'] = $this->url->link('account/edit');
        $this->data['account_order_info_href'] = $this->url->link('account/order');
        $this->data['account_transaction_href'] = $this->url->link('account/transaction');
        $this->data['account_avatar'] = $this->customer->getAvatar();
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transaction.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/transaction.tpl';
        } else {
            $this->template = 'default/template/account/transaction.tpl';
        }

        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

}

?>