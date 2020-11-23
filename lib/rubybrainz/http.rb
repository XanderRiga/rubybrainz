# frozen_string_literal: true

require 'faraday'

module Rubybrainz
  # This is the class that will handle our request/response directly.
  class Http
    def get(url:, query:, limit: 25)
      Faraday.get(url) do |req|
        req.headers['Accept'] = 'application/json'
        req.headers['User-Agent'] = 'rubybrainz'
        req.params['query'] = query
        req.params['limit'] = limit
      end
    end
  end
end
