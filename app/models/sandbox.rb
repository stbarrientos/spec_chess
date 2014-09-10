require 'shikashi'

include Shikashi

class Runner

	def go
		s = Sandbox.new
		priv = Privelege.new
		s.allow_method :print
		s.run(priv, "rspec")
	end

end