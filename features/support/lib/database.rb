require "pg"

class Database
  def initialize #contrutor da class
    connection = PG.conect(CONFIG["database"]) # informações estão no arquivo yaml
    # ip, bd, user e pass de onde está a base de dados
  end

  def delete_movie(movie)
    connection.exec("DELETE from public.movies where title = '#{title}';")
  end

  def insert_movie(movie)
    sql_script = "INSERT INTO public.movies (title, status, year, release_date, created_at, updated_at)" \
                 "Values ('#{movie["title"]}', #{movie["status"]}, #{movie["year"]}, #{movie["release_date"]}, current_timestamp, current_timestamp);"
    connection.exec(sql_script)
  end
end
