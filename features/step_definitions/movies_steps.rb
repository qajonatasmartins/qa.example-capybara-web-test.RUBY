Dado("que {string} é um novo filme") do |movie_code|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixture/movies.yaml"))
  @movie = file[movie_code]
  Database.new.delete_movie(@movie["title"])
end

Quando("eu faço o cadastro deste filme") do
  @Movie_page.add()
  @Movie_page.create(@movie)
end

Então("devo ver o novo filme na lista") do
  result = @Movie_page.movie_tr(@movie)
  expect(result).to have_text @movie["title"]
  expect(result).to have_text @movie["status"]
end

Então("devo ver a notificação {string}") do |expect_alert|
  alert = @Movie_page.alert()
  expect(alert).to eql expect_alert
end
