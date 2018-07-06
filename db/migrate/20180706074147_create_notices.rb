class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string     :name,     null: false
      t.boolean    :has_read, null: false, default: false
      t.string     :message
      t.references :user,  foreign_key: true
      t.datetime   :created_at
    end
  end
end
