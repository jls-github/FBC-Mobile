class CreatePrayerRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :prayer_requests do |t|
      t.string :name
      t.string :email
      t.text :request, null: false
      t.boolean :anonymous, default: false
      t.boolean :public_display, default: false
      t.string :status, default: "new"
      t.timestamps
    end
  end
end
