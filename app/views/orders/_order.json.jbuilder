json.extract! order, :id, :date, :cust_last, :cust_first, :cust_email, :showing_id, :created_at, :updated_at
json.url order_url(order, format: :json)