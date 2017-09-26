class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show

    # Build accounts array
    @accounts = []
    Quovo.accounts.for_user(current_user.quovo_user_id).each do |account|
      portfolios = []
      Quovo.portfolios.for_account(account.id).each do |portfolio|
        positions = []
        asset_class = {}
        Quovo.positions.for_portfolio(portfolio.id).each do |position|
          positions << position
          asset_class[position.asset_class].nil? ? asset_class[position.asset_class] = position.value : asset_class[position.asset_class] += position.value
        end
        portfolios << {portfolio: portfolio, positions: positions, asset_class: asset_class}
      end
      @accounts << {account: account, portfolios: portfolios}
    end

    # Build positions array
    @positions = {}
    Quovo.positions.for_user(current_user.quovo_user_id).each do |p|
      @positions[p.asset_class].nil? ? @positions[p.asset_class] = p.value : @positions[p.asset_class] += p.value
    end

    # Build asset_class array per account

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
