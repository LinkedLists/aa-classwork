class CreatePoll < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string "title", null: false
      t.integer "user_id", null: false, unique: true
      t.timestamp
    end
  end
end
