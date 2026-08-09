# FILE.RB — custom Liquid filters for the local filesystem.
# Used to detect which logo/icon file format exists (svg/png/jpg) and to
# inline SVG logos directly into the page (see _includes/header.html,
# _includes/meta.html).
require 'liquid'

module Jekyll
  module FileFilters
    # check if file exists (returns the filename if present, else nil)
    def file_exists(file)
      path = File.join(Dir.getwd, file)
      # pass back filename if exists
      return File.file?(path) ? file : nil
    end

    # read text contents of file
    def file_read(file)
      path = File.join(Dir.getwd, file)
      return File.file?(path) ? File.read(path) : nil
    end
  end
end

Liquid::Template.register_filter(Jekyll::FileFilters)
