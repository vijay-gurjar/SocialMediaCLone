class Like < ApplicationRecord
  validates :member_id, uniqueness: { scope: :subject_id}
  belongs_to :member
  belongs_to :subject
end
