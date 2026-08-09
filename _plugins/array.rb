# ARRAY.RB — custom Liquid filters for working with arrays.
# Registered globally via Liquid::Template.register_filter so they can be
# used in any page/include: {{ list | array_filter }} etc.
require 'liquid'

module Jekyll
  module ArrayFilters
    # filter out empty and trim entries in array
    def array_filter(array)
      return array
        .map{|x| x.is_a?(String) ? x.strip() : x}
        .select{|x| x and x != ""}
    end

    # omit middle items of array with ellipsis, leave N items on either side
    # e.g. author list: ["a","b","c","d","e","f"] | array_carve: 2
    #  => ["a","b","...","e","f"]
    def array_carve(array, length = 3)
      if array.length <= length * 2
        return array
      else
        left = array.slice(0, length) || []
        right = array.slice(-length, length) || []
        return [left, "...", right].flatten()
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ArrayFilters)
