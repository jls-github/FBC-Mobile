class CreateSermons < ActiveRecord::Migration[8.1]
  def change
    create_table :sermons do |t|
      t.string :title, null: false
      t.text :description
      t.string :speaker, default: "Pastor"
      t.date :preached_on
      t.string :video_url
      t.string :audio_url
      t.string :thumbnail_url
      t.integer :duration_minutes
      t.references :sermon_series, null: true, foreign_key: true
      t.boolean :featured, default: false
      t.string :scripture_reference
      t.timestamps
    end
    add_index :sermons, :preached_on
  end
end
