require_relative './spacescanner'
require_relative './buffer'

class Linter < Buffer
  include SpaceScanner
end
