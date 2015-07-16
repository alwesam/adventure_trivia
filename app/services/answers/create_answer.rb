class Answers::CreateAnswer
  include Virtus.model

  attribute :params, Hash
  attribute :question

  def call
    answer = Answer.new params 
    answer["question_id"] = question
    answer.save!
  end

end
