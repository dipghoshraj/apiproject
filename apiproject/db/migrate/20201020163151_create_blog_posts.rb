class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :statement

      t.timestamps.strftime("%d/%m/%Y")
    end
  end
end
