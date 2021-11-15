class RemoveAuthorIdFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :author_id, :integer
  end
end
