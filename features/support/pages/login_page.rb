class LoginPage
  include Capybara::DSL

  def go
    visit "/"
  end

  def with(email, senha)
    find("input[name='email']").set email
    find("input[name='password']").set senha
    click_button "Entrar"
  end

  def alert
    find(".alert").text
  end
end
