class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(user_params)
      redirect_to profile_url, notice: 'Your account was updated'
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to profile_url, notice: 'We are sad to see you go. Your account was canceled.'
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :bio,
      :email,
      :github,
      :linkedin,
      :twitter,
      :facebook,
      :avatar
    )
  end

end
