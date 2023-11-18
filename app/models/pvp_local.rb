class PvpLocal < ApplicationRecord
  self.table_name = 'pvp_local'
  self.primary_key = 'button_no'

  # Other model configurations, associations, validations, etc.

  # Example method to check if a record is visited
  def visited?
    is_visited
  end

  # Example method to mark a record as visited
  def mark_visited!
    update(is_visited: true)
  end

  # Example method to find records with specific conditions
  def self.find_visited_records
    where(is_visited: true)
  end

  def add_used_space(value, low, high)

    if self.used_spaces.size == 0
      return 
    end

    if (value > self.used_spaces[(high - low) / 2])
      self.add_used_space(value, ((high - low) / 2), high)
    end
  end 

  def determine_winner_red

    current_red = []
    board_stack = []
    red_records = PvpLocal.where('button_no < ?', 66)

    red_records.each do |record|
      current_red << record
    end

    for i in 0..current_red.length
      for j in 0..current_red.length
        if i != j && current_red[i - 1].button_no < current_red[j - 1].button_no
          temp = current_red[i - 1]
          current_red[i - 1] = current_red[j - 1]
          current_red[j - 1] = temp
        end
      end 
    end

    current_red.each do |record|
      if record.button_no < 7
        board_stack << record
      end
    end
    
    count = 0
    while !board_stack.empty? && count < 10
      # print("BOARD STACK LAST: \n")
      board_stack.each do |num|
        puts num.attributes
      end
      puts
      # print("CURRENT RED: \n")
      # current_red.each do |num|
      #   puts num.attributes
      # end
      # print("COUNT \n")
      # print(count)
      # print("\n")
      
      # puts board_stack.last.button_no
      if board_stack.last.button_no < 7
        matching_record = current_red.select do |record| 
          record[:button_no] == board_stack.last.button_no + 6 && record[:down] == false
        end
        if matching_record.any?
          matching_record[0].down = true
          board_stack << matching_record[0]
        else
          board_stack.pop
        end
      else
        matching_record = current_red.select do |record| 
          record[:button_no] == board_stack.last.button_no + 6 && record[:is_visited] == false
        end
        if matching_record.any?
          matching_record[0].up = true
          board_stack << matching_record[0]
        else
          board_stack.pop
        end
      end

      #   matching_record = current_red.select do |record| 
      #     record[:button_no] == board_stack.last.button_no - 1  && record[:is_visited] == false
      #   end
      #   if matching_record.any?
      #     # print("MATCHING RECORD \n")
      #     # print(matching_record[0].attributes)
      #     # print("\n")
      #     matching_record[0].is_visited = true
      #     board_stack << matching_record[0]
      #     puts "At least one record has button_no equal to 10."
      #   else
      #     board_stack.pop
      #     puts "No record has button_no equal to 10."
      #   end
      # end
      # if board_stack.empty?
      #   count = 1000
      # end
      count = count + 1
      if count == 10
        puts "COUNT EXCEEDED"
      end
    end
      # if ((board_stack.last + 1).in?(current_red)) && !((board_stack.last + 1).in?(board_stack)) 
      #   board_stack << board_stack.last + 1
      # elsif (board_stack.last + 6).in?(current_red)
      #   board_stack << board_stack.last + 6
      # elsif (board_stack.last - 1).in?(current_red)
      #   board_stack << board_stack.last - 1
      # elsif(board_stack.last - 6).in?(current_red)
      #   board_stack << board_stack.last - 6
      # else
      #   print("does anything happen here? \n") 
      #   board_stack.pop
      # end
      # count = count + 1
      # print("BOARD STACK \n")
      # board_stack.each do |num|
      #   puts num
      # end
  end
end