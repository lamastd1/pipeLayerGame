class PvpServer < ApplicationRecord
  validates_uniqueness_of :password
end
