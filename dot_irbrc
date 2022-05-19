if defined?(IRB)
  IRB.conf[:AUTO_INDENT] = true
end

Dir[File.expand_path("~/.irbd/*.rb")].each{|f| require f }

module Kernel
  def pbpaste
    `pbpaste`
  end

  def pbcopy(object)
    IO.popen('pbcopy', 'w') { |pb| pb << object.to_s }
  end

  def pbfilter(filter)
    pbcopy pbpaste.split("\n").select{|l| l =~ filter }.join("\n")
  end
end

class Object
  def local_methods
    self.methods.tap do |methods|
      self.class.ancestors.each do |ancestor|
        next if ancestor == self.class
        methods -= ancestor.instance_methods
      end
    end.sort
  end
end

module Enumerable
  def histogram(&block)
    h = Hash.new(0)
    each do |entry|
      key = block_given? ? yield(entry) : entry
      h[key] += 1
    end
    h
  end
end
