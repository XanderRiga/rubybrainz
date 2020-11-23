# frozen_string_literal: true

require 'ruby-enum'

module Rubybrainz
  module Constants
    # These are the possible types
    class Type
      include Ruby::Enum

      define :artist, 'artist'
      define :release, 'release'
      define :release_group, 'release-group'
      define :recording, 'recording'
      define :work, 'work'
      define :label, 'label'
    end
  end
end
