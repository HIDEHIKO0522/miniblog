class AddIntroToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :intro, :text
  end
end
