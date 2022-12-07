class ExternalService
  def send_url(url)
    uri = URI.parse('https://eoqth9x5n46qae7.m.pipedream.net')
    params = { 's3_url': url }
    Net::HTTP.post_form(uri, params)
  end
end