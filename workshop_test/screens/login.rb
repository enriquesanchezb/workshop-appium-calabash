class Login < BasePage
  def initialize(platform, env)
    super
    elements 'login_page'
  end

  def enter_credentials(user, pass, site)
    press('add_site')
    fill('user', user)
    fill('pass', pass)
    fill('site_address', site)
    press('add_site_button')
    Post.new(@platform, @env)
  end

end