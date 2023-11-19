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

    if (board_stack.last[direction_col] == true)
      return false
    end
    matching_record = color.select do |record| 
      if record.button_no == 59
        print("RECORD BUTTON NO: ")
        puts record[:button_no]
        print("BOARD STACK: ")
        puts board_stack.last.button_no
        print("DIRECTION INT: ")
        puts direction_int
        puts
      end
      record[:button_no] == board_stack.last.button_no + direction_int
    end
    if matching_record.any?
      board_stack.last[direction_col] = true
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
      if record.button_no < 6
        board_stack << record
      end
    end
    
    count = 0
    while !board_stack.empty? && count < 2000

      # board_stack.each do |bs|
      #   print(bs.button_no)
      #   print(" ")
      # end
      # puts 

      if board_stack.last[:button_no] > 29 && board_stack.last[:button_no] < 36
        return true 
      end
      if board_stack.last.button_no < 36 && board_stack.last.button_no % 6 == 0
        find_piece(current_red, :down, 6, board_stack) == false ? 
          (find_piece(current_red, :downright, (36 - board_stack.last.button_no.div(6)), board_stack) == false ? board_stack.pop : next)
        : next
      elsif board_stack.last.button_no < 36 && board_stack.last.button_no % 6 == 5
        find_piece(current_red, :down, 6, board_stack) == false ? 
          (find_piece(current_red, :downleft, (36 - 1 - board_stack.last.button_no.div(6)), board_stack) == false ? board_stack.pop : next)
        : next
      elsif board_stack.last.button_no < 5
        find_piece(current_red, :down, 6, board_stack) == false ? 
          (find_piece(current_red, :downright, (36 - board_stack.last.button_no.div(6)), board_stack) == false ? 
            (find_piece(current_red, :downleft, (36 - 1 - board_stack.last.button_no.div(6)), board_stack) == false ? board_stack.pop : next) 
          : next) 
        : next
      elsif board_stack.last.button_no < 30
        find_piece(current_red, :down, 6, board_stack) == false ? 
          (find_piece(current_red, :up, -6, board_stack) == false ? 
            (find_piece(current_red, :downright, (36 - board_stack.last.button_no.div(6)), board_stack) == false ? 
              (find_piece(current_red, :downleft, (36 - 1 - board_stack.last.button_no.div(6)), board_stack) == false ? 
                (find_piece(current_red, :upright, (31 - board_stack.last.button_no.div(6)), board_stack) == false ? 
                  (find_piece(current_red, :upleft,(31 - 1 - board_stack.last.button_no.div(6)), board_stack) == false ? board_stack.pop : next) 
                : next) 
              : next) 
            : next) 
          : next)
        : next
      elsif board_stack.last.button_no < 36
        find_piece(current_red, :up, -6, board_stack) == false ? 
          (find_piece(current_red, :upright, (31 - board_stack.last.button_no.div(6)), board_stack) == false ? 
            (find_piece(current_red, :upleft, (31 - 1 - board_stack.last.button_no.div(6)), board_stack) == false ? board_stack.pop : next) 
          : next) 
        : next 
      elsif (board_stack.last.button_no - 36) % 5 == 0
        find_piece(current_red, :right, 1, board_stack) == false ? 
          (find_piece(current_red, :upright, (-36 + 1 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
            (find_piece(current_red, :upleft, (-36 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
              (find_piece(current_red, :downright, (-30 + 1 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
                (find_piece(current_red, :downleft, (-30 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? board_stack.pop : next)
              : next) 
            : next) 
          : next)
        : next
      elsif (board_stack.last.button_no - 36) % 5 == 4
        find_piece(current_red, :left, -1, board_stack) == false ? 
          (find_piece(current_red, :upright, (-36 + 1 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
            (find_piece(current_red, :upleft, (-36 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
              (find_piece(current_red, :downright, (-30 + 1 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
                (find_piece(current_red, :downleft, (-30 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? board_stack.pop : next)
              : next) 
            : next) 
          : next)
        : next
      else 
        find_piece(current_red, :right, 1, board_stack) == false ? 
          (find_piece(current_red, :left, -1, board_stack) == false ? 
            (find_piece(current_red, :upright, (-36 + 1 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
              (find_piece(current_red, :upleft, (-36 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
                (find_piece(current_red, :downright, (-30 + 1 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? 
                  (find_piece(current_red, :downleft, (-30 + ((board_stack.last.button_no - 36).div(5))), board_stack) == false ? board_stack.pop : next)
                : next) 
              : next) 
            : next)
          : next)
        : next
        
      end
      count = count + 1
      if count == 2000
        puts "COUNT EXCEEDED"
      end
    end
    return false
  end
end