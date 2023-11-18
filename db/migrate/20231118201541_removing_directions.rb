class RemovingDirections < ActiveRecord::Migration[7.1]
  def change
    remove_column :pvp_local, :up
    remove_column :pvp_local, :down
    remove_column :pvp_local, :upright
    remove_column :pvp_local, :upleft
    remove_column :pvp_local, :downright
    remove_column :pvp_local, :downleft
  end
end
