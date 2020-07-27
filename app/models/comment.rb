# frozen_string_literal: true

class Comment < ApplicationRecord
  self.per_page = 15

  belongs_to :post
  belongs_to :user

  validates :content, presence: true, length: { maximum: 400, too_long: 'は４００文字以下です。' }
end
