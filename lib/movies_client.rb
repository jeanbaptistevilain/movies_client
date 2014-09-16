#ENCODING:UTF-8
require "movies_client/version"
require "roo"
require "spreadsheet"
require "themoviedb"

module MoviesClient

  # defaults info
  @config = { :prog => '../../data/PROG_GB_JUILLET_2014.ods',
              :key => ''
  }

  #defaults key
  key = '7f0b035c164b74d6eec69ebcd8ff8d12'

  def self.configure_file_path(path)
    @config[:prog] = path
  end

  def self.configure_api_key(key)
    @config[:key] = key
  end

  def self.parse_ods
    #open ods file with UTF_8 encoding option
    s = Roo::OpenOffice.new(@config[:prog], ods_options: {encoding: Encoding::UTF_8})

    @result = {}
    @daily_schedule = {}
    day = {}
    film = {}
    lastrow = s.last_row
    lastcolumn = s.last_column
    y = 2

    @result[:mois] = s.cell(1,3)
    @result[:cinema1] = s.cell(1,2)
    @result[:cinema2] = s.cell(1,5)

    while y != lastrow  do
      x = 1

      while x != lastcolumn+1 do

        value = s.cell(y,x)

        if s.cell(y, 3).nil?
          key = s.cell(y-1, 3).gsub(/[^\d]/, '').to_s
          flagline = true # second line of a date
        else
          key = s.cell(y, 3).gsub(/[^\d]/, '').to_s
          flagline = false #first line of a date
        end

        case x
          when 1
            if flagline == false
              day[:horaire1] = value
            elsif flagline == true
              day[:horaire2] = value
            end
          when 2
            if flagline == false
              day[:film1] = value
              unless film.has_key?(value)
                unless value.nil?
                  if value.include? ':'
                    value.sub!(':', ' ')
                  end
                  if value.include? "'"
                    value.sub!("'", ' ')
                  end
                  if value.include? ","
                    value.sub!(",", '')
                  end
                  value_escaped = CGI::escape(value)
                  film.store(value,[value_escaped])
                end
              end
            elsif flagline == true
              day[:film3] = value
              unless film.has_key?(value)
                unless value.nil?
                  if value.include? ':'
                    value.sub!(':', ' ')
                  end
                  if value.include? "'"
                    value.sub!("'", ' ')
                  end
                  if value.include? ","
                    value.sub!(",", '')
                  end
                  value_escaped = CGI::escape(value)
                  film.store(value,[value_escaped])
                end
              end
            end
          when 3
            unless flagline == true
              day[:date] = value
            end
          when 5
            if flagline == false
              day[:film2] = value
              unless film.has_key?(value)
                unless value.nil?
                  if value.include? ':'
                    value.sub!(':', ' ')
                  end
                  if value.include? "'"
                    value.sub!("'", ' ')
                  end
                  if value.include? ","
                    value.sub!(",", '')
                  end
                  value_escaped = CGI::escape(value)
                  film.store(value,[value_escaped])
                end
              end
            elsif flagline == true
              day[:film4] = value
              unless film.has_key?(value)
                unless value.nil?
                  if value.include? ':'
                    value.sub!(':', ' ')
                  end
                  if value.include? "'"
                    value.sub!("'", ' ')
                  end
                  if value.include? ","
                    value.sub!(",", '')
                  end
                  value_escaped = CGI::escape(value)
                  film.store(value,[value_escaped])
                end
              end
            end
          else
            # cellule non traité
        end
        x += 1
      end
      @daily_schedule.store( key, day)
      if flagline == true
        day = {}
      end
      y +=1
    end
    @result.store( :daily_schedule, @daily_schedule)
    @result.store( :result, film)
    @result
  end

  def self.parse_ods_with_day(date)
    s = Roo::OpenOffice.new(@config[:prog], ods_options: {encoding: Encoding::UTF_8})

    @result = {}
    @daily_schedule = {}
    day = {}
    film = {}
    lastrow = s.last_row
    lastcolumn = s.last_column
    y = 2 # Start on line 2 to avoid header

    @result[:mois] = s.cell(1,3)
    @result[:cinema1] = s.cell(1,2)
    @result[:cinema2] = s.cell(1,5)

    while y != lastrow  do
      x = 1

      while x != lastcolumn+1 do

        value = s.cell(y,x)

        if s.cell(y, 3).nil?
          key = s.cell(y-1, 3).gsub(/[^\d]/, '').to_s
          flagline = true # second line of a date
        else
          key = s.cell(y, 3).gsub(/[^\d]/, '').to_s
          flagline = false #first line of a date
        end

        case key
          when date
            case x
              when 1
                if flagline == false
                  day[:horaire1] = value
                elsif flagline == true
                  day[:horaire2] = value
                end
              when 2
                if flagline == false
                  day[:film1] = value
                  unless film.has_key?(value)
                    unless value.nil?
                      if value.include? ':'
                        value.sub!(':', ' ')
                      end
                      if value.include? "'"
                        value.sub!("'", ' ')
                      end
                      if value.include? ","
                        value.sub!(",", '')
                      end
                      value_escaped = CGI::escape(value)
                      film.store(value,[value_escaped])
                    end
                  end
                elsif flagline == true
                  day[:film3] = value
                  unless film.has_key?(value)
                    unless value.nil?
                      if value.include? ':'
                        value.sub!(':', ' ')
                      end
                      if value.include? "'"
                        value.sub!("'", ' ')
                      end
                      if value.include? ","
                        value.sub!(",", '')
                      end
                      value_escaped = CGI::escape(value)
                      film.store(value,[value_escaped])
                    end
                  end
                end
              when 3
                unless flagline == true
                  day[:date] = value
                end
              when 5
                if flagline == false
                  day[:film2] = value
                  unless film.has_key?(value)
                    unless value.nil?
                      if value.include? ':'
                        value.sub!(':', ' ')
                      end
                      if value.include? "'"
                        value.sub!("'", ' ')
                      end
                      if value.include? ","
                        value.sub!(",", '')
                      end
                      value_escaped = CGI::escape(value)
                      film.store(value,[value_escaped])
                    end
                  end
                elsif flagline == true
                  day[:film4] = value
                  unless film.has_key?(value)
                    unless value.nil?
                      if value.include? ':'
                        value.sub!(':', ' ')
                      end
                      if value.include? "'"
                        value.sub!("'", ' ')
                      end
                      if value.include? ","
                        value.sub!(",", '')
                      end
                      value_escaped = CGI::escape(value)
                      film.store(value,[value_escaped])
                    end
                  end
                end
              else
                # cellule non traité
            end
          else
            # date non traité
        end
        x += 1
      end
      unless day[:date].nil?
        @daily_schedule.store( key, day)
      end
      if flagline == true
        day = {}
      end
      y +=1
    end
    @result.store( :daily_schedule, @daily_schedule)
    @result.store( :result, film)
    @result
  end

  def self.get_movie_details(id)
    Tmdb::Api.key(@config[:key])
    Tmdb::Api.language("fr")
    movie = Tmdb::Movie.detail(id)
    movie
  end

  def self.get_id_from_title(title)
    Tmdb::Api.key(@config[:key])
    Tmdb::Api.language("fr")
    @search = Tmdb::Search.new
    @search.resource('movie')
    @search.query(title)
    @movie = @search.fetch
    if @movie.nil?
      puts title
    else
      @movie[0][:id]
    end
  end

  def self.get_movie_casts(id)
    Tmdb::Api.key(@config[:key])
    Tmdb::Api.language("fr")
    @casts = Tmdb::Movie.casts(id)
    @credits = Tmdb::Movie.credits(id)
    @casting = {}
    actor = {}
    i = 0
    if @casts.nil?
      actor = 'casting non disponible'
      @casting = actor
    else
      while i < 3
        unless @casts[i].nil?
          actor[:role] = @casts[i]["character"]
          actor[:name] = @casts[i]["name"]
        end
        @casting.store(i, actor)
        actor = {}
        i += 1
      end
    end
    @casting
  end

  def self.get_movie_info_from_list(list, size)
    result = {}
    @listresult = {}
    list.each_pair do |k, v|
      id = MoviesClient.get_id_from_title(v)
      movie = MoviesClient.get_movie_details(id)
      casting = MoviesClient.get_movie_casts(id)
      result[:id] = id
      result[:title] = movie.title
      result[:title_list] = k
      result[:synopsis] = movie.overview
      result[:tagline] = movie.tagline
      puts movie.tagline
      unless movie.genres.nil?
        result[:genre] = movie.genres.collect { |g| g[:name] }
      end
      unless movie.poster_path.nil?
        result[:poster] = 'http://image.tmdb.org/t/p/'+size+'/'+movie.poster_path
      end
      result[:casting] = casting
      @listresult.store(k, result)
      result = {}
    end
    @listresult
  end

  def self.assemble_prog_with_info(prog,info)
    prog.store(:result, info)
    prog
  end

  def self.get_info(path, key, size)
    #Configure file path
    MoviesClient.configure_file_path(path)
    #Configure api key
    MoviesClient.configure_api_key(key)
    #Parse the whole ods file
    @programme = MoviesClient.parse_ods
    #Get the movie information from the list
    @movie_info = MoviesClient.get_movie_info_from_list(@programme[:result], size)
    #Assemble programme with movie information
    @result = MoviesClient.assemble_prog_with_info(@programme, @movie_info)
    #Return a CinemaObject
    @cinema_object = MoviesObject.new(@result)
    @cinema_object
  end

  def self.select_daily_program(path, key, size, date)
    #Configure file path
    MoviesClient.configure_file_path(path)
    #Configure api key
    MoviesClient.configure_api_key(key)
    #Parse the ods file in function of the parameter day and nb of day
    @result = MoviesClient.parse_ods_with_day(date)
    #Get the movie information from the list
    @movie_info = MoviesClient.get_movie_info_from_list(@result[:result], size)
    #Assemble programme with movie information
    @result = MoviesClient.assemble_prog_with_info(@result, @movie_info)
    #Return a CinemaObject
    @cinema_object = MoviesObject.new(@result)
    @cinema_object
  end

end