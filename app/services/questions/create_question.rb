class Questions::CreateQuestion
  include Virtus.model

  attribute :params, Hash
  attribute :challenge

  def call
    question = Question.new params_without_children 
    question.challenge = challenge
    question.save!
    params["answers"].each do |index, answer|
      Answers::CreateAnswer.new(params: answer, question: question).call
    end
  end

  private 
  
  def params_without_children
    result = params.dup
    result.delete("answers")
    result
  end

end
