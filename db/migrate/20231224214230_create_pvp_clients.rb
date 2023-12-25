class CreatePvpClients < ActiveRecord::Migration[7.1]
  def change
    create_table :pvp_clients do |t|
      t.string :password

      t.timestamps
    end
  end
end
