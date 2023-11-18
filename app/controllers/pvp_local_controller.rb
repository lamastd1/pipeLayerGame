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
  end

  def action

    # Receive and process the array data here
    used_val = params[:val][7..-1]

    print("USED VAL: \n")
    print(used_val)

    # Perform any necessary actions with the array
    current_move = PvpLocal.create(button_no: used_val, is_visited: false)

    current_move.determine_winner_red
  
    # Respond to the AJAX request
    respond_to do |format|
      format.json { render json: { message: 'Data received and processed' } }
    end
  end
end
