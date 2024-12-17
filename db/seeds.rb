email_address = Rails.application.credentials.dig(:user, :email)
password = Rails.application.credentials.dig(:user, :password)

unless User.exists?(email_address: email_address)
  user = User.new(email_address: email_address)
  user.password = password
  user.password_confirmation = password
  user.save!
end

# in prod add additional user
if Rails.env.production?
  email_address = Rails.application.credentials.dig(:user_two, :email)
  password = Rails.application.credentials.dig(:user_two, :password)

  unless User.exists?(email_address: email_address)
    user_two = User.new(email_address: email_address)
    user_two.password = password
    user_two.password_confirmation = password
    user_two.save!
  end
end
