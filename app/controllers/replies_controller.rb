class RepliesController < ApplicationController
  def create
    @solution = Solution.find(params[:solution_id])
    @reply = @solution.replies.new(reply_params)
    if @reply.save
      redirect_to solution_path(@solution)
    else
      render 'solutions/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
