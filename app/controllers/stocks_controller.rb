# frozen_string_literal: true
class StocksController < ApplicationController
  before_action :authenticate_user!

  def create
    @work = Work.find(stock_params[:work_id])
    current_user.stock(@work)
    respond_to do |format|
      format.html { redirect_to work_url(@work) }
      format.js
    end
  end

  def destroy
    @work = Stock.find(params[:id]).work
    current_user.unstock(@work)
    respond_to do |format|
      format.html { redirect_to work_url(@work) }
      format.js
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:work_id)
  end
end
