class AddAvatarToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :avatar, :string
  end
end
