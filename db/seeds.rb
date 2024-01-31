User.create!(name:  "Robin",
             email: "robin@ukirama.com",
            )

# Generate a bunch of additional users.
    9.times do |n|
        name  = Faker::Name.name
        email = "example-#{n+1}@railstutorial.org"
        password = "password"
        User.create!(name:  name,
                    email: email,
                    password:              password,
                    password_confirmation: password,
                    activated: true,
                    activated_at: Time.zone.now)
    end

