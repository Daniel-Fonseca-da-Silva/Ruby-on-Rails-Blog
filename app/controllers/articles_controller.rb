class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      @article.save
      flash[:notice] = "Article was created with sucess!"
      redirect_to @article
    else
      redirect_to new_article_path
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated with sucess!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end
