class Post < BasePage
  def initialize(platform, env)
    super
    elements 'post_page'
  end

  def post_exists?
    exists?('Posts')
  end

  def create_new_post
    press('add')
  end
end
