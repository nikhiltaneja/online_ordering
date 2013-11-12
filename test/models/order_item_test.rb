require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def test_it_validates_quantity_is_greater_than_zero
    order_item = OrderItem.new
    order_item.quantity = 0
    refute order_item.valid?

    order_item.quantity = 1
    assert order_item.valid?

  end

  def test_it_validates_that_quantity_is_an_integer
    order_item = OrderItem.new
    order_item.quantity = "String"
    refute order_item.valid?
  end
end
