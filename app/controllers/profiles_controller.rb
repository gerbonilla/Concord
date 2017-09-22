class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @quovo_accounts = Quovo.accounts.for_user(current_user.quovo_user_id)
    @token = Quovo.iframe_token.create(current_user.quovo_user_id).token
    @quovo_user = current_user.quovo_user_id
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "Your profile was updated!"
      redirect_to root_path
    else
      render :new, alert: "Error updating profile."
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def profile_params
    # params.require(:profile).permit()
  end

end
