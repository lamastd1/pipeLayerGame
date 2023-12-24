class PvpLocalController < ApplicationController

  def delete_all_rows
    # Delete all rows from the table
    PvpLocal.delete_all

    # Optionally, you can redirect or render a response
    # redirect_to root_path, notice: 'All rows deleted successfully'
  end
  def index
    delete_all_rows
  end

  def process_button
    (1..42).each do |i|
      if params[:red_button] == "button_#{i}"
        print("\n")
        print("button_#{i}")
        print("\n")

      end 
    end

    (43..84).each do |i|
      if params[:blue_button] == "button_#{i}"
        print("\n")
        print("button_#{i}")
        print("\n")
      end 
    end

    # action 

  end

  def action

    # Receive and process the array data here
    used_val = params[:val][7..-1]

    # Perform any necessary actions with the array
    current_move = PvpLocal.create(button_no: used_val, is_visited: false)

    # result = `python3 #{Rails.root}/app/python/ai.py #{PvpLocal.pluck(:button_no).join(' ')}` 
    # result =  result + (PvpLocal.pluck(:button_no).each{ |item| " " + item.to_s) }).to_s
    # puts result
    # puts "Result from Python script:\n#{result}"

    @game_result2 = current_move.determine_winner
    if @game_result2 == 1
      puts "red wins"
    elsif @game_result2 == 2
      puts "blue wins"
    else
      puts "game is not over"
    end

    print("RESULT:")
    puts @result2
  
    # Respond to the AJAX request
    respond_to do |format|
      format.json { render json: 
        { message: 'Data received and processed',
          result: @result 
        } 
      }
    end
  end
end
