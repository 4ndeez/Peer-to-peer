json.extract! item, :id, :title, :description, :category, :price, :manufacturer, :condition, :user_id, :published, :created_at, :updated_at
json.url item_url(item, format: :json)
