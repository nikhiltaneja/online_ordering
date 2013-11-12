require 'test_helper'
require './app/models/order'

class OrderTest < ActiveSupport::TestCase

  # def setup
  #   item = Item.create(:name => "Pulled Pork Sandy")
  #   order = Order.create
  #   order_item = OrderItem.create(:order_id => order.id, :item_id => item.id)    
  # end

  def teardown
    Item.destroy_all
  end
  
  def test_it_has_a_particular_item_that_is_passed_in
    item = Item.create(:name => "Pulled Pork Sandy")
    order = Order.create
    order_item = OrderItem.create(:order_id => order.id, :item_id => item.id, :quantity => 3)
    assert_equal true, order.has_item?(item.id)
  end

  def test_it_does_not_have_an_item
    item = Item.create(:name => "Something I dont want")
    order = Order.create
    order_item = OrderItem.create(:order_id => order.id, :item_id => item.id)
    refute order.has_item?(item.id + 999)
  end

  def test_order_is_instantiated_with_an_incomplete_status
    order = Order.create
    assert_equal "incomplete", order.status
  end

  def test_updates_order_status
    order = Order.create
    order.checkout
    assert_equal "complete", order.status 
  end

  def test_completed_order?
    order = Order.create
    assert_equal true, order.incomplete?
    order.checkout
    assert_equal "complete", order.status 
    assert_equal false, order.incomplete?
  end

  def test_total_price_method_sums_quantity_of_same_order_item_in_order
    item = Item.create(:name => "Something I dont want", :price => 9)
    order = Order.create
    order_item = OrderItem.create(:order_id => order.id, :item_id => item.id, :quantity => 3)
    assert_equal 27, order.total_price
  end

  def test_total_price_method_sums_quantities_of_different_order_items_in_order
    item = Item.create(:name => "Something I dont want", :price => 9)
    order = Order.create
    order_item = OrderItem.create(:order_id => order.id, :item_id => item.id, :quantity => 3)
    item_two = Item.create(:name => "Something I dont want", :price => 6)
    order_item = OrderItem.create(:order_id => order.id, :item_id => item_two.id, :quantity => 1)
    assert_equal 33, order.total_price
  end

end
