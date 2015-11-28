module Vine
  class API
    def self.popular(page = 0)
      page > 0 ? client.popular(page: page) : client.popular
    end

    def self.high_velocity(page = 0)
      popular(page).reject { |vine| vine.loops.velocity < 5}
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
