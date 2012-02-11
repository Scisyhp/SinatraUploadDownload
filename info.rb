#the info page ruby file

get '/info' do
	#present info page
	r = Response.new("", "Info")
	
	r.print("
	
	<div class='wrapper'>
		<p>
			This is a simple website designed to allow people to publicly upload and download files. You can upload files yourself under the upload tab
			and download your and other people's files under the download tab.
		</p>
	</div>
	
	")
	
	return r.getFullResponse
end