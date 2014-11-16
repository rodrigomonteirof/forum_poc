class AddBlacklistFields < ActiveRecord::Migration
  def change
    add_column :messages, :blacklist, :boolean
    add_column :messages, :blacklist_text, :text
  end
end
