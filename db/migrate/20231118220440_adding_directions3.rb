class AddingDirections3 < ActiveRecord::Migration[7.1]
  def change
    add_column :pvp_local, :right, :boolean, default: false
    add_column :pvp_local, :left, :boolean, default: false
  end
end
