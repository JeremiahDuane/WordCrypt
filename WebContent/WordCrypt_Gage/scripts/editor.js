		function runScript() {
		document.getElementById('textArea').value = document.getElementById('divArea').textContent;
		} 
		function keydown1(evt, t) {
			if (evt.keyCode == 9) {
				evt.preventDefault();  // this will prevent us from tabbing out of the editor

		        // now insert four non-breaking spaces for the tab key
		        var editor = document.getElementById("divArea");
		        var doc = editor.ownerDocument.defaultView;
		        var sel = doc.getSelection();
		        var range = sel.getRangeAt(0);

		        var tabNode = document.createTextNode("\t");
		        range.insertNode(tabNode);

		        range.setStartAfter(tabNode);
		        range.setEndAfter(tabNode); 
		        sel.removeAllRanges();
		        sel.addRange(range);
		        }
        }
		function myFunction() {
		    var str = document.getElementById("divArea").innerHTML; 
		    var res = str.replace("\u201C", "\"").replace("\u201d", "\"");
		    document.getElementById("divArea").innerHTML = res;
		}
