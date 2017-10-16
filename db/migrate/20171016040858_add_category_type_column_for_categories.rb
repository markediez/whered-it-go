class AddCategoryTypeColumnForCategories < ActiveRecord::Migration[5.0]
  def change
	add_column :categories, :category_type, :string, :default => "BUDGET"
  end
end
