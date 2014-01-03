json.array!(@articles) do |article|
  json.extract! article, :id, :order, :title, :content, :public_at, :last_edit_at, :new_edit
  json.url article_url(article, format: :json)
end
