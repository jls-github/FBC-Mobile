class CreateGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.string :leader_name
      t.string :leader_email
      t.string :meeting_schedule
      t.string :location
      t.string :image_url
      t.string :category, default: "small_group"
      t.boolean :open_enrollment, default: true
      t.integer :capacity
      t.timestamps
    end
  end
end
