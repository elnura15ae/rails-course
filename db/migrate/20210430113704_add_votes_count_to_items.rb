class AddVotesCountToItems < ActiveRecord::Migration[6.1]
  def change
    add_column table_name :items, column_name :votes_count, type :integer, default: 0
  end
end
