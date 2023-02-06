class CreateDulls < ActiveRecord::Migration[6.0]
  def change
    create_table :dulls do |t|

      t.timestamps
    end
  end
end
