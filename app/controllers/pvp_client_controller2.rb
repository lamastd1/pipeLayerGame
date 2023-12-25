class PvpClientController < ApplicationController
  def index
    # Display the client-side view
  end

  def send_message
    # message = params[:message]

    message = "Client clicked button"

    puts (message)

    # Connect to the server
    client = TCPSocket.new('127.0.0.1', 2000)
    
    # Send a message to the server
    client.puts(message)

    # Read and print the server's response
    response = client.gets.chomp
    puts "Server response: #{response}"

    # Close the socket
    client.close

    redirect_to root_path, notice: "Message sent to server: #{message}"
    puts("Message sent to server: #{message}")
  end
end