# Start seeding the database with random data.

100.times do |n|
  User.create(email: "user#{n}@example.com", preferences: { theme: User.valid_themes.sample, language: User.valid_languages.sample, currency: User.valid_currencies.sample })
end