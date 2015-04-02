class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_url, notice: 'Your account was updated' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'We are sad to see you go. Your account was canceled.' }
      format.json { head :no_content }
    end
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
