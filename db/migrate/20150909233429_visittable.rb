class Visittable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :shortened_url_id, null: false
      t.integer :user_id, null: false
      t.integer :visit_number, null: false
      t.timestamps
    end

    add_index :visits, :shortened_url_id, unique: true

  end
end
