module Puppet::Parser::Functions
  newfunction(:sort_a_of_h, :type => :rvalue, :doc => <<-DOC
    This sorts an array of hash values based on given hash keyword
    
    Example: sort_a_of_h([Array], keyword)
    sort_a_of_h([{name => "Service1", priority => 30}, {name => "Service2", priority => 20}], 'priority')
    
    Yields:
    [{name => "Service2", priority => 20}, {name => "Service1", priority => 30}]
    DOC
     ) do |arguments|
        
    raise(Puppet::ParseError, "values_at(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size != 2

    array = arguments[0]
    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'values_at(): Requires array to work with')
    end

    sortkey = arguments[1]
    
    array.each do |h|
      unless h.is_a?(Hash)
         raise(Puppet::ParseError, 'values_at(): Requires array of hashes to work with')
      end
    end
    result = array.sort_by { |a| a[sortkey] }
    return result
  end
end
