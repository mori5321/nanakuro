Hanami::Model.migration do
  change do
    alter_table :answer_groups do
      drop_column :name
      add_column :name, String
    end
  end
end
