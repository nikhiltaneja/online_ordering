class Restaurant < ActiveRecord::Base
  has_many :roles
  has_many :users, through: :roles
  has_many :categories
  has_many :orders
  validates :name, presence: true
  validates_uniqueness_of :name, :slug
  validates :description, presence: true
  validates :status, inclusion: { in: ["approved", "pending", "rejected"] } 
  before_validation :create_slug

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
end
