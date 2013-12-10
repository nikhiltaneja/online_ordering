class Restaurant < ActiveRecord::Base
  has_many :roles
  has_many :users, through: :roles
  after_create :create_slug

  def create_slug
    name.parameterize
  end
end
