# frozen_string_literal: true

require 'rubybrainz/entities/response'

module Rubybrainz
  module Interactors
    # This is how we will build a reasonable Rubybrainz response for each request
    class BuildResponse
      def call(httparty_response:)
        if httparty_response.code == 200
          Rubybrainz::Entities::Response.new(
            success: true,
            code: httparty_response.code,
            body: JSON.parse(httparty_response.body),
            message: httparty_response.message
          )
        else
          Rubybrainz::Entities::Response.new(
            success: false,
            code: httparty_response.code,
            message: httparty_response.message
          )
        end
      end
    end
  end
end
