module Jekyll
  module SearchCodeUrlFilter
    def search_code_url(value)
      @github_url = Jekyll.configuration({})['github_bluejay_url']

      return @github_url + '/search?type=code&q=' + value
    end
  end
end

Liquid::Template.register_filter(Jekyll::SearchCodeUrlFilter)
