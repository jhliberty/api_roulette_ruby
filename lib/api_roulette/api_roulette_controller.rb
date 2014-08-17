require 'nokogiri'
require 'open-uri'

PW_URL = "http://www.programmableweb.com"

class APIRoulette
  def self.get_random_api(quantity=1)
    @api_store = APIStore.new(APILoader.load_api_list)
    @api_store.get_random_api(quantity)
  end

  def self.get_all_apis_on_page(page_number)
    @api_store = APIStore.new(APILoader.load_api_list(page_number))
    @api_store.apis
  end
end
