class User 
    def initialize(password, username)
        @password = password
        @username = username
    end

    def create(filename)
        time = Time.now
        @files[filename] = time
        puts "#{filename} was created by #{username} at #{time}"
    end

    
end