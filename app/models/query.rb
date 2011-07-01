class Query
  include ActiveModel::Validations

  MAX_ADDRESS_LENGTH = 30

  attr_accessor :start_address, :end_address

  validates :start_address, :presence => true, :length => { :maximum => MAX_ADDRESS_LENGTH }
  validates :end_address,   :presence => true, :length => { :maximum => MAX_ADDRESS_LENGTH }

  def initialize(attr)
    self.start_address = attr["start_address"]
    self.end_address = attr["end_address"]
  end
end
