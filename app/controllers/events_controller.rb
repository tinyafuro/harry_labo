class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:destroy]
  before_action :correct_user,   only: [:destroy]

  # GET /events
  # GET /events.json
  def index
    # @events = Event.all
    @events = Event.where("car_id = ?", get_car_id)
  end

  # 各ユーザーの予約リスト（自分が予約したリスト）
  def rlist
    @events = Event.where("user_id = ?", current_user.id)
    #現在のURLを記憶
    before_location rlist_path
  end

  # 各ユーザーが投稿したカーシェアに入った予約情報のリスト（予約されたリスト）
  def rmanage

    # 空の配列を準備
    car_ids = []
    # 自身が投稿したカーシェア情報
    @cars = Car.where("user_id = ?", current_user.id)
    # 自身が投稿したカーシェア情報のIDのみを配列に格納
    @cars.each do |car|
      car_ids << car.id
    end
    # 自身が投稿したカーシェア情報と紐づいた予約情報を取得
    @events = Event.where("car_id IN (?)", car_ids)

    #現在のURLを記憶
    before_location rmanage_path
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @car = Car.find(get_car_id)
    @user = User.find(Event.find(params[:id]).user_id)
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.title = "予約済"
    @event.user_id = current_user.id
    @event.car_id = get_car_id
    @event.start_date = params[:start_date]
    @event.end_date = params[:start_date]
    # 予約データを登録
    @event.save
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to contact_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :user_id, :car_id, :start_date, :end_date)
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
