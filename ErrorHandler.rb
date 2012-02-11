

class ErrorHandler
	def initialize
		@errors = Hash[["404", "404 Error: Page not found"]]
	end
	
	def throw(errNum)
		#assemble the full HTML of the error page and return it
		r = Response.new("", "Error "+errNum)
		return @errors[errNum]
	end
end