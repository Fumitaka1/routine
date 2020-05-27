FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "user_No.#{i}"}
    sequence(:email) { |i| "email_No_#{i}@example.com"}
    password {"password"}
  end
end
