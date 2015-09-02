class AdventuresController < ApplicationController
  before_action :check_token, only: [:show]
  before_action :authenticate_user_from_token!, only: [:create]

  def index
    @adventures = Adventure.all
  end

  def show
    #before transfer details get token
    @adventure = Adventure.find params[:id]
  end

  def create
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
    service = Adventures::CreateAdventure.new(params: adventure_params, user: get_user)
    begin
      service.call
      render json: {success: true}
    rescue => e
      m = e.message
      render json: {success: false, errors: m}
    end
  end

  private

  def check_token
    adventure = Adventure.find params[:id]
    render text: "access denied" unless params[:token] == adventure.token
  end

  def get_user
    user_id = params[:token].split(':').first
    user = User.where(id: user_id).first
  end

end
