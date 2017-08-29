include ApplicationHelper

class ArticlesController < ApplicationController
	
	before_action :authenticate_user!, only: [:create, :destroy]
	
	def index 
		@articles=Article.all
	end

	def show
		@article=Article.find(params[:id])
	end

	def new 
		@article= Article.new
	end

	def create
		@article=current_user.articles.build(article_params)
		if @article.save
			redirect_to @article 
		else 
			render 'new'
		end
	end

	def destroy
		@article=Article.find(params[:id])
			@article.destroy
			redirect_to root_path
	end





	private
		def article_params
	      params.require(:article).permit(:title, :body)
   	end



end
