class AgentsController < ApplicationController
  def index
    @agents = Agent.newest_first
  end

  def show
    @agent = Agent.find(params[:id])
    @houses = @agent.houses
  end
end
