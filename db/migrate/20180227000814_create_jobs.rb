class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :customer
      t.string :user
      t.string :title
      t.string :description
      t.string :scheduled_date
      t.string :completed_date
      t.string :status

      t.timestamps
    end
  end
end
