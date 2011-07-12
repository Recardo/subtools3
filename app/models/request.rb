class Request < ActiveRecord::Base
  belongs_to :principal
  accepts_nested_attributes_for :principal
  
  has_many :request_positions

  NEU = 10
  ANGEFRAGT = 20
  BESTAETIGT = 30
  AUFTRAG = 40
  AUSGEFUEHRT = 50
  RECHNUNG = 60
  GESCHLOSSEN = 70


  STATUSES = {
    NEU    => 'Neu',
    ANGEFRAGT    => 'Angefragt',
    BESTAETIGT => "Bestaetigt",
    AUFTRAG => 'Auftrag',
    AUSGEFUEHRT => "Ausgefuehrt",
    RECHNUNG => 'Rechnung',
    GESCHLOSSEN => 'Geschlossen'
  }

  validates_inclusion_of :status, :in => STATUSES.keys, :message => "{{value}} must be in #{STATUSES.values.join ','}"

  def status_name
    STATUSES[status]
  end
  
  #TYPES
  EINZEL = 10
  MEHRFACH = 20
  
  TYPES = {
    EINZEL => "Einzel",
    MEHRFACH => "Mehrfach"
  }
  
  validates_inclusion_of :type, :in => TYPES.keys, :message => "{{value}} must be in #{TYPES.values.join ','}"

  def type_name
    TYPES[type]
  end  

end


