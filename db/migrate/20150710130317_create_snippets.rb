class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer :language
      t.text :plain_code
      t.text :highlighted_code

      t.timestamps null: false
    end
  end
end
