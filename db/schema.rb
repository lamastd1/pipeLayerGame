# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_18_220440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pvp_local", primary_key: "button_no", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "is_visited", default: false
    t.boolean "up", default: false
    t.boolean "down", default: false
    t.boolean "upright", default: false
    t.boolean "upleft", default: false
    t.boolean "downright", default: false
    t.boolean "downleft", default: false
    t.boolean "right", default: false
    t.boolean "left", default: false
  end

end
