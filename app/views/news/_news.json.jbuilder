json.extract! news, :id, :title, :description, :user_id, :published, :created_at, :updated_at
json.url news_url(news, format: :json)
