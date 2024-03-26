json.extract! pet, :id, :name, :animal, :dob, :patient_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
