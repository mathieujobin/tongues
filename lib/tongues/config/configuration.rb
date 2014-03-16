require 'singleton'
require 'yaml'

module Tongues

  ## Provides a convenient way to edit configuration
  def self.configure(&block)
    if block_given?
      block.call(Configuration.instance)
    else
      Configuration.instance
    end
  end

  class Configuration
    include Singleton

    ## Returns the api url
    def self.api_url
      'http://ws.detectlanguage.com/0.2/detect'
    end

    ## Returns the api key
    def self.api_key
      @@api_key
    end

    ## Modifies the api_key
    def self.api_key=(key)
      @@api_key = key
    end

    ## Returns a hash of supported languages
    def self.languages
      YAML::load(File.open('lib/tongues/config/config.yml'))['correspondences']
    end
  end
end