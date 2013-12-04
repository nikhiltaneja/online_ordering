require 'spec_helper'

describe AdminOrdersController do
  before do
    subject.stub(:can_access)
  end
  describe 'get' do
    it 'assigns orders' do
      complete_order = Order.create(status: 'complete')
      incomplete_order = Order.create(status: 'incomplete')
      complete_order2 = Order.create(status: 'complete')

      get :index

      assigns(:orders).should == [incomplete_order, complete_order, complete_order2]
    end

    it 'takes a sort order param' do
      complete_order = Order.create(status: 'complete')
      incomplete_order = Order.create(status: 'incomplete')
      complete_order2 = Order.create(status: 'complete')

      get :index, order_by: 'ascending'

      assigns(:orders).should == [complete_order, complete_order2,incomplete_order ]
    end

    it 'assigns order_by to descending from ascending' do
      get :index, order_by: 'ascending'
      assigns(:order_by).should == 'descending'
    end

    it 'assigns order_by to ascending from descending' do
      get :index, order_by: 'ascending'
      assigns(:order_by).should == 'descending'
    end
  end

end
