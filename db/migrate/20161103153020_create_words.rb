class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :name
      t.references :dictionary, foreign_key: true
      t.string :translation

      t.timestamps
    end
    add_index :words, :name
    add_index :words, :translation
  end
end
