class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]
  before_action :find_question, only: [:show, :destroy, :edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    # @test = Test.find(@question.test_id)
  end

  def create
    @question = @test.questions.create(question_params)

    if @question.save
      redirect_to test_path(@test)
    else
      render 'new'
    end   
  end

  def update
    @question = Question.find(params[:id])

    if @question.update question_params
      redirect_to question_path(@question)
    else 
      render 'edit'
    end
  end

  def destroy
    @question.destroy

    redirect_to @question.test
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
