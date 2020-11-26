# frozen_string_literal: true

require 'rubybrainz/entities/response'

module Rubybrainz
  module Interactors
    # This is how we will build a reasonable Rubybrainz response for each request
    class BuildResponse
      def call(httparty_response:)
        if httparty_response.code == 200
          body = JSON.parse(httparty_response.body)
          Rubybrainz::Entities::Response.new(
            success: true,
            message: httparty_response.message,
            created: body[:created],
            count: body[:count],
            offset: body[:offset]
          )
        else
          Rubybrainz::Entities::Response.new(
            success: false,
            message: httparty_response.message,
            created: body[:created],
            count: body[:count],
            offset: body[:offset]
          )
        end
      end
    end
  end
end
