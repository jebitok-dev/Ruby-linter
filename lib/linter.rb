require_relative './spacescanner.rb'
require_relative './buffer.rb'

class Linter < Buffer
    include SpaceScanner
end