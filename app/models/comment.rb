class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :text, length: { in: 1..40 }
end
