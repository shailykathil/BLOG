class AddCategoryIdToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :category_id, :integer
  end
end
