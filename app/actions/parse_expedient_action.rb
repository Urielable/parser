# -*- encoding : utf-8 -*-
include ParserService

require 'nokogiri'
require 'open-uri'
require 'openssl'

class ParseExpedientAction
  def self.execute(uri)
    parser_service = ParserService::Parse.new(
      { 
        uri: uri
      }
    )
    document = Nokogiri::HTML.parse(open(uri, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})) rescue nil
    document.class

    
    if document == nil
      response = "Ocurrio un problema, revisa que la ruta que proporcionaste sea correcta."
      code = 409
    else
      if document.css('div.header').text.include? "Bloqueo"
      response = "Bloqueo Temporal, intenta con otro expediente."
      code = 409
      else
        response = self.generate_object(document)
        code = 200
      end
    end
    [response, code]
  end

  def self.generate_object(document)
    exp = document.css('div.header').children[1].text.split('Exp:').last.strip rescue nil
    author = document.css('div.content').children[4].children[5].text.split('Actor:').last.strip rescue nil
    defendant = document.css('div.content').children[4].children[7].text.split('Demandado:').last.strip rescue nil
    court = document.css('div.content').children[4].children[3].text rescue nil
    summary = document.css('div.content').children[7].text rescue nil
    notification = document.css('div.postDegradado').css('li.list-group-item').map{ |nots| {date: nots.children[1].text, description: nots.children[3].text} }.compact

    expedient = [
        court: court,
        author: author,
        defendant: defendant,
        summary: summary,
        notifications_attributes: notification
    ]
  end
end
