# frozen_string_literal: true

require 'rubybrainz/entities/base'

module Rubybrainz
  module Entities
    # This is what MusicBrainz calls a "work" which is a track, song, etc
    class Work < Base
      attribute :id, Types::String
      attribute :title, Types::String
      attribute :type, Types::String.optional.default(nil)
      attribute :score, Types::Integer.optional.default(nil)
      attribute :language, Types::String.optional.default(nil)
    end
  end
end
