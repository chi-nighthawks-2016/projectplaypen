1.times {
   User.create!(
    username: "amanda",
    pw_hash: "password",
    email: "adnama.lin@gmail.com",
    first_name: "amanda",
    last_name: "lin",
    phone: "3309620922")
}

10.times {
   User.create!(
    username: Faker::Internet.user_name,
    pw_hash: Faker::Internet.password(8),
    email: Faker::Internet.free_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::Number.number(10))
}

10.times {
   Child.create!(
    parent_id: Faker::Number.between(1, 11),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday:Faker::Date.between(3.year.ago, Date.today),
    allergies: Faker::Team.creature)
}

10.times {
   Playdate.create!(
    host_id: Faker::Number.between(1, 11),
    time: Faker::Time.forward(23, :morning).to_s.match(/\d{2}:\d{2}:\d{2}/).to_s,
    date:Faker::Time.forward(23),
    duration:Faker::Number.between(1, 4),
    location:"#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}",
    description: Faker::Hipster.paragraph,
    title: Faker::Hipster.sentence)
}
