class CreateTagRules < ActiveRecord::Migration
  def change
    create_table :tag_rules do |t|
      t.string :name
      t.string :rule

      t.timestamps
    end
  end
end
