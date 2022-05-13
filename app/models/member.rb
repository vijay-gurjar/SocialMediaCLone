require 'csv'
class Member < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Member.create! row.to_hash
    end

  end

  # def self.to_csv(options = {})
  #
  #   CSV.generate(options, headers: true) do |csv|
  #     headers = [ "title", "Discription","comments", "Likes"]
  #     CSV.generate_line headers
  #     csv << headers
  #     all.each do |subject|
  #       csv << [subject['title'],subject['body'],subject.comments.length,subject.likes.length]
  #     end
  #     end
  # end

  def self.sorted(options = {})

    CSV.generate(options, headers: true) do |csv|
      headers = [ "Name", "Posts","comments", "Likes"]
      CSV.generate_line headers
      csv << headers
      all.each do |member|
        if member.subjects.length>= 10
          csv << [member['first_name',],member.subjects.length,member.comments.length,member.likes.length]
        else
        end
        end
    end
  end




  def self.to_csv(options = {})

    CSV.generate(options, headers: true) do |csv|
      headers = [ "Name", "Posts","comments", "Likes"]
      CSV.generate_line headers
      csv << headers
      all.each do |member|

          csv << [member['first_name',],member.subjects.length,member.comments.length,member.likes.length]


      end
    end
  end




  # def self.to_csv
  #   attributes = [ "id", "first_name", "last_name", "phone_number", "roles_name", "subject_ids", "comment_ids", "likes_ids"]
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes
  #     all.each do |member|
  #       csv << attributes.map {|attr| member.send(attr)}
  #     end
  #   end
  # end

  has_many :subjects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :first_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, length: { minimum: 10 }, uniqueness: true
  validates :password , presence: true, length: { minimum: 6 }



  after_create :assign_default_role

  def assign_default_role
    self.add_role(:User) if self.roles.blank?
  end

  after_create :sending_mail_after_signup

  def sending_mail_after_signup
  MemberMailer.member_signedup.deliver_later

  end
end

