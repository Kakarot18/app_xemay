Fabricator(:user) do
  name {sequence(:name) {|i| "User#{i + 1}"}}
  email {sequence(:email) {|i| "email#{i + 1}@gmail.com"}}
  password "12345678"
  password_confirmation "12345678"
  avatar {File.open(File.join(Rails.root, "app", "assets", "images", "profile.png"))}
  role "normal"
end
