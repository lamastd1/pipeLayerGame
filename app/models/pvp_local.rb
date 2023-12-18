class PvpLocal < ApplicationRecord
  self.table_name = 'pvp_local'
  self.primary_key = 'button_no'

  STRONG_DIRECTION_USABLE_SPACES = 36
  WEAK_DIRECTION_USABLE_SPACES = 30
  TOTAL_USABLE_SPACES = 66

  def find_used_moves(used_moves)
    used_numbers = []
    used_moves.each do |record|
      used_numbers << record.button_no
    end
    return used_numbers
  end

  def find_piece(color, direction_col, direction_int, stack)

    if (stack.last[direction_col] == true)
      return false
    end
    matching_record = color.select do |record| 
      if record.button_no == 59
        print("RECORD BUTTON NO: ")
        puts record[:button_no]
        print("BOARD STACK: ")
        puts stack.last.button_no
        print("DIRECTION INT: ")
        puts direction_int
        puts
      end
      record[:button_no] == stack.last.button_no + direction_int
    end
    if matching_record.any?
      stack.last[direction_col] = true
      stack << matching_record[0]
      return true
    else
      return false
    end
  end


  def check_board(stack, current, changenum)
    
    count = 0
    print("CHANGENUM: ")
    puts changenum
    while !stack.empty? && count < 2000

      stack.each do |bs|
        print(bs.button_no)
        print(" ")
      end
      puts 

      if stack.last[:button_no] > (29 + changenum) && stack.last[:button_no] < (36 + changenum)
        return true 
      end
      if stack.last.button_no < (36 + changenum) && (stack.last.button_no - changenum) % 6 == 0
        find_piece(current, :down, 6, stack) == false ? 
          (find_piece(current, :downright, (36 - (stack.last.button_no - changenum).div(6)), stack) == false ? stack.pop : next)
        : next
      elsif stack.last.button_no < 36 && (stack.last.button_no - changenum) % 6 == 5
        find_piece(current, :down, 6, stack) == false ? 
          (find_piece(current, :downleft, (36 - 1 - (stack.last.button_no - changenum).div(6)), stack) == false ? stack.pop : next)
        : next
      elsif stack.last.button_no < 5 + changenum
        find_piece(current, :down, 6, stack) == false ? 
          (find_piece(current, :downright, (36 - (stack.last.button_no - changenum).div(6)), stack) == false ? 
            (find_piece(current, :downleft, (36 - 1 - (stack.last.button_no - changenum).div(6)), stack) == false ? stack.pop : next) 
          : next) 
        : next
      elsif stack.last.button_no < 30 + changenum
        find_piece(current, :down, 6, stack) == false ? 
          (find_piece(current, :up, -6, stack) == false ? 
            (find_piece(current, :downright, (36 - (stack.last.button_no - changenum).div(6)), stack) == false ? 
              (find_piece(current, :downleft, (36 - 1 - (stack.last.button_no - changenum).div(6)), stack) == false ? 
                (find_piece(current, :upright, (31 - (stack.last.button_no - changenum).div(6)), stack) == false ? 
                  (find_piece(current, :upleft,(31 - 1 - (stack.last.button_no - changenum).div(6)), stack) == false ? stack.pop : next) 
                : next) 
              : next) 
            : next) 
          : next)
        : next
      elsif stack.last.button_no < 36 + changenum
        find_piece(current, :up, -6, stack) == false ? 
          (find_piece(current, :upright, (31 - (stack.last.button_no - changenum).div(6)), stack) == false ? 
            (find_piece(current, :upleft, (31 - 1 - (stack.last.button_no - changenum).div(6)), stack) == false ? stack.pop : next) 
          : next) 
        : next 
      elsif stack.last.button_no < 66 + changenum && ((stack.last.button_no - changenum) - 36) % 5 == 0
        find_piece(current, :right, 1, stack) == false ? 
          (find_piece(current, :upright, (-36 + 1 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
            (find_piece(current, :upleft, (-36 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
              (find_piece(current, :downright, (-30 + 1 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
                (find_piece(current, :downleft, (-30 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? stack.pop : next)
              : next) 
            : next) 
          : next)
        : next
      elsif stack.last.button_no < 66 + changenum && ((stack.last.button_no - changenum) - 36) % 5 == 4
        find_piece(current, :left, -1, stack) == false ? 
          (find_piece(current, :upright, (-36 + 1 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
            (find_piece(current, :upleft, (-36 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
              (find_piece(current, :downright, (-30 + 1 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
                (find_piece(current, :downleft, (-30 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? stack.pop : next)
              : next) 
            : next) 
          : next)
        : next
      elsif stack.last.button_no < 66 + changenum
        find_piece(current, :right, 1, stack) == false ? 
          (find_piece(current, :left, -1, stack) == false ? 
            (find_piece(current, :upright, (-36 + 1 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
              (find_piece(current, :upleft, (-36 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
                (find_piece(current, :downright, (-30 + 1 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? 
                  (find_piece(current, :downleft, (-30 + (((stack.last.button_no - changenum) - 36).div(5))), stack) == false ? stack.pop : next)
                : next) 
              : next) 
            : next)
          : next)
        : next
      end
    end
    return false
  end

  def determine_winner

    current_red = []
    current_blue = []
    red_stack = []
    blue_stack = []
    red_records = PvpLocal.where('button_no < ?', 66)
    blue_records = PvpLocal.where('button_no > ?', 66)

    red_records.each do |record|
      current_red << record
    end

    blue_records.each do |record|
      current_blue << record
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

    for i in 0..current_blue.length
      for j in 0..current_blue.length
        if i != j && current_blue[i - 1].button_no < current_blue[j - 1].button_no
          temp = current_blue[i - 1]
          current_blue[i - 1] = current_blue[j - 1]
          current_blue[j - 1] = temp
        end
      end 
    end

    current_red.each do |record|
      if record.button_no < 6
        red_stack << record
      end
    end

    current_blue.each do |record|
      if record.button_no < 6 + 100
        blue_stack << record
      end
    end

    # puts "RED:"
    # current_red.each do |bs|
    #   print(bs.button_no)
    #   print(" ")
    # end
    # puts 
    # puts "BLUE:"
    # current_blue.each do |bs|
    #     print(bs.button_no)
    #     print(" ")
    # end
    # puts 

    if check_board(red_stack, current_red, 0)
      return 1
    elsif check_board(blue_stack, current_blue, 100)
      return 2
    else
      return 0
    end

    red_stack = []
    blue_stack = []
    
    # count = 0
    # while !red_stack.empty? && !blue_stack.empty? && count < 2000

    #   # red_stack.each do |bs|
    #   #   print(bs.button_no)
    #   #   print(" ")
    #   # end
    #   # puts 

    #   if red_stack.last[:button_no] > 29 && red_stack.last[:button_no] < 36
    #     return true 
    #   end
    #   if red_stack.last.button_no < 36 && red_stack.last.button_no % 6 == 0
    #     find_piece(current_red, :down, 6, red_stack) == false ? 
    #       (find_piece(current_red, :downright, (36 - red_stack.last.button_no.div(6)), red_stack) == false ? red_stack.pop : next)
    #     : next
    #   elsif red_stack.last.button_no < 36 && red_stack.last.button_no % 6 == 5
    #     find_piece(current_red, :down, 6, red_stack) == false ? 
    #       (find_piece(current_red, :downleft, (36 - 1 - red_stack.last.button_no.div(6)), red_stack) == false ? red_stack.pop : next)
    #     : next
    #   elsif red_stack.last.button_no < 5
    #     find_piece(current_red, :down, 6, red_stack) == false ? 
    #       (find_piece(current_red, :downright, (36 - red_stack.last.button_no.div(6)), red_stack) == false ? 
    #         (find_piece(current_red, :downleft, (36 - 1 - red_stack.last.button_no.div(6)), red_stack) == false ? red_stack.pop : next) 
    #       : next) 
    #     : next
    #   elsif red_stack.last.button_no < 30
    #     find_piece(current_red, :down, 6, red_stack) == false ? 
    #       (find_piece(current_red, :up, -6, red_stack) == false ? 
    #         (find_piece(current_red, :downright, (36 - red_stack.last.button_no.div(6)), red_stack) == false ? 
    #           (find_piece(current_red, :downleft, (36 - 1 - red_stack.last.button_no.div(6)), red_stack) == false ? 
    #             (find_piece(current_red, :upright, (31 - red_stack.last.button_no.div(6)), red_stack) == false ? 
    #               (find_piece(current_red, :upleft,(31 - 1 - red_stack.last.button_no.div(6)), red_stack) == false ? red_stack.pop : next) 
    #             : next) 
    #           : next) 
    #         : next) 
    #       : next)
    #     : next
    #   elsif red_stack.last.button_no < 36
    #     find_piece(current_red, :up, -6, red_stack) == false ? 
    #       (find_piece(current_red, :upright, (31 - red_stack.last.button_no.div(6)), red_stack) == false ? 
    #         (find_piece(current_red, :upleft, (31 - 1 - red_stack.last.button_no.div(6)), red_stack) == false ? red_stack.pop : next) 
    #       : next) 
    #     : next 
    #   elsif red_stack.last.button_no < 66 && (red_stack.last.button_no - 36) % 5 == 0
    #     find_piece(current_red, :right, 1, red_stack) == false ? 
    #       (find_piece(current_red, :upright, (-36 + 1 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #         (find_piece(current_red, :upleft, (-36 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #           (find_piece(current_red, :downright, (-30 + 1 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #             (find_piece(current_red, :downleft, (-30 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? red_stack.pop : next)
    #           : next) 
    #         : next) 
    #       : next)
    #     : next
    #   elsif red_stack.last.button_no < 66 && (red_stack.last.button_no - 36) % 5 == 4
    #     find_piece(current_red, :left, -1, red_stack) == false ? 
    #       (find_piece(current_red, :upright, (-36 + 1 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #         (find_piece(current_red, :upleft, (-36 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #           (find_piece(current_red, :downright, (-30 + 1 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #             (find_piece(current_red, :downleft, (-30 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? red_stack.pop : next)
    #           : next) 
    #         : next) 
    #       : next)
    #     : next
    #   elsif red_stack.last.button_no < 66 
    #     find_piece(current_red, :right, 1, red_stack) == false ? 
    #       (find_piece(current_red, :left, -1, red_stack) == false ? 
    #         (find_piece(current_red, :upright, (-36 + 1 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #           (find_piece(current_red, :upleft, (-36 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #             (find_piece(current_red, :downright, (-30 + 1 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? 
    #               (find_piece(current_red, :downleft, (-30 + ((red_stack.last.button_no - 36).div(5))), red_stack) == false ? red_stack.pop : next)
    #             : next) 
    #           : next) 
    #         : next)
    #       : next)
    #     : next
    #   elsif red_stack.last.button_no < 136 && (red_stack.last.button_no - 100) % 6 == 0
    #     find_piece(current_blue, :down, 6, red_stack) == false ? 
    #       (find_piece(current_blue, :downright, (36 - (red_stack.last.button_no - 100).div(6)), blue_stack) == false ? red_stack.pop : next)
    #     : next
    #   end
    #   count = count + 1
    #   if count == 2000
    #     puts "COUNT EXCEEDED"
    #   end
    # end
    # return false
  end
end