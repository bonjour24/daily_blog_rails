class AddAuthorIdToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :author_id, :integer
  end
end
