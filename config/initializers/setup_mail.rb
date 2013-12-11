ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "railscasts.com",
  :user_name            => "denvergschool",
  :password             => "g$chooldenver",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
