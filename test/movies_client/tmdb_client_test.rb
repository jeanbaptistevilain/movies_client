#ENCODING:UTF-8
require "rubygems"
gem "shoulda"
require "test/unit"
require "shoulda"
require "movies_client/tmdb_client"

class TmdbClientTest < Test::Unit::TestCase

  setup do
    @api_key = '7f0b035c164b74d6eec69ebcd8ff8d12'
  end

  should 'get information about a movie' do
    result = "Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux-repas pour une personne comme beaucoup d'autres personnes seules qui connaissent la misère humaine, morale et sexuelle. Mais un jour il fait la rencontre de Tyler Durden, une sorte d'anarchiste entre gourou et philosophe qui prêche l'amour de son prochain.  Ensemble ils vont créer le Fight club, un lieu clandestin ou l'on peut retrouver sa virilité, l'échange et la communication."

    movie = TmdbClient.get_movie_details(550, @api_key)

    assert_equal 'Fight Club', movie.title
    assert_equal result, movie.overview
  end

  should 'get id from title' do
    @movie = TmdbClient.get_id_from_title('Fight Club', @api_key)

    assert_equal 550, @movie
  end

  should 'get the casting of a movie from his id' do
    @cast = TmdbClient.get_movie_casts(550, @api_key)

    assert_equal 'Edward Norton', @cast[0][:name]
    assert_equal 'The Narrator', @cast[0][:role]
    assert_equal 'Brad Pitt', @cast[1][:name]
    assert_equal 'Tyler Durden', @cast[1][:role]
  end

  should 'get the trailer of a movie from his id' do
    link = TmdbClient.get_trailer(550, @api_key)

    assert_equal 'https://www.youtube.com/watch?v=1UqSD-jSC58', link
  end

  should 'get the credits of a movie from his id' do
    @cred = TmdbClient.get_credits(550, @api_key)

    assert_equal 'David Fincher', @cred[:credit]["Director"][0]
  end

end