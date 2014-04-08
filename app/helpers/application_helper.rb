module ApplicationHelper

  def parseDomain(domain)

    page = Nokogiri::HTML(open(domain), nil, 'UTF-8')

    title = page.css('title').text
    description = page.css('meta[@name="description"]')[0][:content] if page.css('meta[@name="description"]').empty? == false

    title = 'not found' if title.nil?
    description = 'not found' if description.nil?

    return [title, description]
  end
end
