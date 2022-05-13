# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/member_signedup
  def member_signedup
    MemberMailer.member_signedup
  end

end
