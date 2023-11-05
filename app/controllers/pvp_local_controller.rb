class PvpLocalController < ApplicationController

  def index
  end

  def process_button
    # print(params[:red_button])
    (1..42).each do |i|
      if params[:red_button] == "button_#{i}"
        print("button_#{i}")
        print("\n")
      end 
    end

    (43..84).each do |i|
      if params[:blue_button] == "button_#{i}"
        print("button_#{i}")
        print("\n")
      end 
    end
  end
end
