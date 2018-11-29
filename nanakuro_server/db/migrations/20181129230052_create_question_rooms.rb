Hanami::Model.migration do
  change do
    create_table :question_rooms do
      primary_key :id
      column :unique_id, String, null: false, unique: true
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      foreign_key :question_group_id, :question_groups, on_delete: :cascade, null: false
    end
  end
end
