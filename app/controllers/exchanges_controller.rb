class ExchangesController < ApplicationController
  def index; end

  def convert
    value = params[:target_currency] == "BTC" ? bitcoin_exchange : exchange

    render json: { "value": value }
  end

  private

  def bitcoin_exchange
    BitcoinService.process(
      params[:source_currency],
      params[:amount]
    )
  end

  def exchange
    ExchangeService.new(
      params[:source_currency],
      params[:target_currency],
      params[:amount]
    ).process
  end
end
