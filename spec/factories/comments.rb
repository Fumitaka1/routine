FactoryBot.define do
  factory :comment do
    post
    user { post.user }
    content {"テストコメント"}
  end
end
