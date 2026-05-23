class CreateSermonSeries < ActiveRecord::Migration[8.1]
  def change
    create_table :sermon_series do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_url
      t.integer :year
      t.boolean :featured, default: false
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
