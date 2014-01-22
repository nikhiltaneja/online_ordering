require 'spec_helper'

describe 'Cart', type: :feature do

  before(:each) do
    @restaurant = FactoryGirl.build(:restaurant)
    @region = FactoryGirl.create(:region)
    @restaurant.region = @region
    @restaurant.save
    @category = FactoryGirl.build(:category)
    @category.restaurant_id = @restaurant.id
    @category.save
  end

  context "when the cart is empty" do

    it "shows an error message" do
      visit root_path
      within("#navigation-bar") do
        click_on 'Restaurants'
      end
      click_on "chickfila"
      click_on "Cart"
      page.should have_content("You must add an item before viewing your cart")
    end
  end

  context "logged out" do
    it "adds items to the cart" do
      item = FactoryGirl.build(:item_specific)
      item.category_id = @category.id
      item.save
      visit root_path
      within("#navigation-bar") do
        click_on 'Restaurants'
      end
      click_on "chickfila"
      click_on 'Add to Cart'
      click_on 'Cart'
      page.within(".order-item") do
        page.should have_content(item.name)
      end
    end
  end

  context "logged in" do
    it "shows cart items after signing back in" do
      user = FactoryGirl.create(:user)
      item = FactoryGirl.build(:item_specific)
      item.category_id = @category.id
      item.save
      login(user)
      visit root_path
      within("#navigation-bar") do
        click_on 'Restaurants'
      end
      click_on 'chickfila'
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
