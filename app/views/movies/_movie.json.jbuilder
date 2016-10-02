json.extract! movie, :id, :title, :runtime, :description, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)