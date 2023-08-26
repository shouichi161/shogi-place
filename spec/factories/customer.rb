FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 7) }
    date_of_birth { :'1991-1-1' }
    gender  {:'male' }
    chess_ability {:'初段'}
    profile { Faker::Lorem.characters(number: 20) }
    membership_status {:'member'}
  end
end