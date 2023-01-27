class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article  = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article  = Article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created with sucess!"
      redirect_to @article
    else
      render 'new'
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated with sucess!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy

    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path

    # @article.destroy

    # respond_to do |format|
    #   format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
