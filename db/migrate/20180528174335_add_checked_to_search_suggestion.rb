class AddCheckedToSearchSuggestion < ActiveRecord::Migration[5.1]
  def change
    add_column :search_suggestions, :checked, :boolean
  end
end
