function bgColorGray(id) {
	p = document.getElementById(id);
	p.style.backgroundColor = "#808080";
}

function bgColorNormal(id) {
	p = document.getElementById(id);
	p.style.backgroundColor = "#2D2D2D";
}

function filterList(tList, term) {
	var p = new RegExp(term);
	var fList = new Array();
	
	for each (var x in tList) {
		if (p.test(x) == true) {
			fList.push(x);
		}
	}
	
	return fList;
}

function submitUploadForm() {
	//set name hidden appropriately and then submit the form
	name = document.getElementById('fileUploadInput').value
	document.getElementById('fileNameInput').value = name
	
	document.upload.submit()
}