class ExternalService
  # Method send_url will send a request to the request bin with S3 url as parameter
  def send_url(url)
    # url for the request bin
    uri = URI.parse('https://eoqth9x5n46qae7.m.pipedream.net')
    params = { 's3_url': url }
    Net::HTTP.post_form(uri, params)
  end
end