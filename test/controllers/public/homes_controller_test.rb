require 'test_helper'

class Public::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get items" do
    get public_homes_items_url
    assert_response :success
  end

  test "should get customers" do
    get public_homes_customers_url
    assert_response :success
  end

  test "should get cart_items" do
    get public_homes_cart_items_url
    assert_response :success
  end

  test "should get orders" do
    get public_homes_orders_url
    assert_response :success
  end

  test "should get addresses" do
    get public_homes_addresses_url
    assert_response :success
  end

end
