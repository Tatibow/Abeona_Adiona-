class CommentsController < ApplicationController

    def index
        comments = Comment.all
        render json: comments, status: :ok
    end

    def create
        comment = Comment.create!(comment_params)
        render json:comment, status: :created
    end


    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        head :no_content
    end

    private

    def comment_params
        params.permit(:content, :review_id)
    end
end
