# ユーザー
User.create!( full_name: "Example User",
              name: "Example",
              email: "foobar@example.com",
              password: "foobar",
              password_confirmation: "foobar",
              profile: "hogehogefoobar",
              website: "https://sample_app",
              tel: "1234567890",
              sex: "male",
              admin: true,
              activated: true,
              activated_at: Time.zone.now
            )
            
50.times do |n|
  full_name = Faker::Name.name
  name = full_name
  email = "user-#{n}@example.com"
  password = "password"
  User.create!(
    full_name: full_name,
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
    )
end
    
# マイクロポスト    
users = User.order(:created_at).take(10)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..25]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
