class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :county
      t.string :zip_code
      t.integer :est_age
      t.integer :birth_month
      t.string :est_income

      t.timestamps null: false
    end
  end
end
