class AdminItemsController < ApplicationController
  include AdminItemsHelper

  def index
    @items = current_restaurant.items
    @items_count = current_restaurant.item_count
  end

  def new
    @item = Item.new
  end

  def destroy
    if @item = current_restaurant.find_item(params[:id])
      @item.destroy
      flash.notice = "#{@item.name} removed from Menu!"
    else
      flash.notice = "Quit hacking!"
    end
    redirect_to admin_items_path
  end
end
