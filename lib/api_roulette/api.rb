class API
  attr_reader :title, :description, :category, :url
  def initialize(params)
    @url = params.fetch(:url)
    @title = params.fetch(:title)
    @description = params.fetch(:description)
    @category = params.fetch(:category)
  end

  def to_s
    "(#{@category}) #{@title} - #{@url}"
  end
end
