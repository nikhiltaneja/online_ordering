require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'

describe 'Admin Orders', type: :feature do
  it 'works' do
    visit '/admin_orders'
  end
end
