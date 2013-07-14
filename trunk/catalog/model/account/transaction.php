<?php

class ModelAccountTransaction extends Model {

    public function getTransactions($data = array()) {
        $sql = "SELECT ct.*, os.name as order_status, o.order_id FROM `" . DB_PREFIX . "customer_transaction` ct LEFT JOIN `order` o ON ct.order_id = o.order_id LEFT JOIN order_status os ON o.order_status_id = os.order_status_id WHERE ct.customer_id = '" . (int) $this->customer->getId() . "'";

        $sort_data = array(
            'amount',
            'description',
            'date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY date_added";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalTransactions() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "customer_transaction` WHERE customer_id = '" . (int) $this->customer->getId() . "'");

        return $query->row['total'];
    }
    
    public function getTotalOrder($order_id) {
        $query = $this->db->query("SELECT SUM(value) AS total FROM `" . DB_PREFIX . "order_total` WHERE code NOT IN ('credit', 'total') AND order_id = '" . (int) $order_id . "'");

        return $query->row['total'];
    }

    public function getTotalAmount() {
        $query = $this->db->query("SELECT SUM(amount) AS total FROM `" . DB_PREFIX . "customer_transaction` WHERE customer_id = '" . (int) $this->customer->getId() . "' GROUP BY customer_id");

        if ($query->num_rows) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

}

?>