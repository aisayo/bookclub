class AddSummaryToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :summary, :text
  end
end
