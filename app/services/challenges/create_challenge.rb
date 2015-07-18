class Challenges::CreateChallenge
  include Virtus.model

  attribute :params, Hash
  attribute :adventure

  def call
    challenge = Challenge.new params_without_children
    challenge.adventure = adventure
    challenge.save! #force exception if fail 
    params["questions"].each do |index, question|
      Questions::CreateQuestion.new(params: question, challenge: challenge).call
    end
    Riddles::CreateRiddle.new(params: params["riddle"], challenge: challenge).call
  end

  private 
  
  def params_without_children
    result = params.dup
    result.delete("questions")
    result.delete("riddle")
    result
  end

end
