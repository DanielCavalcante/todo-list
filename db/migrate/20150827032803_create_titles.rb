class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.datetime :completed_at
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
