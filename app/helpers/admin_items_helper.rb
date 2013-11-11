module AdminItemsHelper
  def admin_item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :image_url)
  end
end
