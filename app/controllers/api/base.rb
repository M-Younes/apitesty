module API
  class Base < Grape::API
  	
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    prefix "api"
    version "v1", using: :path    
    include API::Errors
    mount API::V1::Owners
    mount API::V1::Articles
  end
end
