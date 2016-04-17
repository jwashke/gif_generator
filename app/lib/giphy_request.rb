class GiphyRequest
  def initialize
    @key = ENV["GIPHYAPIKEY"].chomp
  end

  def request(search_term)
    response = Faraday.get("http://api.giphy.com/v1/gifs/random?tag=#{search_term}&api_key=#{@key}")
    data = JSON.parse(response.body)
    data["data"]["image_url"]
  end
end
