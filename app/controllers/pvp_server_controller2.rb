class PvpServerController < ApplicationController
  before_action :initialize_messages

  def index
  end

  def new
    @pvp_server = PvpServer.new
  end

  def create
    @pvp_server = PvpServer.new(post_params)
    if @pvp_server.save
      redirect_to @pvp_server, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def start_server
    Thread.new do
      server = TCPServer.new(2000)
      loop do
        client = server.accept
        message = client.gets.chomp
        if @messages.nil?
          @messages = []
          puts "I needed this"
        end
        @messages << "Received: #{message}"
        puts
        puts
        puts "MESSAGES"
        @messages.each do |mess|
          puts mess
        end
        puts
        puts
        client.puts("Server: Message received!")
        client.close
      end
    end

    # redirect_to root_path, notice: 'Socket server started!'
  end

  private

  def initialize_messages
    @messages = []
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end