class CommentsController < ApplicationController
  def create
		@comment=Comment.create(comment_params)
		if @comment.commenter_type == 'Question'
			@answer = Answer.find(params[:comment][:commenter_id])
			redirect_to @comment.commenter
		elsif  @comment.commenter_type == 'Answer'
			redirect_to question_path(@comment.commenter.question)
		end
	end

	def show
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commenter_id, :commenter_type)
	end


	def find_commenter

 	end
end
