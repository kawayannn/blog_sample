class CreateArticle < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string     :title, null: false
      t.text       :content, null: false
      t.string     :image
      t.integer    :user_id
      t.timestamps
    end
  end
end
