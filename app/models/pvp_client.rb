class PvpClient < ApplicationRecord
  validates_uniqueness_of :password
end
