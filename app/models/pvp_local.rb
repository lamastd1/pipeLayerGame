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
end