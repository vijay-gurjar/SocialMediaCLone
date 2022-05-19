require "test_helper"
test "member_signedup" do
  mail = MemberMailer.member_signedup
  assert_equal "Member signedup", mail.subject
  assert_equal ["to@example.org"], mail.to
  assert_equal ["from@example.com"], mail.from
  assert_match "Hi", mail.body.encoded
end
class MemberMailerTest < ActionMailer::TestCase


end
