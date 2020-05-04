class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all

    render inline: "<h1><%= @test.title %></h1><% @questions.each do |q|%><p><%= q.body %></p><%end%>"
  end

  def show
    render inline: "<h1><%= @question.body %></h1>"
  end

  def new; end

  def create
    @question = @test.questions.create(question_params)

    if @question.errors.empty?
      redirect_to test_questions_path(@test)
    else
      render inline: '<p style="color: red; font-weight: 700; font-size: 40px;"><%= @question.errors.full_messages %></p>'
    end   
  end

  def destroy
    @question.destroy

    redirect_to tests_path
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: '<p style="color: red; font-weight: 700; font-size: 40px;">Question not found</p>'
  end
end
