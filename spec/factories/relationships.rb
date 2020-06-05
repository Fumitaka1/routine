# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    # user
    followed_id { 1 }
    follower_id { 1 }
  end
end
