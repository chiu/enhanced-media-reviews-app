class CreatePosterImages < ActiveRecord::Migration
  def change
    create_table :poster_images do |t|

      t.timestamps
    end
  end
end
