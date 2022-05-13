require 'csv'
class Subject < ApplicationRecord
  include Visible
  belongs_to :member
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy

  def self.post_wise (options = {})

    CSV.generate(options, headers: true) do |csv|
      headers = [ "title", "Discription","comments", "Likes"]
      CSV.generate_line headers
      csv << headers
      all.each do |subject|
        csv << [subject['title',],subject['body'],subject.comments.length,subject.likes.length]


      end
    end
  end



  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end


end
