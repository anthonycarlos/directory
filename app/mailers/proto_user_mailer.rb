class ProtoUserMailer < ApplicationMailer
  default from: 'anthony.carlos@robert-frost-pta.com'

  def request_account_email(proto_user)
    @proto_user = proto_user
    mail(to: @proto_user.email, subject: 'Account Request')
  end
end
