module API
  module Errors
    extend ActiveSupport::Concern

    included do
      rescue_from :all do |e|
        # When required params are missing or user validation.
        if e.class == Grape::Exceptions::ValidationErrors
          error!(e.message, 406)
          
        # Record not found
        elsif e.class == ActiveRecord::RecordNotFound
          error!("Record not found", 404)

        # Record validation fails
        elsif e.class == ActiveRecord::RecordInvalid
          message = e.record.errors.messages.map { |attr, msg| msg.first }
          error!(message.join(", "), 400)
          
        # When all hell broke loose
        else
          Rails.logger.error "\n#{e.class.name} (#{e.message}):"
          e.backtrace.each { |line| Rails.logger.error line }
          Rack::Response.new({
            error: 'Bad Request'
          }.to_json, 400)
        end
        
      end
    end
  end
end