# Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             confirmed_at: Time.zone.now)

99.times do |n|
  name  = "hiro#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end


users = User.all
user  = users.first

# relationships
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# work
users[0..20].each do |user|
  user.works.create!(
    title: "これがタイトル",
    description: "これが説明" * 10,
    image: fixture_file_upload("#{Rails.root}/test/fixtures/files/test.jpg", "image/jpg")
  )
end
