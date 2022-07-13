class AgentsController < ApplicationController
  def index
    @agents = Agent.newest_first
  end

  def show
    @agent = Agent.find(params[:id])
    @houses = @agent.houses
  end

  def new
  end

  def create
    @agent = Agent.create(agent_params)
    redirect_to "/agents"
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def update
    agent = Agent.find(params[:id])
    agent.update(agent_params)
    redirect_to "/agents/#{agent.id}"
  end

  def destroy
    agent = Agent.find(params[:id])
    agent.destroy
    redirect_to '/agents'
  end

private
  def agent_params
    params.permit(:name, :review_rating, :licensed_realtor)
  end
end
