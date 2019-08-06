Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # Insert CORS request headers for API responses
  allow do
    # Access-Control-Allow-Origin: (Origin に書かれたものをそのまま返す)
    origins '*'

    # /api 以下の URL に対してのみ、CORS 対応
    # Access-Control-Allow-Methods: GET, POST, OPTIONS
    # Access-Control-Allow-Headers: (OPTIONS に対してのみ Access-Control-Request-Headers に書かれたものをそのまま返す)
    # Access-Control-Max-Age: 3600
    resource '/api/*',
             methods: [:get, :post],
             headers: :any,
             max_age: 3600
  end
end
