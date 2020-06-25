class CreateTheftsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :thefts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :address
      t.string :source_url
      t.string :image_url

      t.timestamps
    end
  end
end
