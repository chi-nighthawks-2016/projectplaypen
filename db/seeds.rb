12.times { Child.create!(
  parent_id: rand(4)+1,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  birthday: Faker::Date.between(4.year.ago, Date.today),
  allergies: (1..rand(6)+1).collect { Faker::Team.creature })
}
