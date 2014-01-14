class WundergroundRange
  def initialize(hash)                                                                                                                                            
    @hash = hash
  end

  def method_missing(method_name, *args, &block)
    keys = keys_from_method_name(method_name)
    raise "invalid input #{method_name}" if keys.empty? || keys.size != 2

    @hash[keys[0]][keys[1]]
  end

  def respond_to?(method_name)
    keys = keys_from_method_name(method_name)
    return (!keys.empty? && keys.size == 2)
  end

  private

  def keys_from_method_name(method_name)
    keys = method_name.to_s.split('_')
  end
end