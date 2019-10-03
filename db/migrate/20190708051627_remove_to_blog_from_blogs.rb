class RemoveToBlogFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :blog, :text
  end
end
