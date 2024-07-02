class ElixirsController < ApplicationController
  class Elixir
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  def index
    url = "https://wizard-world-api.herokuapp.com/Elixirs"
    raw_json = URI.parse(url).read
    @elixirs = JSON.parse(raw_json)
    @elixirs = @elixirs.map { |elixir| Elixir.new(elixir["name"]) }
  end
end
