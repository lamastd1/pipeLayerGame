class AddingDirections < ActiveRecord::Migration[7.1]
  def change
    add_column :pvp_local, :up, :integer, default: false
    add_column :pvp_local, :down, :integer, default: false
    add_column :pvp_local, :upright, :integer, default: false
    add_column :pvp_local, :upleft, :integer, default: false
    add_column :pvp_local, :downright, :integer, default: false
    add_column :pvp_local, :downleft, :integer, default: false
  end
end
