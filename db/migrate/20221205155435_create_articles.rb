class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, index: true
      t.text :content, index: true

      t.timestamps
    end
  end
end
