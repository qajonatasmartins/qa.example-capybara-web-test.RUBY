#language: pt

@Login
Funcionalidade: Cadastro de filmes
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestro de catálogo
    Posso cadastrar um novo filme


Esquema do Cenario: Novo filme
    O gestor de catálogo cadastra um novo filme através do formulário
    e o novo registro é inserido atraves do ninjaflix

    Dado que <codigo> é um novo filme
    Quando eu faço o cadastro deste filme
    Então devo ver o novo filme na lista

Exemplos: 
        |codigo|
        |"ultimato"|
        |"spider"|
        |"jocker" |
        
@teste
Esquema do Cenario: Campos obrigatorios
    O gestor de catálogo tenta cadastrar um novo filme, mas esquece
    de preencher um dos campos que são obrigatorios, em seguida, o sistema
    exibe uma notificação para o usuario.

    Dado que <codigo> é um novo filme
    Quando eu faço o cadastros deste filme
    Então devo ver a notificação <texto>
Exemplos: 
    |codigo|texto|
    |"no_title"|"Oops - Filme sem titulo. Pode isso Arnaldo?"|


Cenario: Sem status
    Quando eu tento cadastra um filme sem o status
    Então devo ver a notificação "Opps - O status deve ser informado"