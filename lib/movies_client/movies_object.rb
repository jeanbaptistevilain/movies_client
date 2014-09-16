require 'movies_client/attribute_helper'

class MoviesObject

  include AttributeHelper

  def initialize(hash)
    self.attributes = hash
  end

  def mois
    @mois
  end

  def cine1
    @cinema1
  end

  def cine2
    @cinema2
  end

  def date(day)
    @daily_schedule[day.to_s][:date]
  end

  def film1(day)
    @daily_schedule[day.to_s][:film1]
  end

  def film2(day)
    @daily_schedule[day.to_s][:film2]
  end

  def film3(day)
    @daily_schedule[day.to_s][:film3]
  end

  def film4(day)
    @daily_schedule[day.to_s][:film4]
  end

  def horaire1(day)
    @daily_schedule[day.to_s][:horaire1]
  end

  def horaire2(day)
    @daily_schedule[day.to_s][:horaire2]
  end

  def id(movie)
    @result[movie.to_s][:id].to_s
  end

  def poster(movie)
    @result[movie.to_s][:poster]
  end

  def title(movie)
    @result[movie.to_s][:title]
  end

  def title_list(movie)
    @result[movie.to_s][:title_list]
  end

  def overview(movie)
    @result[movie.to_s][:synopsis]
  end

  def casting(movie)
    @result[movie.to_s][:casting]
  end

  def genre(movie)
    @result[movie.to_s][:genre]
  end

end