class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true
  validates :title, length: { in: 1..20 }
end
