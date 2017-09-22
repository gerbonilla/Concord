class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @profile = Profile.find_by(user: current_user)
    redirect_to profile_path(@profile)
  end
end
