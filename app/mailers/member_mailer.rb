class MemberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.member_signedup.subject
  #
  def member_signedup
    @greeting = "Hello"

    mail(
           to: Member.last.email,
           cc: Member.last.email,
           subject: 'New User Sign up'
    )
  end
end