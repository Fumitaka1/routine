# frozen_string_literal: true

class Post < ApplicationRecord
  self.per_page = 15

  belongs_to :user
  has_many :comments
  has_many :bookmarks, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true
  validates :title, length: { maximum: 140, too_long: 'は１４０文字以下です。' }
  validates :content, length: { maximum: 40_000, too_long: 'は４０，０００文字以下です。' }
end
