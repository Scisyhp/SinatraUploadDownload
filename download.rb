#Set up download section

def getFileList
	Dir.chdir("/Users/benwalker/Source Code/Ruby/Sinatra/files")
	index = Dir["*"]
	zip_index = []
	for i in index do
		if i.split('.')[1] == 'zip'
			zip_index.push(i)
		end
	end
	Dir.chdir("/Users/benwalker/Source Code/Ruby/Sinatra")
	return zip_index
end

#function to generate list of terms 
def getSideList
	r = ''
	#display all possible downloads with links to each
	 
	files = getFileList()
	
	r += "<div class='wrapper' id='sidelist'>"
	
	r += "
	<script type='text/javascript'>
	fileListS = \""+files.join(',')+"\";
	fileList = fileListS.split(',');
	function updateBox(id) {
		term = document.getElementById(id).value;
		fList = filterList(fileList, term);
		
		var newListHTML = '';
		for each (f in fList) {
			newListHTML += '<span class=\"sideListElement\"><a class=\"downloadSideList\" href=\"/downloads/'+f+'\">'+f+'</a></span><br />';
		}
		
		document.getElementById('actualList').innerHTML = newListHTML;
	}
	</script>
	<div id='inputBox'>
		<img src='/images/search.png' height='16' width='16' />&nbsp;&nbsp;<input id='filterInput' type='text' onkeyup='updateBox(\"filterInput\")' onkeydown='updateBox(\"filterInput\")' />
	</div>
	"

	#print out a line for each of the available files
	r += "<div id='actualList'>\n"
	for f in files
		r += "<span class='sideListElement'><a class='downloadSideList' href=\'/downloads/"+f+"\'>"+f+"</a></span><br />\n"
	end
	r += "</div>\n"
	r += "</div>\n"
	
	return r
	
end
	
get '/' do
	r = Response.new("", "All Downloads")
	r.print(getSideList())
	r.print("
	<div class='wrapper' id='mainBody'>
	<div id='dlexp' class='innerwrapper'>
		<p>
			This is a list of all downloads available on Downloader. Click on any link to view or download it.
		</p>
	</div></div>
	
	
	")
	return r.getFullResponse()
end

get '/downloads/:name' do
	#link to download file named :name
	
	#check if the file request is valid
	#load "files/fileList.rb"
	
	r = Response.new("", "#{params[:name]}")
	
	r.print(getSideList())
	
	#print out link to download
	
	r.print("<div class='wrapper' id='mainBody'><div class='innerwrapper'>
		<h3 style='text-align:center'><a href='/files/#{params[:name]}'>Download #{params[:name]}</a></h3>
		</div>
	</div>")
	
	return r.getFullResponse()
end