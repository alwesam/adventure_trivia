class Riddles::CreateRiddle
  include Virtus.model

  attribute :params, Hash
  attribute :challenge

  def call
    riddle = Riddle.new params 
    riddle.challenge = challenge
    riddle.save!
  end

end
