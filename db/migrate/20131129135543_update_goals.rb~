class UpdateGoals < ActiveRecord::Migration
  def change
    create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.integer  "weight"
    t.integer  "height"
    t.string   "description"
    t.boolean  "achieved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["user_id", "created_at"], name: "index_goals_on_user_id_and_created_at"
  end
end
