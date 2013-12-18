# require 'spec_helper'

# describe User do
  
#   context "#current_order" do
#     let(:user) { User.new }
#     let(:complete_order) { double(status: "complete") }
#     let(:incomplete_order) { double(status: "incomplete") }
    
#     context "last order is incomplete" do
#       it "returns order" do
#         user.stub(:orders).and_return([complete_order, incomplete_order])
#         user.current_order.should == incomplete_order
#       end
#     end

#     context "last order is complete" do
#       it "returns nil" do
#         user.stub(:orders).and_return([incomplete_order, complete_order])
#         user.current_order.should be_nil
#       end
#     end

#     context "no orders" do
#       it "returns nil" do
#         user.current_order.should be_nil
#       end
#     end
#   end
# end
