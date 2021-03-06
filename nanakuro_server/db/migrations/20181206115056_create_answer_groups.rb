Hanami::Model.migration do
  change do
    create_table :answer_groups do
      primary_key :id
      column :name, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      foreign_key :question_room_unique_id, :question_rooms, on_delete: :cascade, null: false, key: :unique_id, type: String
    end
  end
end
