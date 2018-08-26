class AddNumberToAuditoria < ActiveRecord::Migration[5.0]
  def change
    add_column :auditoria, :number, :integer
  end
end
