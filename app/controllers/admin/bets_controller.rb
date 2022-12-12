class Admin::BetsController < AdminController
  before_action :set_bet_event, only: :cancel

  def index
    # render json: params
    @bets = Bet.includes(:item, :user).all
    @bets = @bets.where(serial_number: params[:serial_number]) if params[:serial_number].present?
    @bets = @bets.where(item: { name: params[:item_name] }) if params[:item_name].present?
    @bets = @bets.where(user: { email: params[:user_email] }) if params[:user_email].present?
    @bets = @bets.where(state: params[:state]) if params[:state].present?
    @bets = @bets.where('created_at >= ?', params[:start]) if params[:start].present?
    @bets = @bets.where('created_at <= ?', params[:end]) if params[:end].present?
  end

  def cancel
    if @bet.may_cancel?
      @bet.cancel!
      redirect_to admin_bets_path
    else
      flash[:alert] = 'Bets cant be cancel'
      redirect_to admin_bets_path
    end
  end

  private

  def set_bet_event
    @bet = Bet.find(params[:bet_id])
  end
end
