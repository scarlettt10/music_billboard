class AddBillboardRefToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :billboard, foreign_key: true
  end
end
