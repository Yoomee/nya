require 'webmock/cucumber'

WebMock.disable_net_connect!(:allow_localhost => true)

# stub external apis before every scenario
Before do
  stub_geocoder
end

module WebMockStubs

  def stub_geocoder
    maps_api_response = get_maps_api_response
    stub_request(:get, /.*maps.googleapis.com.*/).
            with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
            to_return(:status => 200, :body => maps_api_response, :headers => {})
  end

  private

  def get_maps_api_response
    File.new(File.join(File.dirname(__FILE__), "maps-api-response.json"))
  end

end
