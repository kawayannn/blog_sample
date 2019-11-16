class ArticlesController < ApplicationController

  before_action :move_to_index, except: [:index,:show]
  # before_action :set_user
  def index
    @articles = Article.all.order(created_at: :DESC)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def edit 
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
     article.update(article_params)
     redirect_to "/articles/#{article.id}/"
    end
  end


  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id 
      article.destroy
      redirect_to root_path
    end
  end

  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def article_params
    params.require(:article).permit(:title,:content,:image).merge(user_id: current_user.id)
  end
end