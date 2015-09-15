class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
    redirect_to article_path(@article)

    flash.notice = "'#{@article.title}' was created!"
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "'#{@article.title}' was updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "'#{@article.title}' was deleted!"

    redirect_to articles_path
  end
end
