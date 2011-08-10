require 'sinatra'
require 'json'

class FruitApp < Sinatra::Base
  class << self
    def data
      JSON.parse(File.read('fruits.json'))
    end
  end
  
  get '/fruits' do 
    content_type :json 
    self.class.data.to_json
  end
end