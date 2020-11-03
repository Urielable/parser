# -*- encoding : utf-8 -*-
class SaveExpedientAction

  def self.execute(expedient)
    Expedient.create(expedient).first
  end
  
end