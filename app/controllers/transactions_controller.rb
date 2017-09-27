class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]

  def index
    @transactions = policy_scope(Transaction)

  end

  def show

  end

  def new
    @transaction = Transaction.new()
  end

  def create
    @transaction = Transaction.new()
    if @transaction.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end

end
