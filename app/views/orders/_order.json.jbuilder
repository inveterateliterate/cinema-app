json.extract! order, :id, :cust_last, :cust_first, :cust_email, :showing_id, :created_at, :updated_at
json.url order_url(order, format: :json)