class PvpLocalController < ApplicationController

  def create_model_instance 
    @pvp_local_instance = PvpLocal.new
    session[:pvp_local_instance] = @pvp_local_instance.to_json
  end

  def destroy_model_instance
    session.delete(:pvp_local_instance)
    create_model_instance
  end

  def index
    destroy_model_instance
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

    serialized_instance = session[:pvp_local_instance]

    if serialized_instance
      @pvp_local_instance = PvpLocal.new
      @pvp_local_instance.set_attributes(JSON.parse(serialized_instance))
    else 
      print("error")
    end

    # Receive and process the array data here
    received_val = (params[:val][-2..-1]).to_i
    
    # Perform any necessary actions with the array
    @pvp_local_instance.add_used_space(received_val)

    @pvp_local_instance.print_used_spaces
    session[:pvp_local_instance] = @pvp_local_instance.to_json

    
    # Respond to the AJAX request
    respond_to do |format|
      format.json { render json: { message: 'Data received and processed' } }
    end
  end
end
