name = ENV.fetch("SEED_USER_NAME")
email = ENV.fetch("SEED_USER_EMAIL")
password = ENV.fetch("SEED_USER_PASSWORD")

User.find_or_create_by!(email: email) do |user|
  user.name = name
  user.password = password
end
