require 'spec_helper'

describe 'Cart', type: :feature do

  context "when the cart is empty" do

    xit "shows an error message" do
      restaurant = FactoryGirl.create(:restaurant)
      visit restaurants_path
      save_and_open_page
      click_on restaurant.name
      click_on 'Cart'
      page.should have_content("You must add an item before viewing your cart")
    end
  end

  context "logged out" do
    xit "adds items to the cart" do
      restaurant = FactoryGirl.create(:restaurant)
      category = FactoryGirl.build(:category)
      category.restaurant_id = restaurant.id
      category.save
      item = FactoryGirl.build(:item_specific)
      item.category_id = category.id
      item.save
      visit restaurants_path
      click_on restaurant.name
      click_on 'Add to Cart'
      click_on 'Cart'
      page.within(".order-item") do
        page.should have_content(item.name)
      end
    end
  end



  context "logged in" do
    xit "shows cart items after signing back in" do
      user = FactoryGirl.create(:user)
      restaurant = FactoryGirl.create(:restaurant)
      category = FactoryGirl.build(:category)
      category.restaurant_id = restaurant.id
      category.save
      item = FactoryGirl.build(:item_specific)
      item.category_id = category.id
      item.save
      login(user)
      visit restaurants_path
      click_on restaurant.name
      click_on 'Add to Cart'
      click_on "Cart"
      page.within(".order-item") do
        page.should have_content(item.name)
      end
      click_on 'Logout'

      page.should have_content('Login')
      login(user)
      click_on 'Cart'
      page.within(".order-item") do
        page.should have_content(item.name)
      end
    end
  end


end
