class CartsController < ApplicationController

  def show
    unless order
      flash.notice = "You must add an item before viewing your cart"
      redirect_to categories_path
    end
  end

  def index
    unless order
      flash.notice = "You must add an item before viewing your cart"
      redirect_to categories_path
    end
  end

  private

  def order
    @order ||= current_order
  end
end
