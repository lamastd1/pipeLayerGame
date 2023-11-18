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

  def find_piece(color, direction_col, direction_int, board_stack)

    matching_record = color.select do |record| 
      record[:button_no] == board_stack.last.button_no + direction_int && record[direction_col] == false
    end
    if matching_record.any?
      matching_record[0][direction_col] = true
      board_stack << matching_record[0]
      return true
    else
      return false
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
    while !board_stack.empty? && count < 50
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
        if find_piece(current_red, :down, 6, board_stack) == false
          if find_piece(current_red, :downright, 36, board_stack) == false
            if find_piece(current_red, :downleft, 35, board_stack) == false
              board_stack.pop
            else 
              next
            end
          else
            next
          end
        else
          next
        end
      elsif board_stack.last.button_no < 31
        # find_piece(current_red, :down, 6, board_stack)
        if find_piece(current_red, :up, -6, board_stack) == false
          board_stack.pop
        end
        # find_piece(current_red, :downright, 36, board_stack)
        # find_piece(current_red, :downleft, 35, board_stack)
        # find_piece(current_red, :upright, 28, board_stack)
        # find_piece(current_red, :upleft, 27, board_stack)
      else 
        find_piece(current_red, :up, -6, board_stack)
        find_piece(current_red, :upright, 28, board_stack)
        find_piece(current_red, :upleft, 27, board_stack)
      end
      count = count + 1
      if count == 50
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