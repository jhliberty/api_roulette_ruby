class APILoader
  def self.load_api_list(page_number=nil)
    page = (page_number.nil? ? get_random_api_page : get_api_page(page_number))
    get_apis_from_page(page)
  end

  private

  def self.get_apis_from_page(page)
    api_links = extract_api_links_from_page(page)
    api_descriptions = extract_api_descriptions_from_page(page)
    api_categories = extract_api_categories_from_page(page)

    convert_api_data_to_api_objects(api_links, api_descriptions, api_categories)
  end

  def self.get_api_page(page_number)
    url = "http://www.programmableweb.com/apis/directory?page=#{page_number}"
    get_webpage(url)
  end

  def self.get_random_api_page
    page_number = rand(1..104)
    get_api_page(page_number)
  end

  def self.get_webpage(url)
    Nokogiri::HTML(open(url))
  end

  def self.extract_api_links_from_page(page)
    page.css('table tr td.views-field-title a')
  end

  def self.extract_api_descriptions_from_page(page)
    page.css('table tr td.views-field-field-api-description')
  end

  def self.extract_api_categories_from_page(page)
    page.css('table tr td.views-field-field-article-primary-category')
  end

  def self.convert_api_data_to_api_objects(links, descriptions, categories)
    links.map.with_index do |link, index|
      API.new(convert_link_to_hash(link).merge(convert_description_to_hash(descriptions[index])).merge(convert_category_to_hash(categories[index])))
    end
  end

  def self.convert_link_to_hash(link)
    {url: "#{PW_URL}#{link['href']}", title: link.text}
  end

  def self.convert_description_to_hash(description)
    {description: description.text.strip }
  end

  def self.convert_category_to_hash(category)
    {category: (category.nil? ? "" : category.text.strip) }
  end

end
