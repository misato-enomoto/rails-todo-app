User.find_or_create_by!(email: "test@example.com") do |user|
  user.name = "misato"
  user.password = "password12345"
end
