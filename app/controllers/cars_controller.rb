class CarsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @car = Car.find(params[:id])
    set_car_id(@car.id)
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = current_user.car.build(car_params)
    if @car.save
      flash[:success] = "Car created!"
      redirect_to current_user
    else
      @feed_items = []
      render 'cars/new'
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(car_params)
      flash[:success] = "CarShare updated"
      redirect_to @car
    else
      render 'edit'
    end
  end

  def destroy
    @user = @car.user
    @car.destroy
    flash[:success] = "Car deleted"
    redirect_to @user
    # redirect_to request.referrer || root_url
  end

  private

    def car_params
      params.require(:car).permit(:title, :body, :carmodel, :carsize, :other, :picture)
    end

    # 削除対象の記事を保有しているかの確認
    def correct_user
      @car = current_user.car.find_by(id: params[:id])
      redirect_to root_url if @car.nil?
    end
end
