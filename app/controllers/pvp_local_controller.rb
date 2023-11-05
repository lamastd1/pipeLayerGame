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
    # print(params[:red_button])
    (1..42).each do |i|
      if params[:red_button] == "button_#{i}"
        print("button_#{i}")
        print("\n")
      end 
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
