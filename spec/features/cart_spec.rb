require 'spec_helper'

describe 'Cart', type: :feature do

  context "when the cart is empty" do

    it "shows an error message" do
      restaurant = Restaurant.create(name: "Nik's", slug: "niks", description: "good stuff", status: "approved", display: true)
      region = Region.create(name: "CA")
      restaurant.region = region
      restaurant.save
      visit root_path
      within("#navigation-bar") do
        click_on 'Restaurants'
      end
      click_on "Nik's"
      click_on "Cart"
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
