FactoryBot.define do
  factory :comment do
    user
    post
    content {"テストコメント"}
  end
end
