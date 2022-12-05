class CreateQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :queries do |t|
      t.integer :user_id, null: false
      t.string :query, null: false
      t.string :recorded_session, null: false
      t.boolean :found
      t.integer :counter, default: 0

      t.timestamps
    end
  end
end
