class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :email
      t.string :name

      t.timestamps null: false
    end
  end
end
