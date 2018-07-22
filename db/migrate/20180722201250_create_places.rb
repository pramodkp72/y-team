class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :lat, :precision=>10, :scale=>6
      t.decimal :lng, :precision=>10, :scale=>6
      t.string :image_uri

      t.timestamps
    end
  end
end
