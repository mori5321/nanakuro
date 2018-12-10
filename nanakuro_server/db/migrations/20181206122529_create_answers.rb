Hanami::Model.migration do
  change do
    create_table :answers do
      primary_key :id
      column :text, String
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      foreign_key :answer_group_id, :answer_groups, on_delete: :cascade, null: false
      foreign_key :question_id, :questions, on_delete: :cascade, null: false
    end
  end
end
