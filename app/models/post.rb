class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, :contents, presence: true
  validates :title, length: { maximum: 140, too_long: "は１４０文字以下です。" }
  validates :contents, length: { maximum: 40000, too_long: "は４０，０００文字以下です。" }
end
