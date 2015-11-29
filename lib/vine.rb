module Vine
  class API
    def self.popular(page = 0)
      page > 0 ? client.popular(page: page) : client.popular
    end

    def self.high_velocity(page = 0)
      popular(page).reject do |vine|
        vine.loops.velocity < 6 && vine.loops.onFire == 0
      end
    end

    def self.search(search, page = 0)
      if page > 0
        current_search = client.search(search, page: page)
      else
        current_search = client.search(search)
      end
      current_search.reject do |vine|
        vine.loops[:count] < 1000 && vine.loops.onFire == 0
      end
    end

    private

    def self.client
      @client ||= Redvine.new
      @client.connect(
        email: ENV['VINE_EMAIL'],
        password: ENV['VINE_PASSWORD']
      )
      return @client
    end
  end
end
