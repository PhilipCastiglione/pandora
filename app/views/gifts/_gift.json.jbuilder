json.extract! gift, :id, :description, :person, :event, :purchased, :created_at, :updated_at
json.url gift_url(gift, format: :json)
json.description gift.description.to_s
