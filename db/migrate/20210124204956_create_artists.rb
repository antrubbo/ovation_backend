class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.string :past_performances, array: true

      t.timestamps
    end
  end
end
