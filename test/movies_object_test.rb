#ENCODING:UTF-8
require "rubygems"
gem "shoulda"
require "test/unit"
require "shoulda"
require "movies_client"
require "movies_client/movies_object"

class MovieObjectTest < Test::Unit::TestCase

  should 'populate retrieve precise element' do
    hash_result = {:mois=>"JUILLET", :cinema1=>"LES RHODOS VILLAGE", :cinema2=>"LE CHARMIEUX CHINAILLON", :daily_schedule=>{"5"=>{:horaire1=>"17h30", :film1=>"SOUS LES JUPES DES FILLES", :date=>"SAM 5", :film2=>"BABYSITTING", :horaire2=>"21H", :film3=>"SOUS LES JUPES DES FILLES", :film4=>"BABYSITTING"}, "6"=>{:horaire1=>"17h30", :film1=>"DEUX JOURS, UNE NUIT", :date=>"DIM 6", :film2=>"SOUS LES JUPES DES FILLES", :horaire2=>"21H", :film3=>"DE TOUTES NOS FORCES", :film4=>"SOUS LES JUPES DES FILLES"}, "7"=>{:horaire1=>"17h30", :film1=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :date=>"LUN 7", :film2=>"RIO 2", :horaire2=>"21H", :film3=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :film4=>"DE TOUTES NOS FORCES"}, "8"=>{:horaire1=>"17h30", :film1=>"BARBECUE", :date=>"MAR 8", :film2=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :horaire2=>"21H", :film3=>"BABYSITTING", :film4=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?"}, "9"=>{:horaire1=>"17h30", :film1=>"LA LISTE DE MES ENVIES", :date=>"MER 9", :film2=>"DRAGONS 2", :horaire2=>"21 H", :film3=>"MALEFIQUE", :film4=>"BARBECUE"}, "10"=>{:horaire1=>"17h30", :film1=>"DRAGONS 2", :date=>"JEU 10", :film2=>"MALEFIQUE", :horaire2=>"21 H", :film3=>"SOUS LES JUPES DES FILLES", :film4=>"LA LISTE DE MES ENVIES"}, "11"=>{:horaire1=>"17h30", :film1=>"RIO 2", :date=>"VEN 11", :film2=>"SOUS LES JUPES DES FILLES", :horaire2=>"21 H", :film3=>"ON A FAILLI \u00CATRE AMIES", :film4=>"DEUX JOURS, UNE NUIT"}, "12"=>{:horaire1=>"17h30", :film1=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :date=>"SAM 12", :film2=>"BABYSITTING", :horaire2=>"21 H", :film3=>"LA RITOURNELLE", :film4=>"ON A FAILLI \u00CATRE AMIES"}, "13"=>{:horaire1=>"17h30", :film1=>"LES VACANCES DU PETIT NICOLAS", :date=>"DIM 13 ", :film2=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :horaire2=>nil, :film3=>nil, :film4=>nil}, "14"=>{:horaire1=>"17h30", :film1=>"MALEFIQUE", :date=>"LUN 14", :film2=>"LES VACANCES DU PETIT NICOLAS", :horaire2=>"21 H", :film3=>"LA LISTE DE MES ENVIES", :film4=>"LES VACANCES DU PETIT NICOLAS"}, "15"=>{:horaire1=>"17h30", :film1=>"DRAGONS 2", :date=>"MAR 15", :film2=>"LA RITOURNELLE", :horaire2=>"21H", :film3=>"SOUS LES JUPES DES FILLES", :film4=>"LA LISTE DE MES ENVIES"}, "16"=>{:horaire1=>"17h30", :film1=>"DEUX JOURS, UNE NUIT", :date=>"MER 16", :film2=>"DRAGONS 2", :horaire2=>"21 H", :film3=>"ON A FAILLI \u00CATRE AMIES", :film4=>"SOUS LES JUPES DES FILLES"}, "17"=>{:horaire1=>"17h30", :film1=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :date=>"JEU 17", :film2=>"RIO 2", :horaire2=>"21H", :film3=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :film4=>"ON A FAILLI \u00CATRE AMIES"}, "18"=>{:horaire1=>"17h30", :film1=>"LES VACANCES DU PETIT NICOLAS", :date=>"VEN 18", :film2=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :horaire2=>"21 H", :film3=>"LES VACANCES DU PETIT NICOLAS", :film4=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?"}, "19"=>{:horaire1=>"17h30", :film1=>"MALEFIQUE", :date=>"SAM 19", :film2=>"LES VACANCES DU PETIT NICOLAS", :horaire2=>"21 H", :film3=>"TRANSFORMERS:L'AGE DE L'EXTINCTION", :film4=>"LES VACANCES DU PETIT NICOLAS"}, "20"=>{:horaire1=>"17h30", :film1=>"DRAGONS 2", :date=>"DIM 20", :film2=>"MALEFIQUE", :horaire2=>"21 H", :film3=>"SOUS LES JUPES DES FILLES", :film4=>"TRANSFORMERS:L'AGE DE L'EXTINCTION"}, "21"=>{:horaire1=>"17h30", :film1=>"RIO 2", :date=>"LUN 21", :film2=>"DRAGONS 2", :horaire2=>"21 H", :film3=>"TRANSCENDANCE", :film4=>"SOUS LES JUPES DES FILLES"}, "22"=>{:horaire1=>"17h30", :film1=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :date=>"MAR 22", :film2=>"RIO 2", :horaire2=>"21 H", :film3=>"LA RITOURNELLE", :film4=>"TRANSCENDANCE"}, "23"=>{:horaire1=>"17h30", :film1=>"LES VACANCES DU PETIT NICOLAS", :date=>"MER 23", :film2=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :horaire2=>"21 H", :film3=>"LES VACANCES DU PETIT NICOLAS", :film4=>"LA RITOURNELLE"}, "24"=>{:horaire1=>"17h30", :film1=>"DE TOUTES NOS FORCES", :date=>"JEU 24", :film2=>"LES VACANCES DU PETIT NICOLAS", :horaire2=>"21 H", :film3=>"TRANSFORMERS:L'AGE DE L'EXTINCTION", :film4=>"LES VACANCES DU PETIT NICOLAS"}, "25"=>{:horaire1=>"17h30", :film1=>"DRAGONS 2", :date=>"VEN 25", :film2=>"MALEFIQUE", :horaire2=>"21 H", :film3=>"SOUS LES JUPES DES FILLES", :film4=>"TRANSFORMERS:L'AGE DE L'EXTINCTION"}, "26"=>{:horaire1=>"17h30", :film1=>"PLANES 2", :date=>"SAM 26", :film2=>"DRAGONS 2", :horaire2=>"21 H", :film3=>"TRANSCENDANCE", :film4=>"SOUS LES JUPES DES FILLES"}, "27"=>{:horaire1=>"17h30", :film1=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :date=>"DIM 27", :film2=>"PLANES 2", :horaire2=>"21 H", :film3=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :film4=>"ON A FAILLI \u00CATRE AMIES"}, "28"=>{:horaire1=>"17h30", :film1=>"LES VACANCES DU PETIT NICOLAS", :date=>"LUN 28", :film2=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :horaire2=>"21 H", :film3=>"LES VACANCES DU PETIT NICOLAS", :film4=>"QU'EST CE QU'ON A FAIT AU BON DIEU\u00A0?"}, "29"=>{:horaire1=>"17h30", :film1=>"MALEFIQUE", :date=>"MAR 29", :film2=>"LES VACANCES DU PETIT NICOLAS", :horaire2=>"21 H", :film3=>"TRANSFORMERS:L'AGE DE L'EXTINCTION", :film4=>"LES VACANCES DU PETIT NICOLAS"}, "30"=>{:horaire1=>"17h30", :film1=>"DRAGONS 2", :date=>"MER 30", :film2=>"DE TOUTES NOS FORCES", :horaire2=>"21 H", :film3=>"SOUS LES JUPES DES FILLES", :film4=>"TRANSFORMERS:L'AGE DE L'EXTINCTION"}, "31"=>{:horaire1=>"17h30", :film1=>"PLANES 2", :date=>"JEU 31", :film2=>"DRAGONS 2"}}, :result=>{"SOUS LES JUPES DES FILLES"=>{:id=>273169, :title=>"Sous les jupes des filles", :title_list=>"SOUS LES JUPES DES FILLES", :synopsis=>"Paris. 28 premiers jours du printemps. 11 femmes.\r M\u00E8res de famille, femmes d'affaires, copines, ma\u00EEtresses ou \u00E9pouses...\r Toutes repr\u00E9sentent une facette de la femme d'aujourd'hui : Complexes, joyeuses, complex\u00E9es, explosives, insolentes, surprenantes... Bref, un \u00EAtre paradoxal, totalement d\u00E9boussol\u00E9, d\u00E9finitivement vivant, FEMMES tout simplement !", :genre=>["Com\u00E9die"], :poster=>"http://image.tmdb.org/t/p/w500//qtdx6rnatFNT3xSXcQzGzRAX24H.jpg", :casting=>{0=>{:role=>"Lily", :name=>"Isabelle Adjani"}, 1=>{:role=>"Adeline", :name=>"Alice Bela\u00EFdi"}, 2=>{:role=>"Agathe", :name=>"Laetitia Casta"}}}, "BABYSITTING"=>{:id=>262551, :title=>"Babysitting", :title_list=>"BABYSITTING", :synopsis=>"Faute de baby-sitter pour le week-end, Marc Schaudel confie son fils Remy \u00E0 Franck, son employ\u00E9, \"un type s\u00E9rieux\" selon lui. Sauf que Franck a 30 ans ce soir et que R\u00E9my est un sale gosse capricieux. Au petit matin, Marc et sa femme Claire sont r\u00E9veill\u00E9s par un appel de la police. R\u00E9my et Franck ont disparu ! Au milieu de leur maison saccag\u00E9e, la police a retrouv\u00E9 une cam\u00E9ra. Marc et Claire d\u00E9couvrent hallucin\u00E9s les images tourn\u00E9es pendant la soir\u00E9e.", :genre=>["Com\u00E9die"], :poster=>"http://image.tmdb.org/t/p/w500//q2t1UVpyf8K7cAqyBz7Nl91gNl9.jpg", :casting=>{0=>{:role=>"Franck", :name=>"Philippe Lacheau"}, 1=>{:role=>"Sonia", :name=>"Alice David"}, 2=>{:role=>"Ernest", :name=>"Vincent Desagnat"}}}, "DEUX JOURS UNE NUIT"=>{:id=>221902, :title=>"Deux jours, une nuit", :title_list=>"DEUX JOURS UNE NUIT", :synopsis=>"Sandra, aid\u00E9e par son mari, n\u2019a qu\u2019un week-end pour aller voir ses coll\u00E8gues et les convaincre de renoncer \u00E0 leur prime pour qu\u2019elle puisse garder son travail.", :genre=>["Drame"], :poster=>"http://image.tmdb.org/t/p/w500//iFzsuRqrt3qNBiwacZxHZdH481I.jpg", :casting=>{0=>{:role=>"Sandra", :name=>"Marion Cotillard"}, 1=>{:role=>"", :name=>"Fabrizio Rongione"}, 2=>{:role=>"", :name=>"Olivier Gourmet"}}}, "DE TOUTES NOS FORCES"=>{:id=>214087, :title=>"De toutes nos forces", :title_list=>"DE TOUTES NOS FORCES", :synopsis=>"Comme tous les adolescents, Julien r\u00EAve d\u2019aventures et de sensations fortes. Mais lorsqu\u2019on vit dans un fauteuil roulant, ces r\u00EAves-l\u00E0 sont difficilement r\u00E9alisables. Pour y parvenir, il met au d\u00E9fi son p\u00E8re de concourir avec lui au triathlon \u00AB Ironman \u00BB de Nice: une des \u00E9preuves sportives les plus difficiles qui soit. Autour d\u2019eux, c\u2019est toute une famille qui va se reconstruire pour tenter d\u2019aller au bout de cet incroyable exploit.", :genre=>["Drame"], :poster=>"http://image.tmdb.org/t/p/w500//mv5oZmfGE1MLPNFo8Q0xe7z6cZX.jpg", :casting=>{0=>{:role=>"Paul Amblard", :name=>"Jacques Gamblin"}, 1=>{:role=>"Claire Amblard", :name=>"Alexandra Lamy"}, 2=>{:role=>"Julien Amblard", :name=>"Fabien H\u00E9raud"}}}, "QU EST CE QU'ON A FAIT AU BON DIEU\u00A0?"=>{:id=>262391, :title=>"Qu'est-ce qu'on a fait au Bon Dieu", :title_list=>"QU EST CE QU'ON A FAIT AU BON DIEU\u00A0?", :synopsis=>"Claude et Marie Verneuil, issus de la grande bourgeoisie catholique provinciale sont des parents plut\u00F4t \"vieille France\". Mais ils se sont toujours oblig\u00E9s \u00E0 faire preuve d'ouverture d'esprit...Les pilules furent cependant bien difficiles \u00E0 avaler quand leur premi\u00E8re fille \u00E9pousa un musulman, leur seconde un juif et leur troisi\u00E8me un chinois.  Leurs espoirs de voir enfin l'une d'elles se marier \u00E0 l'\u00E9glise se cristallisent donc sur la cadette, qui, all\u00E9luia, vient de rencontrer un bon catholique.", :genre=>["Com\u00E9die"], :poster=>"http://image.tmdb.org/t/p/w500//uUiyiGtMKSmTQyQ2j8hIwi4ah9W.jpg", :casting=>{0=>{:role=>"Claude Verneuil", :name=>"Christian Clavier"}, 1=>{:role=>"Marie Verneuil", :name=>"Chantal Lauby"}, 2=>{:role=>"David Benichou", :name=>"Ary Abittan"}}}, "RIO 2"=>{:id=>172385, :title=>"Rio 2", :title_list=>"RIO 2", :synopsis=>"Blu a pris son envol et se sent d\u00E9sormais chez lui \u00E0 Rio de Janeiro, aux c\u00F4t\u00E9s de Perla et de leurs trois enfants. Mais la vie de perroquet ne s\u2019apprend pas en ville et Perla insiste pour que la famille s\u2019installe dans la for\u00EAt amazonienne. Alors que Blu essaie de s\u2019habituer \u00E0 ses nouveaux voisins, il s\u2019inqui\u00E8te de voir Perla et ses enfants beaucoup plus r\u00E9ceptifs \u00E0 l\u2019appel de la jungle.", :genre=>["Animation", "Familial"], :poster=>"http://image.tmdb.org/t/p/w500//w8alkJlkAaekbxsAani7qccE61P.jpg", :casting=>{0=>{:role=>"Blu (voice)", :name=>"Jesse Eisenberg"}, 1=>{:role=>"Jewel (voice)", :name=>"Anne Hathaway"}, 2=>{:role=>"Linda (voice)", :name=>"Leslie Mann"}}}, "BARBECUE"=>{:id=>250349, :title=>"Barbecue", :title_list=>"BARBECUE", :synopsis=>"Pour ses 50 ans, Antoine a re\u00E7u un cadeau original : un infarctus. A partir de maintenant, il va devoir \u00ABfaire attention\u00BB. Or, Antoine a pass\u00E9 sa vie enti\u00E8re \u00E0 faire attention : attention \u00E0 sa sant\u00E9, \u00E0 ce qu'il mangeait, attention \u00E0 sa famille, \u00E0 accepter les travers de ses amis, et \u00E0 avaler de trop nombreuses couleuvres\u2026 D\u00E9sormais, il va adopter un nouveau r\u00E9gime. Mais en voulant changer sa vie, on change forc\u00E9ment celle des autres", :genre=>["Com\u00E9die"], :poster=>"http://image.tmdb.org/t/p/w500//20ZniTaQ4tIQJQOfWZ4bpps8jmx.jpg", :casting=>{0=>{:role=>"Antoine", :name=>"Lambert Wilson"}, 1=>{:role=>"Baptiste", :name=>"Franck Dubosc"}, 2=>{:role=>"Olivia", :name=>"Florence Foresti"}}}, "LA LISTE DE MES ENVIES"=>{:id=>277230, :title=>"La Liste de mes envies", :title_list=>"LA LISTE DE MES ENVIES", :synopsis=>"Lorsque la petite merci\u00E8re d\u2019Arras d\u00E9couvre qu\u2019elle a gagn\u00E9 18 millions \u00E0 la loterie et qu\u2019elle peut d\u00E9sormais s\u2019offrir tout ce qu\u2019elle veut, elle n\u2019a qu\u2019une crainte : perdre cette vie modeste faite de bonheurs simples qu\u2019elle ch\u00E9rit par-dessus tout. Mais le destin est obstin\u00E9, et c\u2019est en renon\u00E7ant trop longtemps \u00E0 cette bonne fortune qu\u2019elle va d\u00E9clencher, bien malgr\u00E9 elle, un ouragan qui va tout changer. Tout, sauf elle.", :genre=>[], :poster=>"http://image.tmdb.org/t/p/w500//vfAgOQDgJLVAdi7rVuERl1XmeXR.jpg", :casting=>{0=>{:role=>"Jocelyne Guerbette", :name=>"Mathilde Seigner"}, 1=>{:role=>"Jo Guerbette", :name=>"Marc Lavoine"}, 2=>{:role=>"Danielle 2", :name=>"Fr\u00E9d\u00E9rique Bel"}}}, "DRAGONS 2"=>{:id=>82702, :title=>"Dragons 2", :title_list=>"DRAGONS 2", :synopsis=>"Tandis qu\u2019Astrid, Rustik et le reste de la bande se d\u00E9fient durant des courses sportives de dragons devenues populaires sur l\u2019\u00EEle, notre duo d\u00E9sormais ins\u00E9parable parcourt les cieux, \u00E0 la d\u00E9couverte de territoires inconnus et de nouveaux mondes. Au cours de l\u2019une de leurs aventures, ils d\u00E9couvrent une grotte secr\u00E8te qui abrite des centaines de dragons sauvages, dont le myst\u00E9rieux Dragon Rider. Les deux amis se retrouvent alors au centre d\u2019une lutte visant \u00E0 maintenir la paix. Harold et Krokmou vont se battre pour d\u00E9fendre leurs valeurs et pr\u00E9server le destin des hommes et des dragons.", :genre=>["Action", "Aventure", "Animation", "Com\u00E9die", "Fantastique", "Familial"], :poster=>"http://image.tmdb.org/t/p/w500//ePUTpNWfcmYnuznobGdZC27UnrT.jpg", :casting=>{0=>{:role=>"Hiccup (voice)", :name=>"Jay Baruchel"}, 1=>{:role=>"Stoick the Vast (voice)", :name=>"Gerard Butler"}, 2=>{:role=>"Ruffnut (voice)", :name=>"Kristen Wiig"}}}, "MALEFIQUE"=>{:id=>102651, :title=>"Mal\u00E9fique", :title_list=>"MALEFIQUE", :synopsis=>"L\u2019histoire in\u00E9dite de Mal\u00E9fique, la tr\u00E8s aim\u00E9e m\u00E9chante du classique Disney de 1959 \"La Belle au Bois Dormant\". Le film r\u00E9v\u00E8le les \u00E9v\u00E9nements qui lui ont endurci le c\u0153ur et l\u2019ont conduite \u00E0 jeter un mauvais sort \u00E0 la petite Aurore.", :genre=>["Action", "Aventure", "Fantastique", "Romance", "Familial"], :poster=>"http://image.tmdb.org/t/p/w500//Af8XwQ3FAhB0BwenZSHxoByPUvx.jpg", :casting=>{0=>{:role=>"Maleficent", :name=>"Angelina Jolie"}, 1=>{:role=>"Princess Aurora", :name=>"Elle Fanning"}, 2=>{:role=>"Thistletwit", :name=>"Juno Temple"}}}, "ON A FAILLI \u00CATRE AMIES"=>{:id=>270342, :title=>"On a failli \u00EAtre amies", :title_list=>"ON A FAILLI \u00CATRE AMIES", :synopsis=>"Marith\u00E9 se voue \u00E0 son travail de formatrice avec ardeur. Elle souhaite que ses stagiaires sortent de formation en ayant d\u00E9couvert leur voie. Avec Carole, une \u00E9pouse d\u00E9vou\u00E9e, sa mission va aller au-del\u00E0 puisque celle-ci, prenant conscience de ses possibilit\u00E9s, quitte son mari. Une relation amoureuse s'installe entre les deux femmes.", :genre=>[], :poster=>"http://image.tmdb.org/t/p/w500//9ovCeQznt4ZLxL1zICSrx9crOLz.jpg", :casting=>{0=>{:role=>"Marith\u00E9", :name=>"Karin Viard"}, 1=>{:role=>"Carole Drissi", :name=>"Emmanuelle Devos"}, 2=>{:role=>"Sam Drissi", :name=>"Roschdy Zem"}}}, "LA RITOURNELLE"=>{:id=>258435, :title=>"La Ritournelle", :title_list=>"LA RITOURNELLE", :synopsis=>"Brigitte et Xavier sont \u00E9leveurs bovins en Normandie. Elle est r\u00EAveuse, la t\u00EAte dans les \u00E9toiles. Lui, les pieds ancr\u00E9s dans la terre, vit surtout pour son m\u00E9tier. Avec le d\u00E9part des enfants, la routine de leur couple p\u00E8se de plus en plus \u00E0 Brigitte. Un jour, sur un coup de folie, elle prend la clef des champs. Destination : Paris. Xavier r\u00E9alise alors qu\u2019il est peut-\u00EAtre en train de la perdre. Parviendront-ils \u00E0 se retrouver ? Et comment se r\u00E9inventer, apr\u00E8s toutes ces ann\u00E9es ? La reconqu\u00EAte emprunte parfois des chemins de traverse...", :genre=>["Com\u00E9die"], :poster=>"http://image.tmdb.org/t/p/w500//jeoslytSa0tjS9KqePB9VqJnNhq.jpg", :casting=>{0=>{:role=>"Brigitte Lecanu", :name=>"Isabelle Huppert"}, 1=>{:role=>"Xavier Lecanu", :name=>"Jean-Pierre Darroussin"}, 2=>{:role=>"Jesper", :name=>"Michael Nyqvist"}}}, "LES VACANCES DU PETIT NICOLAS"=>{:id=>277368, :title=>"Les vacances du petit Nicolas", :title_list=>"LES VACANCES DU PETIT NICOLAS", :synopsis=>"C\u2019est la fin de l\u2019ann\u00E9e scolaire. Le moment tant attendu des vacances est arriv\u00E9.Le petit Nicolas, ses parents et M\u00E9m\u00E9 prennent la route en direction de la mer, et s\u2019installent pour quelques temps \u00E0 l\u2019H\u00F4tel Beau-Rivage.", :genre=>["Com\u00E9die", "Familial"], :poster=>"http://image.tmdb.org/t/p/w500//vBJQc8gZh5WOxyDxFIAU1SruKY8.jpg", :casting=>{0=>{:role=>"Le petit Nicolas", :name=>"Math\u00E9o Boisselier"}, 1=>{:role=>"La m\u00E8re de Nicolas", :name=>"Val\u00E9rie Lemercier"}, 2=>{:role=>"Le p\u00E8re de Nicolas", :name=>"Kad Merad"}}}, "TRANSFORMERS L AGE DE L'EXTINCTION"=>{:id=>91314, :title=>"Transformers : L'\u00C2ge de l'Extinction", :title_list=>"TRANSFORMERS L AGE DE L'EXTINCTION", :synopsis=>"Alors que l\u2019humanit\u00E9 panse ses plaies, apr\u00E8s les \u00E9v\u00E9nements de Transformers : La Face cach\u00E9e de la Lune, les Autobots et les Decepticons ont disparu de la surface de la Terre. Mais un groupe form\u00E9 de financiers et scientifiques puissants et ing\u00E9nieux \u00E9tudient les invasions successives des Transformers, afin de repousser les limites de la technologie au-del\u00E0 de ce qu\u2019ils peuvent contr\u00F4ler. Et pendant ce temps, une menace Transformer ancienne et puissante prend la Terre pour cible.", :genre=>["Action", "Aventure", "Science-Fiction"], :poster=>"http://image.tmdb.org/t/p/w500//9NCPIUbqgAcRYwex4pCg9s20jun.jpg", :casting=>{0=>{:role=>"Cade Yeager", :name=>"Mark Wahlberg"}, 1=>{:role=>"Joshua", :name=>"Stanley Tucci"}, 2=>{:role=>"Tessa Yeager", :name=>"Nicola Peltz"}}}, "TRANSCENDANCE"=>{:id=>157353, :title=>"Transcendance", :title_list=>"TRANSCENDANCE", :synopsis=>"Dans un futur proche, un groupe de scientifiques tente de concevoir le premier ordinateur dot\u00E9 d\u2019une conscience et capable r\u00E9fl\u00E9chir de mani\u00E8re autonome. Ils doivent faire face aux attaques de terroristes anti-technologie qui voient dans ce projet une menace pour l\u2019esp\u00E8ce humaine. Lorsque le scientifique \u00E0 la t\u00EAte du projet est assassin\u00E9, sa femme se sert de l\u2019avanc\u00E9e de ses travaux pour \"transcender\" l\u2019esprit de son mari dans le premier super ordinateur de l\u2019histoire. Pouvant d\u00E9sormais contr\u00F4ler tous les r\u00E9seaux li\u00E9s \u00E0 internet, il devient ainsi quasi omnipotent. Mais comment l\u2019arr\u00EAter s\u2019il perdait ce qui lui reste d\u2019humanit\u00E9 ?", :genre=>["Drame", "Myst\u00E8re", "Science-Fiction", "Thriller"], :poster=>"http://image.tmdb.org/t/p/w500//ikonFy0ooG8sj5ei7FGQ8RJ70NW.jpg", :casting=>{0=>{:role=>"Will", :name=>"Johnny Depp"}, 1=>{:role=>"Max", :name=>"Paul Bettany"}, 2=>{:role=>"Evelyn", :name=>"Rebecca Hall"}}}, "PLANES 2"=>{:id=>218836, :title=>"Planes 2", :title_list=>"PLANES 2", :synopsis=>"Quand Dusty apprend que son moteur est endommag\u00E9 et qu\u2019il ne pourra peut-\u00EAtre plus jamais participer \u00E0 une course, il d\u00E9cide de changer de voie et de se lancer dans la guerre contre le feu au sein d\u2019une \u00E9quipe improbable en charge de la protection du parc national de Piston Peak. Il joint ainsi ses forces \u00E0 celles de l\u2019h\u00E9licopt\u00E8re de secours Blade Ranger et de sa courageuse \u00E9quipe de l\u2019air dont la tr\u00E8s vive Lil\u2019Dipper, l\u2019h\u00E9licopt\u00E8re de transports lourds Windlifter, l\u2019ancien transporteur militaire Cabbie et une bande de courageux v\u00E9hicules tous-terrains. Dans leur bataille contre les incendies, Dusty va d\u00E9couvrir combien il en co\u00FBte pour devenir un vrai h\u00E9ros\u2026", :genre=>["Aventure", "Animation", "Com\u00E9die", "Familial"], :poster=>"http://image.tmdb.org/t/p/w500//f4Bk6lNAFs0QLDKCSo66NH3fvc5.jpg", :casting=>{0=>{:role=>"Dusty Crophopper (voice)", :name=>"Dane Cook"}, 1=>{:role=>"Dipper (voice)", :name=>"Julie Bowen"}, 2=>{:role=>"Dynamite (voice)", :name=>"Regina King"}}}}}
    @cinema_object = MoviesObject.new(hash_result)
    assert_equal 'JUILLET'                    , @cinema_object.mois
    assert_equal 'LES RHODOS VILLAGE'         , @cinema_object.cine1
    assert_equal 'LE CHARMIEUX CHINAILLON'    , @cinema_object.cine2
    assert_equal 'SOUS LES JUPES DES FILLES'  , @cinema_object.film1(5)
    assert_equal 'BABYSITTING'                , @cinema_object.film2(5)
    assert_equal 'SOUS LES JUPES DES FILLES'  , @cinema_object.film3(5)
    assert_equal 'BABYSITTING'                , @cinema_object.film4(5)
    assert_equal '17h30'                      , @cinema_object.horaire1(5)
    assert_equal '21H'                        , @cinema_object.horaire2(5)
    assert_equal '273169'                     , @cinema_object.id(@cinema_object.film1(5))
    assert_equal 'Sous les jupes des filles'  , @cinema_object.title(@cinema_object.film1(5))
    assert_equal 'SOUS LES JUPES DES FILLES'  , @cinema_object.title_list(@cinema_object.film1(5))
    assert_equal "Paris. 28 premiers jours du printemps. 11 femmes.\r M\u00E8res de famille, femmes d'affaires, copines, ma\u00EEtresses ou \u00E9pouses...\r Toutes repr\u00E9sentent une facette de la femme d'aujourd'hui : Complexes, joyeuses, complex\u00E9es, explosives, insolentes, surprenantes... Bref, un \u00EAtre paradoxal, totalement d\u00E9boussol\u00E9, d\u00E9finitivement vivant, FEMMES tout simplement !"  , @cinema_object.overview(@cinema_object.film1(5))
    assert_equal 'http://image.tmdb.org/t/p/w500//qtdx6rnatFNT3xSXcQzGzRAX24H.jpg'  , @cinema_object.poster(@cinema_object.film1(5))
  end
end