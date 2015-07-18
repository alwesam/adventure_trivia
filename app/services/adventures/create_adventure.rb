class Adventures::CreateAdventure
  include Virtus.model

  attribute :params, Hash

  def call
    ActiveRecord::Base.transaction do
      create_adventure
    end
  end

  def create_adventure
    adventure = Adventure.new(params_without_children)
    #byebug
    adventure.save! 
    params["challenges"].each do |index, challenge|
      Challenges::CreateChallenge.new(params: challenge, adventure: adventure).call
    end
  end

  private 
  
  def params_without_children
    #byebug
    result = params.dup
    result.delete("challenges")
    result
  end

end
