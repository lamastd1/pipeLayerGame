class AddingDirections2 < ActiveRecord::Migration[7.1]
  def change
    add_column :pvp_local, :up, :boolean, default: false
    add_column :pvp_local, :down, :boolean, default: false
    add_column :pvp_local, :upright, :boolean, default: false
    add_column :pvp_local, :upleft, :boolean, default: false
    add_column :pvp_local, :downright, :boolean, default: false
    add_column :pvp_local, :downleft, :boolean, default: false
  end
end
