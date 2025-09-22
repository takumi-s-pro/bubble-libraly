class CreateNovels < ActiveRecord::Migration[7.1]
  def change
    create_table :novels do |t|
      t.string :title, null: false
      t.text :content, null: false, limit: 1000
      t.references :user, null: false, foreign_key: true
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
