json.extract! company, :id, :name, :email, :pin, :tel, :address, :created_at, :updated_at
json.url company_url(company, format: :json)
