class WundergroundChanceData
  def initialize(hash)                                                                                                                                            
    @hash = hash
  end
  
  def method_missing(method_name, *args, &block)
    key = method_name.to_s
    raise "Method not supported #{key}" unless @hash.include? key
    
    @hash[key]
  end
end