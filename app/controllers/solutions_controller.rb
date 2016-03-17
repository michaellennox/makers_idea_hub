class SolutionsController < ApplicationController
  def create
    @problem = Problem.find(params[:problem_id])
    @solution = @problem.solutions.new(solution_params)
    if @solution.save
      redirect_to problem_path(@problem)
    else
      render 'problems/show'
    end
  end

  def show
    @solution = Solution.find(params[:id])
  end

  private

  def solution_params
    params.require(:solution).permit(:title, :description)
  end
end
