class RenameOrganizationToOrganisation < ActiveRecord::Migration
  def change
    rename_table :organizations, :organisations
  end
end
