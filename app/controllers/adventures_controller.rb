class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
  end

  def show
    #before transfer details get token
    @adventure = Adventure.find params[:id]
  end

  def create
    #answers_params = {answers: [:content]} 
    #questions_params = {questions: [:content, :answer, :answers_param]}
    #challenges_params = {challenges: [:address, :question_params]}
    adventure_params = params.require(:adventure).permit(:title, 
                                                         :description, 
                                                         :include_final, 
                                                         challenges: [:address,
                                                                      riddle: [:content, :solution, :hint],
                                                                      questions: 
                                                                        [:content,
                                                                         :answer,
                                                                         answers: [:content, :correct]
                                                                        ]
                                                                      ])
    #adventure_params = params.require(:adventure).permit(:title, :description, :include_final, :challenges_params) 
    service = Adventures::CreateAdventure.new(params: adventure_params)
    begin
      service.call
      render json: {success: true}
    rescue => e
      m = e.message
      render json: {success: false, errors: m}
    end
  end

end
