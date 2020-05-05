module QuestionsHelper
  def question_header(resource)
    if @question.persisted?
      "Edit #{resource.test.title} Question"      
    else
      "Create New #{resource.title} Question"          
    end
  end
end
