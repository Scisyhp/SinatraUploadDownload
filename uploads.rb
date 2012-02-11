def setFileList(zip_index)
	File.open("/Users/benwalker/Source Code/Ruby/Sinatra/files/fileList.rb", 'w+') do |file|
		file.print("
		def getFileList
			#get a list of all files on servers and return it
			fileList = \"" + zip_index.join(',') + "\"
			return fileList
		end
		
		")
	end
end

get '/uploads/' do
	r = Response.new("", "Uploads")
	r.print("<div class='wrapper'>\n")
	r.print("
	<div id='uploadForm'>
	<form name='upload' id='uploadForm' action='/uploads/upload' method='post' enctype='multipart/form-data'>
	<input type='hidden' name='_method' value='put' />
	<input type='hidden' name='fileName' id='fileNameInput' value='' />
	Upload a file: <input type='file' id='fileUploadInput' name='file' size='40' />
	<input type='submit' value='Upload' />
	<!--<input type='button' value='Upload' onclick='submitUploadForm()' />-->
	</form>
	</div>
	")
	r.print("\n</div>")
	return r.getFullResponse()
end

get '/uploads/complete' do
	r = Response.new("","Upload successful")
	
	r.print("
	<div class='wrapper'>
		<p>Your upload has been successful. <a href='/'>Click here</a> to return to the main page, or <a href='/uploads/'>here</a> to return to the upload page.</p>
	</div>
	")
end


put '/uploads/upload' do

	fileName = params['fileName']
	
	data = request.body.read()
	#print data
	#parse attempt 2-pure regexp
	reg = Regexp.new(/[\w\W]*name\="(\w*.\w*)"\s*Content-Type:\s*(\w*\/[\w\-]*)\s*([\w\W]*)\-{29,29}/)
	reg.match(data)
	fileName     = $1
	fileType     = $2
	fileContents = $3
	
	zipFileName = "public/files/" + fileName.split('.')[0] + ".zip"
	
	begin
		Zip::ZipFile.open(zipFileName, Zip::ZipFile::CREATE) { |zipfile|
			zipfile.get_output_stream(fileName) { |f|
				f.write(fileContents)
			}
			zipfile.close()
		}
	rescue
		next
	end
	
	#re-index file directory
	
	
  	redirect '/uploads/complete'
end