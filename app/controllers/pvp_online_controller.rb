class PvpOnlineController < ApplicationController
  before_action :initialize_messages

  def index
  end

  def start_socket
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

    redirect_to root_path, notice: 'Socket server started!'
  end

  private

  def initialize_messages
    @messages = []
  end
end