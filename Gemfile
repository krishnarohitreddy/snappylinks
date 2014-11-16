source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record

# comment it out when deploying to heroku
#gem 'sqlite3'



# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

gem 'factory_girl'
gem 'rspec-rails'
#gem 'pry-debugger', '~> 0.2.3'
gem 'cucumber'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


group :test do
  gem 'capybara',           :require => false
  gem 'cucumber-rails',     :require => false
  gem 'database_cleaner',   :require => false
  #gem 'diff-lcs', '< 1.2' # workaround Bundler infinite loop
  gem 'factory_girl_rails'

  #gem 'fivemat'
  #gem 'json_spec'
  #gem 'launchy',            :require => false
  #gem 'poltergeist'
  #gem 'resque_unit',        :require => false
  #gem 'shoulda-matchers',   :require => "shoulda/matchers/integrations/rspec"
  gem 'spec_coverage',      :require => false
  #gem 'test_xml'
  #gem 'timecop', '< 0.4' # https://github.com/jtrupiano/timecop/issues/31
  gem 'webmock',            :require => false
end


group :production do
	gem 'unicorn'
	#gem 'pg'
  gem 'pg', '~> 0.17.1'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
