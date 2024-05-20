class CreatePersonajes < ActiveRecord::Migration[7.1]
  def change
    create_table :personajes do |t|
      t.string :nombre
      t.string :raza
      t.string :clase
      t.json :primAttr
      t.json :secAttr

      t.timestamps
    end
  end
end
