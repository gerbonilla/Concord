class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update]

  def show
  end

  def new
    @account = Account.new()
  end

  def create
    @account = Account.new()
    @account.profile = Profile.find(user_id: current_user.id)
    if @account.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      flash[:notice] = "Your account was updated!"
      redirect_to root_path
    else
      render :new, alert: "Error updating account."
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    # params.require(:account).permit()
  end

end
