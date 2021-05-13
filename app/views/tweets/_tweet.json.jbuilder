json.extract! tweet, :id, :author_id, :text, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
