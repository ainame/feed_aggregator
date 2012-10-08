class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :site_id
      t.string :title
      t.text :body
      t.datetime :posted_at

      t.timestamps
    end
  end
end
