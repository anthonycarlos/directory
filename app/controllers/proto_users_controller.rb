class ProtoUsersController < ApplicationController
  before_action :set_proto_user, only: [:show]

  def new
    @proto_user = ProtoUser.new
  end

  def create
    @proto_user = ProtoUser.new(proto_user_params)

    respond_to do |format|
      if @proto_user.save
        ProtoUserMailer.request_account_email(@proto_user).deliver_now
        format.html { redirect_to @proto_user, notice: 'Account request successfully created.' }
        format.json { render :show, status: :created, location: @proto_user }
      else
        format.html { render :new }
        format.json { render json: @proto_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_proto_user
    @proto_user = ProtoUser.find(params[:id])
  end

  def proto_user_params
    params.require(:proto_user).permit(:email, :student, :teacher, :grade, :address)
  end

end
