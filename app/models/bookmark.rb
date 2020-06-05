# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, presence: true
  validates :post_id, presence: true
end
