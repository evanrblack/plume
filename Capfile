# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# More tasks
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/puma'

# Load dotenv
require 'dotenv'
Dotenv.load

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
