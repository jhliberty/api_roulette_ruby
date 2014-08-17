class APIStore
  attr_reader :apis

  def initialize(apis)
    @apis = apis
  end

  def get_random_api(quantity)
    @apis.sample(quantity)
  end
end
