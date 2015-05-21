class Workshop
  def initialize(platform, env)
    @platform = platform
    @env = env
  end

  def search
    Search.new(@platform, @env)
  end

  def login
    Login.new(@platform, @env)
  end
end
