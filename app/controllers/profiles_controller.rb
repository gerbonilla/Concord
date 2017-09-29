class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    # Build accounts array
    @accounts = []
    portfolios = []
    positions = []
    asset_class = {}
    # Build positions array
    @positions = {}
    # Quovo.positions.for_user(current_user.quovo_user_id).each do |p|
    #   @positions[p.asset_class].nil? ? @positions[p.asset_class] = p.value : @positions[p.asset_class] += p.value
    # end

    # Build asset_class array per account

    @token = Quovo.iframe_token.create(current_user.quovo_user_id).token
    @quovo_user = current_user.quovo_user_id
  end

  def edit
  end

  def update
    # current_user.portfolios.destroy_all
    current_user.profile.accounts.destroy_all
    Quovo.accounts.for_user(current_user.quovo_user_id).each do |account|
      new_acct = Account.create(brokerage_id: account.brokerage,
        brokerage_name: account.brokerage_name,
        quovo_id: account.id,
        is_inactive: account.is_inactive,
        last_good_sync: account.last_good_sync,
        nickname: account.nickname,
        opened: account.opened,
        profile: @profile,
        value_cents: account.value.nil? ? 0 : account.value * 100)
      Quovo.portfolios.for_account(account.id).each do |portfolio|
        unless portfolio.portfolio_type == "Credit Card"
          new_portfolio = Portfolio.create(account: new_acct,
            brokerage_name: portfolio.brokerage_name,
            description: portfolio.description,
            quovo_id: portfolio.id,
            is_inactive: portfolio.is_inactive,
            is_taxable: portfolio.is_taxable,
            last_change: portfolio.last_change,
            nickname: portfolio.nickname,
            owner_type: portfolio.owner_type,
            portfolio_category: portfolio.portfolio_category,
            portfolio_name: portfolio.portfolio_name,
            portfolio_type: portfolio.portfolio_type,
            portfolio_type_confidence: portfolio.portfolio_type_confidence,
            value_cents: portfolio.value.nil? ? 0 : portfolio.value * 100)
          Quovo.positions.for_portfolio(portfolio.id).each do |position|
            Position.create(portfolio: new_portfolio,
              asset_class: position.asset_class,
              cost_basis: position.cost_basis,
              cost_basis_type: position.cost_basis_type,
              currency: position.currency,
              cusip: position.cusip,
              fx_rate: position.fxrate,
              quovo_id: position.id,
              last_purchase_date: position.last_purchase_date,
              price: position.price,
              quantity: position.quantity,
              sector: position.sector,
              security_type: position.security_type,
              security_type_confidence: position.security_type_confidence,
              ticker: position.ticker,
              ticker_name: position.ticker_name,
              value_cents: position.value.nil? ? 0 : position.value * 100)
          end
        end
      end
    end
    redirect_to root_path
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
