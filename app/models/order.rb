class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :restaurant
  belongs_to :user

  def has_item?(item_id)
    OrderItem.where(:order_id => self.id, 
                    :item_id => item_id).count  >= 1
  end

  def existing_item(item_id)
    OrderItem.where(:order_id => self.id, 
                    :item_id => item_id)
  end

  def add_item(order_item)
    existing = order_items.find_by_item_id(order_item[:item_id])

    if existing
      existing.quantity += order_item[:quantity].to_i
      existing.save

    else
      order_items.build(:item_id => order_item[:item_id], :quantity => order_item[:quantity].to_i)
    end
  end

  def checkout
    update(:status => "complete")
  end

  def incomplete?
    status == "incomplete"
  end

  def total_price
    order_items.collect do |order_item|
      order_item.quantity * order_item.item.price
    end.reduce(:+)
  end

  def completed_orders
    Order.where(:user_id => session[:user_id], :status => "complete")
  end
end
