class CreateGenre < ActiveRecord::Migration
  #pop = Genre.create(:name => "Pop")
  def change
    create_table :genres do |t|
      t.string :name
    end
  end
end
