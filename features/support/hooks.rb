require "base64"
Before do
  @SideBar = SideBarView.new
  @Login_page = LoginPage.new
  @Movie_page = MoviePage.new
  #Maximizar a tela do navegador
  page.driver.browser.manage.window.maximize
  # para redimensionar a tela.
  # page.current_window.resize_to[1440, 900]
end

Before("Login") do
  user = CONFIG["users"]["cat_manager"]
  @Login_page.go
  @Login_page.with(user["email"], user["pass"])
end

After do
  # if scenario.failed?
  shot_file = page.save_screenshot("log/screenshot.png")
  shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
  embed(shot_b64, "image/png", "Screenshot") ## Cucumber anexa o screenshot no report
  #end
end
