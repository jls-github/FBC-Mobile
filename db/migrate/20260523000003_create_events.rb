class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.string :location
      t.string :address
      t.string :image_url
      t.string :registration_url
      t.string :category, default: "general"
      t.boolean :featured, default: false
      t.boolean :all_day, default: false
      t.boolean :recurring, default: false
      t.timestamps
    end
    add_index :events, :starts_at
  end
end
