class User < ActiveRecord::Base
  has_many :orders

  def self.find_or_create_by_auth(auth_data)
    find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"],
                                     name: auth_data["info"]["name"])
  end

end
