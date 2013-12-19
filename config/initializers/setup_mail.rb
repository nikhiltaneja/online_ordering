ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "orderup.com",
  :user_name            => "gschooler1",
  :password             => "g$chooldenver",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
