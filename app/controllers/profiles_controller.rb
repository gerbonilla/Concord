class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = Profile.new()
  end

  def create
    @profile = Profile.new()
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
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
  end

  def profile_params
    # params.require(:profile).permit()
  end

end
