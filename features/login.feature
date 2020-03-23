#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do cátalogo ninja flix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema  com o meu email e senha


Cenario: Acesso
    Quando eu faço o login com "tony@stark.com" e "123456"
    Então devo ser autenticado
    E devo ver "Tony Stark" na área logada

Esquema do Cenario: Login sem sucesso
    Quando eu faço o login com <email> e <senha>
    Então não devo ser autenticado
    E devo ver a mensagem de alerta <texto>

    Exemplos:
    |email|senha|texto|
    |"tony@stark.com"|"pdw456"|"Usuário e/ou senha inválidos"|
    |"404@yahoo.com"|"456789"|"Usuário e/ou senha inválidos"|
    |"" |"123456"|"Opps. Cadê o email?"|
    |"teste@gmail.com"|""| "Opps. Cadê a senha?"|


