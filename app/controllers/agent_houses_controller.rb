class AgentHousesController < ApplicationController
  def index
    @agent = Agent.find(params[:agent_id])

    if params[:sort] == 'alpha'
      @houses = @agent.houses.alphasort
    elsif params[:minimum_price]
      @houses = @agent.houses.where("price >= #{params[:minimum_price]}")
    else
      @houses = @agent.houses
    end
  end

  def new
    @agent = Agent.find(params[:id])
  end

  def create
    agent = Agent.find(params[:id])
    agent.houses.create(house_params)
    redirect_to "/agents/#{agent.id}/houses"
  end

private
  def house_params
    params.permit(:address, :price, :for_sale)
  end
end
