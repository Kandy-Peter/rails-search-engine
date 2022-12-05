class CreateQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :queries do |t|
      t.integer :user_id, index: true, null: false
      t.string :query, index: true, null: false
      t.string :recorded_session, index: true, null: false
      t.boolean :found
      t.integer :counter, default: 1

      t.timestamps
    end
  end
end
