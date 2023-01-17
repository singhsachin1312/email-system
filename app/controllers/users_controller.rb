class UsersController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :load_user, only: [:show, :edit, :update, :verify_email_address]

#user listing action
  def index
    @users = User.all
  end

#user new form action
  def new
    @user = User.new
  end

#user create action
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def verify_email_address
    unless @user.email_verified?
      @user.update(email_verified: true)
      render html: "Email Verified Successfully"
    else
      render html: "Email Already Verified"
    end
  end

  def new_remainder
    @remainder = Remainder.new
  end

  def remainder
    @user = User.find_by_id(params[:user_id])
    @user.remainders.create(remainder_params)
    redirect_to @user
  end

  private
  #strong parameters
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :email_sent_count)
    end

    def remainder_params
      params.permit(:number, :remainder_type, :user_id)
    end

    def load_user
      @user = User.find_by_id(params[:id])
      if @user.blank?
        render html: "User Not Found"
      end
    end
end
