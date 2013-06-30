<?php

class ControllerAccountEdit extends Controller {

    private $error = array();

    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/edit', '', 'SSL');

            $this->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->language->load('account/edit');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('account/customer');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->request->post['lastname'] = '';
            $this->model_account_customer->editCustomer($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('account/account', '', 'SSL'));
        }

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
            'text' => $this->language->get('text_edit'),
            'href' => $this->url->link('account/edit', '', 'SSL'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_your_details'] = $this->language->get('text_your_details');

        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_fax'] = $this->language->get('entry_fax');

        $this->data['button_continue'] = $this->language->get('button_continue');
        $this->data['button_back'] = $this->language->get('button_back');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['firstname'])) {
            $this->data['error_firstname'] = $this->error['firstname'];
        } else {
            $this->data['error_firstname'] = '';
        }

        if (isset($this->error['email'])) {
            $this->data['error_email'] = $this->error['email'];
        } else {
            $this->data['error_email'] = '';
        }

        if (isset($this->error['telephone'])) {
            $this->data['error_telephone'] = $this->error['telephone'];
        } else {
            $this->data['error_telephone'] = '';
        }

        $this->data['action'] = $this->url->link('account/edit', '', 'SSL');

        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
        }

        if (isset($this->request->post['firstname'])) {
            $this->data['firstname'] = $this->request->post['firstname'];
        } elseif (isset($customer_info)) {
            $this->data['firstname'] = $customer_info['firstname'];
        } else {
            $this->data['firstname'] = '';
        }

        if (isset($this->request->post['email'])) {
            $this->data['email'] = $this->request->post['email'];
        } elseif (isset($customer_info)) {
            $this->data['email'] = $customer_info['email'];
        } else {
            $this->data['email'] = '';
        }

        if (isset($this->request->post['telephone'])) {
            $this->data['telephone'] = $this->request->post['telephone'];
        } elseif (isset($customer_info)) {
            $this->data['telephone'] = $customer_info['telephone'];
        } else {
            $this->data['telephone'] = '';
        }

        if (isset($this->request->post['fax'])) {
            $this->data['fax'] = $this->request->post['fax'];
        } elseif (isset($customer_info)) {
            $this->data['fax'] = $customer_info['fax'];
        } else {
            $this->data['fax'] = '';
        }
        
        
        if (!empty($this->request->post['avatar'])) {
            $this->data['avatar'] = $this->request->post['avatar'];
            $this->data['account_avatar'] = HTTP_SERVER.$this->request->post['avatar'];
        } elseif (isset($customer_info)) {
            if(empty($customer_info['avatar'])) {
                $this->data['account_avatar'] = HTTP_SERVER.'image/avatar_default.png';              
            } else {
                $this->data['account_avatar'] = HTTP_SERVER.$customer_info['avatar'];             
            }
            
            $this->data['avatar'] = $customer_info['avatar'];
        } else {
            $this->data['avatar'] = '';
            $avatar = $this->customer->getAvatar();
            
            if(!empty($avatar)) {
                $this->data['account_avatar'] = HTTP_SERVER.$avatar;
            } else {
                $this->data['account_avatar'] = HTTP_SERVER.'image/avatar_default.png';
            }
        }

        $this->data['back'] = $this->url->link('account/account', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/edit.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/account/edit.tpl';
        } else {
            $this->template = 'default/template/account/edit.tpl';
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

    protected function validate() {
        if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
            $this->error['firstname'] = $this->language->get('error_firstname');
        }
        
        if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
            $this->error['email'] = $this->language->get('error_email');
        }

        if (($this->customer->getEmail() != $this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
            $this->error['warning'] = $this->language->get('error_exists');
        }

        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
            $this->error['telephone'] = $this->language->get('error_telephone');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>