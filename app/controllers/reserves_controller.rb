class ReservesController < ApplicationController

  # 予約したときの処理
  def create
    @car = Car.find(params[:car_id])
    current_user.reserveAdd(@car)
    respond_to do |format|
      format.html { redirect_to redirect_before_url }
      format.js
    end
  end

  # 予約解除時の処理
  def destroy
    car_id = Reserve.find(params[:id]).car_id
    @car = Car.find(car_id)
    current_user.unReserve(@car)
    respond_to do |format|
      format.html { redirect_to redirect_before_url }
      format.js
    end
  end
end
