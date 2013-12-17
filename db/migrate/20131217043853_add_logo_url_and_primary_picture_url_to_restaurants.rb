class AddLogoUrlAndPrimaryPictureUrlToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :logo_url, :string, default: "http://s21.postimg.org/8jzpdpr53/logoa.png"
    add_column :restaurants, :primary_picture_url, :string, default: "http://s21.postimg.org/tjft57stj/front3.png"
  end
end
