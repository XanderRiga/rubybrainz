# frozen_string_literal: true

require 'rubybrainz/entities/base'

module Rubybrainz
  module Entities
    # This will be the object we return for all requests
    class Response < Base
      attribute :success, Types::Bool
      attribute :code, Types::Integer
      attribute :body, Types::Hash.optional.default(nil)
      attribute :message, Types::String.optional.default(nil)
    end
  end
end
