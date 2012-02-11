class Response
	
	def colorChange(id)
		colorChange = 'onmouseover = "bgColorGray(\''+id+'\')" onmouseout = "bgColorNormal(\''+id+'\')"'
		return colorChange
	end
	
	def initialize(data, title)
		#initializes response with title and initial further body data as stated in arguments
	
		@response =  getDoctype()
		@response += "<html>\n<head>\n<title>" + title + "</title>\n<script type='text/javascript' src='/main.js'></script><link rel='stylesheet' type=\"text/css\" href=\"/main.css\" /></head>\n<body>\n\n"
		
		
		#HEADER-------------------------------------
		@response += '<div id="header">
			<div class="inheader" style="float:left" id="Downloads" '+colorChange('Downloads')+' onclick="window.location=\'/\'">Downloads</div>
			<div class="inheader" id="Uploads" '+colorChange('Uploads')+' onclick=\'window.location="/uploads/"\'>Uploads</div>
			<div class="inheader" id="Info" '+colorChange('Info')+' onclick=\'window.location="/info"\'>Info</div>
		</div>' 
		#HEADER-------------------------------------
		
		
		@response += "<div>"
 		@response += data
	end
	
	def print(data)
		@response += data
	end
	
	def getFullResponse
		@response += "\n\n</div></body>\n</html>"
		return @response
	end
	
end
