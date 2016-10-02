class CreateShowings < ActiveRecord::Migration[5.0]
  def change
    create_table :showings do |t|
      t.date :date
      t.datetime :showtime
      t.references :movie, foreign_key: true
      t.references :auditorium, foreign_key: true
      t.integer :avail_seats

      t.timestamps
    end
  end
end
