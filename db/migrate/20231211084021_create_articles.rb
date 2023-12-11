class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :creator
      t.string :path

      t.timestamps
    end
    add_index :articles, :path, unique: true
  end
end
