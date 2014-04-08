# encoding: UTF-8
require 'nokogiri'
require 'mongo'

require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

class ChromeBookmarks

    def initialize

        @file = 'bookmarks.html'
        begin
          @con = Mysql2::Client.new(:host => "127.0.0.1", :username => "root", :password => "root", :database => "cubby")

        rescue Mysql::Error => e

          puts e.errno
          puts e.error
        end
    end

    def parseDomain(domain)

    page = Nokogiri::HTML(open(domain), nil, 'UTF-8')

    title = page.css('title').text
    description = page.css('meta[@name="description"]')[0][:content] if page.css('meta[@name="description"]').empty? == false

    title = 'not found' if title.nil?
    description = 'not found' if description.nil?

    return description
  end

    def run

      File.open(@file, 'r') do |file|

        page = Nokogiri::HTML(file)

        page.css('h3').each do |h3|

          category = Category.new
          category.name = h3.text
          category.user_id = 1

          category.save

          p "category: #{h3.text}"

          next if h3.next_element.name != 'dl'

          links = h3.next_element.children.each do |l|

            next if l['href'].nil?

            p "link: #{l.text}"

            link = Link.new
            link.title = l.text.strip
            link.url = l['href'].strip
            link.user_id = 1
            link.category_id = category.id

            begin

              link.description = self.parseDomain(l['href'])
            rescue
            end

            link.save

            p "link: #{l['href']}"
          end

        end

      end
      
    end
end

bookmarks = ChromeBookmarks.new
bookmarks.run