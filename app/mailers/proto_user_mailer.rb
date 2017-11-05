class ProtoUserMailer < ApplicationMailer
  ADMIN = 'anthony.carlos@robert-frost-pta.com'
  default from: ADMIN

  def request_account_email(proto_user)
    @proto_user = proto_user
    mail(to: @proto_user.email, cc: ADMIN, subject: 'Account Request')
  end
end
