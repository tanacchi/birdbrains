class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string     :title
      t.text       :body
      t.references :user, foreign_key: true
      t.datetime   :made_time
      t.datetime   :updated_time
    end
  end
end
