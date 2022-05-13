class Comment < ApplicationRecord
  validates :commenter, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }
  belongs_to :subject
  # belongs_to :member



end
