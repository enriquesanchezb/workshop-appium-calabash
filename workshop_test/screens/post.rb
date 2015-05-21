class Post < BasePage
  def initialize(platform, env)
    super
    elements 'post_page'
  end

  def post_exists?
    exists?('Posts')
  end
end