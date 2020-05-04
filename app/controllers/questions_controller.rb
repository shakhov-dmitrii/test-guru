class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all

    render inline: "<h1><%= @test.title %></h1><% @questions.each do |q|%><p><%= q.body %></p><%end%>"
  end

  def show
    @question = Question.find(params[:id])

    render inline: "<h1><%= @question.body %></h1>"
  end

  def new; end

  def create
    @question = Question.create(question_params)
    
    redirect_to test_questions_path(@test)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to tests_path
  end

  private
  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render inline: '<p style="color: red; font-weight: 700; font-size: 40px;">Question not found</p>'
  end
end
