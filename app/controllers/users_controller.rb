class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # debugger  # debug用に処理停止
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      return redirect_to @user
    end

    render 'new'
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation)
  end
end
