class UserMailer < ActionMailer::Base
  default from: "denvergschool@gmail.com"

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
