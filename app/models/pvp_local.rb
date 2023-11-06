class PvpLocal

  # include ActiveModel::Model

  attr_accessor :used_spaces, :wasted_spaces

  def initialize
    super
    self.used_spaces = []
    self.wasted_spaces = []
  end

  def add_used_space(value)
    self.used_spaces << value
  end

  def add_wasted_space(value)
    self.wasted_spaces << value
  end

  def set_attributes(attributes)
    self.used_spaces = attributes['used_spaces']
    self.wasted_spaces = attributes['wasted_spaces']
  end

  def print_used_spaces
    puts self.used_spaces
  end

end
