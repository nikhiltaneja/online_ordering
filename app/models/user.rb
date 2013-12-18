class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :roles
  has_many :restaurants, through: :roles
  has_one :platform_admin

  def find_order(order_id)
    orders.find_by(id: order_id)
  end

end
