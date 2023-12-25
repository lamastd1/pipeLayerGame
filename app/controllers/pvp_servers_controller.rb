class PvpServersController < ApplicationController
  
  def new
    @pvp_server = PvpServer.new
  end

  def show
    @pvp_server = PvpServer.find(params[:id])
  end

  def create
    @pvp_server = PvpServer.new(post_params)
    if @pvp_server.save
      redirect_to @pvp_server, notice: 'Post was successfully created.'
      puts post_params
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:pvp_server).permit(:password)
  end
end
