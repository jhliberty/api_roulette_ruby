class APIStore
  attr_reader :apis

  def initialize(apis)
    @apis = apis
  end

  def get_random_api(quantity)
    quantity ||= 1
    @apis.sample(quantity)
  end
end
