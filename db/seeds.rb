users = []

1.times {
   users << User.create!(
    username: "amanda",
    password: "password",
    email: "adnama.lin@gmail.com",
    first_name: "amanda",
    last_name: "lin",
    phone: "3309620922")
}

10.times {
   users << User.create!(
    username: Faker::Internet.user_name,
    password: Faker::Internet.password(8),
    email: Faker::Internet.free_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::Number.number(10))
}

10.times {
   users.sample.playdates.create(
    time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s,
    date:Faker::Time.forward(23),
    duration:Faker::Number.between(1, 4),
    location:"#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}",
    description: Faker::Hipster.paragraph,
    title: Faker::Hipster.sentence)
}

20.times {
  users.sample.children.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  birthday: Faker::Date.between(4.year.ago, Date.today),
  allergies: (1..rand(6)+1).collect { Faker::Team.creature })
}

10.times {
  Rsvp.create(
    child_id: Faker::Number.between(1, 12),
    playdate_id: Faker::Number.between(1, 10))
}
