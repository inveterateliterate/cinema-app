require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_by_showing_url(Showing.first)
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { cust_email: @order.cust_email, cust_first: @order.cust_first, cust_last: @order.cust_last, showing_id: @order.showing_id, cc_num: @order.cc_num, cc_exp: @order.cc_exp, sale: @order.sale} }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

#  test "should get edit" do
#    get edit_order_url(@order)
#    assert_response :success
#  end

#  test "should update order" do
#    patch order_url(@order), params: { order: { cust_email: @order.cust_email, cust_first: @order.cust_first, cust_last: @order.cust_last, showing_id: @order.showing_id } }
#    assert_redirected_to order_url(@order)
#  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
