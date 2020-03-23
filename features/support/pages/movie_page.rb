class MoviePage
  include Capybara::DSL

  def add
    find(".nc-simple-add").click
  end

  def upload(file)
    cover_file = File.join(Dir.pwd, "features/support/fixture/cover/" + file)

    #OS é da gem de OS para saber qual SO está usando
    cover_file = cover_file.tr("/", "\\") if OS.windows? # isso deve ser feito somente em Windows, caso for mac ou linux apagar essa linha
    Capybara.ignore_hidden_elements = false # faz com que ignore os elementos ocultos da tela.
    attach_file("upcover", cover_file)
    Capybara.ignore_hidden_elements = true # ativos os elementos novamente.
  end

  def cast(cast)
    #Pega a class que tem que da tab na tela
    actor = find(".form-control-input-new-tag")
    # faz um foreach no campo movie['cast'] e da um tab para liberar informar o proximo campo.
    cast.each do |a|
      actor.set a
      #comando para dar o tab na tela.
      actor.send_keys :tab
    end
  end

  def select_status(status)
    find("input[placeholder=Status]").click
    find(".el-select-dropdown__item", text: movie["status"]).click
  end

  def create(movie)
    find("input[name='title']").set movie["title"]

    select_status(movie["status"]) unless movie["status"].empty?

    find("input[name=year]").set movie["year"]

    find("input[name=release_date]").set movie["release_date"]

    find("textarea[name=overview]").set movie["overview"]
    cast(movie["cast"])
    ## Se for vazio movie[cover] então não executa
    upload(movie["cover"]) unless movie["cover"].empty?
    find("#create-movie").click
  end

  def movie_tr(movie)
    find("table tbody tr", text: movie["title"])
  end

  def alert
    find(".alert").text
  end
end
