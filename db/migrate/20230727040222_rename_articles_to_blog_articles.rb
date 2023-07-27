class RenameArticlesToBlogArticles < ActiveRecord::Migration[7.0]
  def change
    rename_table :articles, :blog_articles
  end
end
