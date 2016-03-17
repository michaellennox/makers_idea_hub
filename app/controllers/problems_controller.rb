class ProblemsController < ApplicationController
  def index
    @problem = Problem.new
    @problems = Problem.all
  end

  def show
    @solution = Solution.new
    @problem = Problem.find(params[:id])
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problems_path
    else
      render 'index'
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :description)
  end
end
