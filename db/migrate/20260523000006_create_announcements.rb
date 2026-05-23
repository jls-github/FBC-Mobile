class CreateAnnouncements < ActiveRecord::Migration[8.1]
  def change
    create_table :announcements do |t|
      t.string :title, null: false
      t.text :content
      t.string :image_url
      t.string :link_url
      t.string :link_label
      t.datetime :published_at
      t.datetime :expires_at
      t.boolean :featured, default: false
      t.integer :position, default: 0
      t.timestamps
    end
    add_index :announcements, :published_at
  end
end
