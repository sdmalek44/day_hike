class CreateUserTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :user_trips do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
    end
  end
end
