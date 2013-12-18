class Restaurant < ActiveRecord::Base
  has_many :roles
  has_many :users, through: :roles
  has_many :categories
  has_many :items, through: :categories
  has_many :orders
  belongs_to :region
  validates :name, presence: true
  validates_uniqueness_of :name, :slug
  validates :description, presence: true
  validates :status, inclusion: { in: ["approved", "pending", "rejected"] } 
  before_validation :create_slug
  validate :publicly_viewable

  def create_slug
    self.slug = self.name.parameterize
  end

  def to_param
    slug
  end

  def approve
    self.update!(status: "approved", display: true)
  end

  def reject
    self.update!(status: "rejected", display: false)
  end

  def publicly_viewable
    if (status=="rejected" || status=="pending") && display==true
      errors.add(:display, "can't be rejected or pending and shown")
    end
  end

  def item_count
    items.count
  end

  def order_count
    orders.count
  end

  def find_item(item_id)
    items.find_by(id: item_id)
  end

  def complete_orders
    orders.where(status: "complete")
  end

  def incomplete_orders
    orders.where(status: "incomplete")
  end

  def customers
    orders.map(&:user).uniq
  end

  def total_sales
    orders.where(:status=>"complete").joins(:order_items).joins(:items).sum("order_items.quantity * items.price")
  end
end
