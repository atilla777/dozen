json.extract! word, :id, :name, :dictionary_id, :translation, :created_at, :updated_at
json.url word_url(word, format: :json)