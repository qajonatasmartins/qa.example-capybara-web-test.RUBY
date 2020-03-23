Quando("eu faço o login com {string} e {string}") do |login, senha|
  @Login_page.go
  @Login_page.with(login, senha)
end

Então("devo ser autenticado") do
  expect(get_token.length).to be 147 # todos os tokens tem que ter 147 caracteres.
end

Então("devo ver {string} na área logada") do |expectName|
  expect(@SideBar.logged_user).to have_text expectName
end

Então("não devo ser autenticado") do
  expect(get_token).to be nil # null
end

Então("devo ver a mensagem de alerta {string}") do |expect_message|
  expect(@Login_page.alert).to eql expect_message
end
