# frozen_string_literal: true

require 'httparty'
require 'rubybrainz/interactors/build_response'

module Rubybrainz
  # This is the class that will handle our request/response directly.
  class Http
    def get(url:, query:, limit: 25)
      response = HTTParty.get(
        url,
        headers: {
          'Accept' => 'application/json',
          'User-Agent' => 'rubybrainz (xanderriga@live.com)'
        },
        query: {
          query: query,
          limit: limit
        }
      )

      response_builder.call(httparty_response: response)
    end

    private

    def response_builder
      @response_builder ||= Rubybrainz::Interactors::BuildResponse.new
    end
  end
end
