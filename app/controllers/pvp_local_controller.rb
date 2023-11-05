class PvpLocalController < ApplicationController

  def index
  end

  def process_button_click
    print("yay!")
  end

  def process_button_click_two
    print("oh yeahh")
  end

  def process_button
    case params[:red_button]
    when 'button_1'
      print()
      print()
      print("BUTTON 1!!")
      print()
      print()
    when 'button_3'
      print()
      print()
      print("BUTTON 3!!")
      print()
      print()
    end

    case params[:blue_button]
    when 'button_2'
      print()
      print()
      print("BUTTON 2!!")
      print()
      print()
    when 'button_4'
      print()
      print()
      print("BUTTON 4!!")
      print()
      print()
    end
  
    # Redirect or render as needed
  end
  
end
