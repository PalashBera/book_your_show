User.create!(
  first_name: "Palash",
  last_name: "Bera",
  email: "palashbera1234@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  confirmation_sent_at: Time.current,
  confirmed_at: Time.current + 5.minutes
)

User.create!(
  first_name: "Palash",
  last_name: "Bera",
  email: "palashbera1234+1@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  confirmation_sent_at: Time.current,
  confirmed_at: Time.current + 5.minutes
)
