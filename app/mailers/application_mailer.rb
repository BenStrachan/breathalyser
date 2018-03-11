class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@breathalyser.com'
  layout 'mailer'
  append_view_path Rails.root.join('app', 'views', 'mailers')

end
