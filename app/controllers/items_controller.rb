class ItemsController < ApplicationController
  #before_action :can_access, only: [:create, :edit, :update]

  def create
    @item = Item.new(item_params)
    @item.save

    flash.notice = "#{@item.name} was created"

    redirect_to admin_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash.notice = "#{@item.name} was updated"

    redirect_to admin_items_path
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :image_url)
  end

end



