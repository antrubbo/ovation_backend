class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_url
      t.date :date
      t.time :time
      t.belongs_to :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
