class AgentHousesController < ApplicationController
  def index
    @agent = Agent.find(params[:agent_id])
    @houses = @agent.houses
  end
end
