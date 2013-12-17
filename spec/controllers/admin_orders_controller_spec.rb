require 'spec_helper'

describe AdminOrdersController do
  before do
    subject.stub(:can_access)
  end
  let(:restaurant){
    Restaurant.create!(name:"BBQ", description:"asdf")
  }
  describe 'get' do
    it 'assigns orders' do
      complete_order = Order.create!(status: 'complete', restaurant: restaurant)
      incomplete_order = Order.create!(status: 'incomplete', restaurant: restaurant)
      complete_order2 = Order.create!(status: 'complete', restaurant: restaurant)

      get :index, slug: restaurant.slug

      expect(assigns(:orders)).to match_array([incomplete_order, complete_order, complete_order2])
    end

    it 'takes a filter order param' do
      complete_order = Order.create!(status: 'complete', restaurant: restaurant)
      incomplete_order = Order.create!(status: 'incomplete', restaurant: restaurant)
      complete_order2 = Order.create!(status: 'complete', restaurant: restaurant)

      get :index, filter_by: 'Complete', slug: restaurant.slug

      assigns(:orders).should == [complete_order, complete_order2 ]
    end

    it 'assigns filter_by to incomplete from complete' do
      get :index, filter_by: 'Incomplete', slug: restaurant.slug
      assigns(:filter_by).should == 'Complete'
    end

    it 'assigns filter_by to complete from incomplete' do
      get :index, filter_by: 'Complete', slug: restaurant.slug
      assigns(:filter_by).should == 'Incomplete'
    end
  end

end
