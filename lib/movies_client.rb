#ENCODING:UTF-8
require "movies_client/version"
require "movies_client/schedule_parser"
require "movies_client/tmdb_client"

module MoviesClient

  # default information
  @config = { :prog => "../../data/PROG_GB_JUILLET_2014.ods",
              :key => ""
  }
  @logger = Logger.new(STDOUT)

  def self.configure_file_path(path)
    @config[:prog] = path
  end

  def self.configure_api_key(key)
    @config[:key] = key
  end

  def self.get_movie_info_from_list(list, size)
    result = {}
    listresult = {}
    list.each_pair do |k, v|
      id      = TmdbClient.get_id_from_title(v, @config[:key])
      @logger.info "Retrieving data for movie #{v}"
      movie   = TmdbClient.get_movie_details(id, @config[:key])
      casting = TmdbClient.get_movie_casts(id, @config[:key])
      credits = TmdbClient.get_credits(id, @config[:key])
      trailer = TmdbClient.get_trailer(id, @config[:key])

      result[:id] = id
      result[:title_list] = k
      unless movie.title == ''
        result[:title] = movie.title
      end
      unless movie.overview == ''
        result[:synopsis] = movie.overview
      end
      unless movie.tagline == ''
        result[:tagline] = movie.tagline
      end
      unless movie.release_date == ''
        result[:release_date] = movie.release_date
      end
      unless trailer == ''
        result[:trailer] = trailer
      end
      unless movie.genres.nil?
        result[:genre] = movie.genres.collect { |g| g[:name] }
      end
      unless movie.poster_path.nil?
        result[:poster] = 'http://image.tmdb.org/t/p/'+size+'/'+movie.poster_path
      end
      unless casting.nil?
        result[:casting] = casting
      end
      unless credits.nil?
        result[:credits] = credits
      end

      listresult.store(k, result)
      result = {}
    end
    listresult
  end

  def self.assemble_prog_with_info(prog,info)
    prog.store(:result, info)
    prog
  end

  def self.get_info(path, key, size)
    configure_file_path(path)
    configure_api_key(key)
    programme     = ScheduleParser.parse_ods(@config[:prog])
    movie_info    = get_movie_info_from_list(programme[:result], size)
    result        = assemble_prog_with_info(programme, movie_info)
    MoviesObject.new(result)
  end

  def self.select_daily_program(path, key, size, date)
    MoviesClient.configure_file_path(path)
    MoviesClient.configure_api_key(key)
    result = ScheduleParser.parse_ods_with_day(@config[:prog], date)
    movie_info = get_movie_info_from_list(result[:result], size)
    result = assemble_prog_with_info(result, movie_info)
    MoviesObject.new(result)
  end

end