json.array!(@works) do |work|
  json.extract! work, :id, :title, :description, :user_id
  json.url work_url(work, format: :json)
end
