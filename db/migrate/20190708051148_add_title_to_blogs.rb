class AddTitleToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blog, :text
  end
end
