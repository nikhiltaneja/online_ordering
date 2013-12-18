class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }



end
