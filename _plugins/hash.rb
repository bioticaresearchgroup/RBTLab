# HASH.RB — custom Liquid filter for merging config-style hashes.
# Used by _includes/button.html to let a button's inline parameters be
# overridden by (or fall back to) defaults looked up in _data/types.yaml.
require 'liquid'

module Jekyll
  module HashFilters
    # merge main hash with another hash of defaults
    def hash_default(hash, defaults)
      if not defaults.is_a?(Hash)
        return hash
      end
      defaults.each do |key, value|
        # substitute main string into default string and set main item
        # (e.g. default link "https://orcid.org/$VALUE" + value "0000-..." )
        if value.is_a?(String) and value.include?"$VALUE"
          if hash[key].is_a?(String)
            hash[key] = value.sub"$VALUE", hash[key]
          end
        # set main item to default item if not defined
        else
          if hash[key] == nil or !hash.key?(key)
            hash[key] = value
          end
        end
      end
      return hash
    end
  end
end

Liquid::Template.register_filter(Jekyll::HashFilters)
