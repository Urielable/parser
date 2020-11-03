# -*- encoding : utf-8 -*-
module ParserService
  class Parse
      require 'nokogiri'
      require 'open-uri'
      require 'openssl'

      # Request sample:
      # parser_service = ParserService::Parse.new(
      #     { 
      #       uri: "http://yoururl.com"
      #     }
      #   )
      # array  = parser_service.parse_request

    def initialize options = {}
      @body = options
    end

    def parser_request
      # Fetch and parse HTML document
      document = Nokogiri::HTML.parse(open(@body[:uri], {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
      document.class
      [document, 200]
    end

  end
end