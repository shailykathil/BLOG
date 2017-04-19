class AddVideoToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :video, :string
  end
end
