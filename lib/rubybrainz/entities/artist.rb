# frozen_string_literal: true

require 'rubybrainz/entities/base'
require 'rubybrainz/entities/area'

module Rubybrainz
  module Entities
    # This represents an artist in musicbrainz
    class Artist < Base
      attribute :id, Types::String
      attribute :name, Types::String
      attribute :sort_name, Types::String.optional.default(nil)
      attribute :type, Types::String.optional.default(nil)
      attribute :type_id, Types::String.optional.default(nil)
      attribute :gender, Types::String.optional.default(nil)
      attribute :country, Types::String.optional.default(nil)
      attribute :area, Rubybrainz::Entities::Area.optional.default(nil)
      attribute :begin_area, Rubybrainz::Entities::Area.optional.default(nil)
    end
  end
end
