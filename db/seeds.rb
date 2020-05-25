User.create!( full_name: "Example User",
              name: "Example",
              email: "foobar@example.com",
              password: "foobar",
              password_confirmation: "foobar",
              profile: "hogehogefoobar",
              website: "https://sample_app",
              tel: "1234567890",
              sex: "male",
              admin: true
            )
            
99.times do |n|
  full_name = Faker::Name.name
  name = full_name
  email = "user-#{n}@example.com"
  password = "password"
  User.create!(
    full_name: full_name,
    name: name,
    email: email,
    password: password,
    password_confirmation: password
    )
end