# onebox.rb
require "onebox"

# source: https://kalifi.org/2015/08/using-discourse-onebox-with-jekyll.html
# Onebox::Engine::WhitelistedGenericOnebox.whitelist << "kalifi.org"

# module Jekyll
#   module OneboxFilter
#     def preview(url)
#       Onebox.preview(url).to_s
#     end
#   end
# end
# 
# Liquid::Template.register_filter(Jekyll::OneboxFilter)


module Jekyll
  class OneboxTag < Liquid::Tag
    def initialize(tag_name, url, tokens)
      super
      STDERR.puts url
      @url = url.strip
    end

    def render(context)
      Onebox.preview(@url).to_s
    end
  end
end

Liquid::Template.register_tag('preview', Jekyll::OneboxTag)
