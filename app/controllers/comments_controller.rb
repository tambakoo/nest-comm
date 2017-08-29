class CommentsController < ApplicationController
before_action :find_commentable
before_action :authenticate_user!, only: [:create, :destroy]

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.build(comment_params)
      if @comment.save
        redirect_to :back, notice: 'Comment added'
      else
        redirect_to :back, notice: "Comment not added"
      end
    end

    def destroy 
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to :back
    end
    

    private

    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
    end

end
