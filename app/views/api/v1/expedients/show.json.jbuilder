json.expedient do 
  json.court @expedient.court
  json.author @expedient.author
  json.defendant @expedient.defendant
  json.summary @expedient.summary
  json.notifications @expedient.notifications
end