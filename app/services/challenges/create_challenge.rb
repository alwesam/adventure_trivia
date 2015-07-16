class Challenges::CreateChallenge
  include Virtus.model

  attribute :params, Hash
  attribute :adventure

  def call
    challenge = Challenge.new params_without_children
    challenge["adventure_id"] = adventure #make association with adventure
    challenge.save! #force exception if fail 
    params["questions"].each do |index, question|
      Questions::CreateQuestion.new(params: question, challenge: self).call
    end
    Riddles::CreateRiddle.new(params: params["riddle"], challenge: self).call
  end

  private 
  
  def params_without_children
    byebug
    result = params.dup
    result.delete("questions")
    result.delete("riddle")
    result
  end

end
