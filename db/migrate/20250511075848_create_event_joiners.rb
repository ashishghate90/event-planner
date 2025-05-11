class CreateEventJoiners < ActiveRecord::Migration[7.2]
  def change
    create_table :event_joiners do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
