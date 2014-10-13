#encoding: UTF-8

require "themoviedb"

class TmdbClient

  def self.get_movie_details(id, api_key)
    Tmdb::Api.key(api_key)
    Tmdb::Api.language("fr")
    movie = Tmdb::Movie.detail(id)
    movie
  end

  def self.get_id_from_title(title, api_key)
    Tmdb::Api.key(api_key)
    Tmdb::Api.language("fr")
    search = Tmdb::Search.new
    search.resource('movie')
    search.query(title)
    movie = search.fetch
    if movie.nil?
      puts title
    else
      f = movie.length
      i = 0
      while i != f
        unless movie[i][:release_date] == ''
          date = Date.parse movie[i][:release_date]
          if date.year == Date.today.year or date.year == Date.today.prev_year
            movie_id = movie[i][:id]
          else
            movie_id = movie[0][:id]
          end
        end
        i += 1
      end
      movie_id
    end
  end

  def self.get_trailer(id, api_key)
    Tmdb::Api.key(api_key)
    Tmdb::Api.language("fr")
    trailer = Tmdb::Movie.trailers(id)
    link = ''
    unless trailer["youtube"][0].nil?
      source = trailer["youtube"][0]["source"]
      link = 'https://www.youtube.com/watch?v='+source.to_s
    end
    link
  end

  def self.get_credits(id, api_key)
    Tmdb::Api.key(api_key)
    Tmdb::Api.language("fr")
    credit = Tmdb::Movie.credits(id)
    credits = {}
    cred = {}
    credit["crew"].each do |r|
      key = r["job"]
      value = r["name"]
      if cred.has_key?(key)
        cred[key] << value
      else
        cred.store(key, [value])
      end
    end
    credits.store(:credit, cred)
    credits
  end

  def self.get_movie_casts(id, api_key)
    Tmdb::Api.key(api_key)
    Tmdb::Api.language("fr")
    casts = Tmdb::Movie.casts(id)
    casting = {}
    actor = {}
    i = 0
    if casts.nil?
      actor = 'casting non disponible'
      casting = actor
    else
      while i < 3
        unless casts[i].nil?
          actor[:role] = casts[i]["character"]
          actor[:name] = casts[i]["name"]
        end
        casting.store(i, actor)
        actor = {}
        i += 1
      end
    end
    casting
  end

end