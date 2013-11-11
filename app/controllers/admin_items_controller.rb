class AdminItemsController < ApplicationController
  include AdminItemsHelper

  def index
    @items = Item.all
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    flash.notice = "#{@item.name} removed from Menu!"

    redirect_to admin_items_path
  end

  def new
    @item = Item.new
  end

end
