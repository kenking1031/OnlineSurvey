module ApplicationHelper

  def flash_format(hash)

    output = ""

    hash.each do |key, value|

     output += "#{key.capitalize} : #{value.join(' and ')}<html><br/></html>"

    end

    output

  end

end
