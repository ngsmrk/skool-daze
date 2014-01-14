class WundergroundResponse
  def initialize(hash)
    @hash = hash
  end
  
  def error?
    response_hash.include? 'error'
  end
  
  def error_description
    response_hash['error']['description']
  end
  
  private
  
  def response_hash
    @hash['response']
  end
end