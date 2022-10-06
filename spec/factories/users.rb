FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_chinese     {person.last.kanji}
    first_name_chinese    {person.first.kanji}
    last_name_katakana    {person.last.katakana}
    first_name_katakana   {person.last.katakana}
    birth_day             {Faker::birthday(min_age: 5, max_age: 92)}
  end
end