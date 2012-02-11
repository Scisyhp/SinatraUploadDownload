require 'rubygems'
require 'ftools'
require 'sinatra'
require 'zip/zip'

load "Response.rb"

load "ErrorHandler.rb"

def getDoctype
	doctype = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">'+"\n\n"
	return doctype
end



#pages concerning downloads
load "download.rb"

#pages concerning uploads
load "uploads.rb"

#info page
load "info.rb"