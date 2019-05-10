class GoodsController < ApplicationController

  # いいねしたときの処理
  def create
    @article = Article.find(params[:article_id])
    current_user.goodAdd(@article)
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

  # いいね解除時の処理
  def destroy
    article_id = Good.find(params[:id]).article_id
    @article = Article.find(article_id)
    current_user.unGood(@article)
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end
end
