class Restaurant < ActiveRecord::Base
  after_create :create_slug

  def create_slug
    name.parameterize
  end
end
