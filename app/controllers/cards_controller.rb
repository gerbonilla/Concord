class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update]

  def show
  end

  def new
    @card = Card.new()
  end

  def create
    @card = Card.new()
    if @card.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      flash[:notice] = "Your card was updated!"
      redirect_to root_path
    else
      render :new, alert: "Error updating card."
    end
  end

  def destroy
    @card.destroy
    redirect_to root_path
  end

  private

  def set_card
    @card = Card.find(params[:id])
    authorize @card
  end

  def card_params
    # params.require(:account).permit()
  end

end
