# Źródło pobieranych gemów.
source 'https://rubygems.org'

# Wersja rubiego zgodna z serwerami heroku
ruby "2.0.0"

# Gem frameworku rails potrzebny do działania całego projektu.
gem 'rails', '4.0.5'

# Serwer HTTP do zapewnienia szybkiej pracy naszej aplikacji.
gem 'unicorn'

# Gem do uwierzytelniania użytkowników i administratorów.
gem 'devise'

# Gem przyzwoite wystawianie.
# http://decentexposure.info/
gem 'decent_exposure'

# will_paginate
gem 'will_paginate-bootstrap'

# Haml.
# Wiki: http://pl.wikipedia.org/wiki/Haml
gem 'haml-rails'

# Bootstrap
gem 'bootstrap-sass'
gem 'bootstrap-filestyle-rails', github: 'rayros/bootstrap-filestyle-rails'

# Gem umożliwiający komunikację z serweram Amazona
# W naszym projekcie jest potrzebny do gromadzenia obrazków.
# Dlaczego? Ponieważ heroku jest tylko i wyłącznie do odczytu.
# Nie możemy zapisać naszego obrazka na serwerze podczas jego działania.
# Dlatego każdy obrazek przechowujemy na Amazon S3
gem 'aws-sdk'

# Gem do łatwego zarządzania załącznikami.
# Dzięki niemu możemy w łatwy sposób umożliwić modelowi przechowywać pliki.
# Dla nas był potrzebny tylko i wyłącznie dla obrazków.
gem 'paperclip', github: 'thoughtbot/paperclip'

# Gem kompresujący kod javascript.
gem 'uglifier', '>= 1.3.0'

# Biblioteka jQuery dla javascripta.
gem 'jquery-rails'


# Grupa gemów porzebnych tylko przy pracach deweloperskich i testach projektu.
group :development, :test do
  # Gem pozwalający na dodawanie danych z pliku .env.
  # Podobnie jak w heroku config:set
  # A także uruchamiać procesy z pliku Procfile.
  # Użycie:
  #   By uruchomić serwer wsytarczy wpisać:
  #     foreman start
  #   By uruchomić inną aplikację wraz z danymi z pliku .env wystarczy:
  #     foreman run nazwa_aplikacji argumenty...
  #     foreman run rake db:migrate
  gem 'foreman'
  # Baza danych sqlite do developmentu i testów.
  gem 'sqlite3'
  # Do generowania informacji o tabelach bazy w plikach opisujących modele.
  # Znajdują się w app/models/*
  gem 'annotate'
end
# Grupa gemów potrzebna podczas produkcji na serwerach heroku.
group :production do
  # Gem dodający obsługę bazy danych postgresql.
  # Dane będą przechowywane w relacyjnej bazie dancyh.
  gem 'pg'
  # Gem wymagany przez heroku.
  # Dlaczego? http://stackoverflow.com/questions/19723339/why-is-the-rails-12factor-gem-necessary-on-heroku
  gem 'rails_12factor'
end
