// WSH script to download my .g?vimrc
var shell = WScript.CreateObject("WScript.Shell");
var profile = shell.ExpandEnvironmentStrings("%USERPROFILE%");
shell.CurrentDirectory = profile;
var fso = new ActiveXObject("Scripting.FileSystemObject");
fso.CreateFolder(".swp");

// based on https://gist.github.com/duncansmart/5821523
function download(url, file){
	var xhr = new ActiveXObject("MSXML2.XMLHTTP");
	xhr.open("GET", url, false);
	xhr.send();
	if(xhr.Status == 200){
		if(fso.FileExists(file))
			fso.DeleteFile(file);
		var stream = new ActiveXObject("ADODB.Stream");
		stream.Open();
		stream.Type = 1; // adTypeBinary
		stream.Write(xhr.ResponseBody);
		stream.Position = 0;
		stream.SaveToFile(file);
		stream.Close();
	}
	else{
		WScript.Echo(
			"Error downloading " + url + 
			" (" + xhr.status + " " + xhr.statusText + ")");
	}
}

download("https://raw.githubusercontent.com/dragon0/dotfiles/master/.vimrc", ".vimrc");
download("https://raw.githubusercontent.com/dragon0/dotfiles/master/.gvimrc", ".gvimrc");

// :)
shell.sendkeys("{CAPSLOCK}");
WScript.sleep(500);
shell.sendkeys("{CAPSLOCK}");
