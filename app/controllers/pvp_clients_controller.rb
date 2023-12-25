class PvpClientsController < ApplicationController
  
  def new
    @pvp_client = PvpClient.new
  end

  def show
    @pvp_client = PvpClient.find(params[:id])
  end

  def create
    @pvp_client = PvpClient.new(post_params)
    if @pvp_client.save
      redirect_to @pvp_client, notice: 'Post was successfully created.'
      puts post_params
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:pvp_client).permit(:password)
  end
end

