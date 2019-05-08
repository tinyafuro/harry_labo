class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.article.build(article_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to current_user
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "ArticleShare updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @user = @article.user
    @article.destroy
    flash[:success] = "Article deleted"
    # redirect_to @user
    redirect_to redirect_before_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :subject)
    end

    # 削除対象の記事を保有しているかの確認
    def correct_user
      @article = current_user.article.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
    end

end
