class UserMailer < ActionMailer::Base
  default from: "denvergschool@gmail.com"
  
  def approved_confirmation(user)
    @user = user
    # mail(:to => "#{user.name} <#{user.email}>", :subject => "Approved")
    mail(:to => "denvergschool@gmail.com", :subject => "Approved")

  end
end
