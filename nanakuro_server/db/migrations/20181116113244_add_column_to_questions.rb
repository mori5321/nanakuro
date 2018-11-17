Hanami::Model.migration do
  change do
    alter_table :questions do
      add_foreign_key :question_group_id, :question_groups, on_delete: :cascade
    end
  end
end
