class UserMailer < ActionMailer::Base
  default from: "denvergschool@gmail.com"
  
  def approved_confirmation(user, restaurant)
    @user = user
    @restaurant = restaurant
    mail(:to => "#{user.email}", :subject => "Approved")
  end

  def rejected_confirmation(user, restaurant)
    @user = user
    @restaurant = restaurant
    mail(:to => "#{user.email}", :subject => "Rejected")
  end

end
