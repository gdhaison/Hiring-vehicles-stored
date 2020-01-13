class AddDesToHirings < ActiveRecord::Migration[5.2]
  def change
    add_column :hirings, :des, :string, default: "Not paid yet"
  end
end
