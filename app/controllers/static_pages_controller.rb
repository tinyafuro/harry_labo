class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def subject

    if params[:search]
      @search = params[:search]
      @feed_items = Article.where('subject = ?', @search).paginate(page: params[:page])
      respond_to do |format|
        format.html { redirect_to subject_path }
        format.js
      end
    else
      @search = "すべての投稿"
      @feed_items = Article.all.paginate(page: params[:page])
    end

    #現在のURLを記憶
    before_location subject_path

  end

  def carshare
    @feed_items = Car.all.paginate(page: params[:page], per_page: 8)
    #現在のURLを記憶
    before_location carshare_path
  end

end
