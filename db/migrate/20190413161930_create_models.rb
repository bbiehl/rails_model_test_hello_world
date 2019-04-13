class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
