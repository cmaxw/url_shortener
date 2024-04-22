class CreateRedirections < ActiveRecord::Migration[7.1]
  def change
    create_table :redirections do |t|
      t.string :source_path
      t.string :destination_url

      t.timestamps
    end
  end
end
