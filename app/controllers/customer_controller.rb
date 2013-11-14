class CustomerController < ApplicationController
  before_action :can_access

  def index
    @users = User.all
  end
end
