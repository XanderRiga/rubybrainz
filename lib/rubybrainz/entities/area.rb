# frozen_string_literal: true

require 'rubybrainz/entities/base'

module Rubybrainz
  module Entities
    # This is what MusicBrainz refers to as a an area
    class Area < Base
      attribute :id, Types::String
      attribute :type, Types::String # Country, City, etc
      attribute :type_id, Types::String
      attribute :name, Types::String
      attribute :sort_name, Types::String.optional.default(nil)
    end
  end
end
