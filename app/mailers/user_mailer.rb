class UserMailer < ActionMailer::Base
  default from: "denvergschool@gmail.com"

  def notify_restaurant_admin(restaurant_admin, restaurant)
    @restaurant_admin = restaurant_admin
    @restaurant = restaurant
    mail(:to => "#{restaurant_admin.email}", :subject => "Request received")
  end

  def notify_platform_admin(platform_admin, restaurant)
    @restaurant = restaurant
    @restaurant_admin = restaurant.roles.first.user
    mail(:to => "#{platform_admin.email}", :subject => "Request for a new restaurant")
  end

  def approved_confirmation(restaurant_admin, restaurant)
    @restaurant_admin = restaurant_admin
    @restaurant = restaurant
    mail(:to => "#{restaurant_admin.email}", :subject => "Approved")
  end

  def rejected_confirmation(restaurant_admin, restaurant)
    @restaurant_admin = restaurant_admin
    @restaurant = restaurant
    mail(:to => "#{restaurant_admin.email}", :subject => "Rejected")
  end

  def admin_approved_confirmation(admin, restaurant)
    @admin = admin
    @restaurant = restaurant
    mail(:to => "#{admin.email}", :subject => "Approved")
  end

  def admin_rejected_confirmation(admin, restaurant)
    @admin = admin
    @restaurant = restaurant
    mail(:to => "#{admin.email}", :subject => "Rejected")
  end
end
