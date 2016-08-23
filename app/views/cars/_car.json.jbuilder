json.extract! car, :id, :garage_id, :owner_id, :kind, :maker, :created_at, :updated_at
json.url car_url(car, format: :json)