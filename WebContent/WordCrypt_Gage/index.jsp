<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>
		WordCrypt | Home
		</title>
		<link rel="shortcut icon" type="image/png" href="WordCrypt_Gage/images/logo_favicon.png" />
		<meta charset="utf-8">
		<link rel="stylesheet" href="WordCrypt_Gage/style/style.css">
		<script src="editor.js"> </script>
	</head>

		<%
		ArrayList<String> dwArray = new ArrayList<String>();
		ArrayList<String> wordArray = new ArrayList<String>();
		ArrayList<String> dwCustom = new ArrayList<String>();
		String cleanText = "";
		String outText = "Place your essay here, then click \"find deadwords\" to get started. Be sure to paste your essay as plain text (Ctrl + Shift + V), this will make things format better.";
		int dwCount = 0;
	  
		try {	
		Scanner dwFile = new Scanner(new File("C:/Users/jerem/eclipse-workspace/WordCryptFinal/WebContent/deadword_list.txt"));
		Scanner dwCustomFile = new Scanner(new File("C:/Users/jerem/eclipse-workspace/WordCryptFinal/WebContent/custom.txt"));
		Scanner dwFile2 = new Scanner(new File("C:/Users/jerem/eclipse-workspace/WordCryptFinal/WebContent/deadword_list.txt"));
		Scanner readFile = new Scanner(new File("C:/Users/jerem/eclipse-workspace/WordCryptFinal/WebContent/edit.txt"));
		PrintWriter editFile = new PrintWriter(new File("C:/Users/jerem/eclipse-workspace/WordCryptFinal/WebContent/edit.txt"));
		
		String full = "";
		String fullFinal = "";
		String fullPrint = "";
		String finalFinal= "";

		try {
		String fTab = request.getParameter("textArea");
		String[] parts = fTab.split("\n");
	    List<String> itemList = Arrays.asList(parts);
		for (int n=0; n<itemList.size(); n++) {
			full = full + "GGGGGG " + itemList.get(n); 
		}	
		
		String fTab2 = full;
		String[] parts2 = fTab2.split("\t");
	    List<String> itemList2 = Arrays.asList(parts2);
		for (int x=0; x < itemList2.size(); x++) {
			fullFinal = fullFinal + " FFFFFF " + itemList2.get(x); 
		}	
		
		String fTab3 = fullFinal;
		String[] parts3 = fTab3.split("  ");
	    List<String> itemList3 = Arrays.asList(parts3);
		for (int x=0; x < itemList3.size(); x++) {
			fullPrint = fullPrint + " " + itemList3.get(x); 
		}
		String fTab4 = fullPrint;
		String[] parts4 = fTab4.split("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	    List<String> itemList4 = Arrays.asList(parts4);
		for (int x=0; x < itemList4.size(); x++) {
			finalFinal = finalFinal + " HHHHHH " + itemList4.get(x); 
		}	
		System.out.println(finalFinal);
		} catch (NullPointerException e){
			
		}

        while (dwFile.hasNext()) {
          dwArray.add(dwFile.next());
        }
	
        dwFile.close();
        System.out.println(dwArray);
        
        while (dwCustomFile.hasNext()) {
	           dwCustom.add(dwCustomFile.next());
	         }
      		 dwCustomFile.close();
	         System.out.println(dwCustom);
	    
	    try { 
        editFile.println(finalFinal.substring(24));
        editFile.close();
	    } catch (StringIndexOutOfBoundsException e) {
	    	
	    }
        
        while (readFile.hasNext()) {
     		int clean = 1;
     		String checkedText = "";
     		String text = readFile.next();
     		if (text.equals("GGGGGG")) {
     			text = "<br>";
     		} else if (text.equals("FFFFFF")) {
     			text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
     		} else if (text.equals("HHHHHH")) {
     			text = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
     		}
     		for (int n = 0; n < dwArray.size(); n++) {
     			if ((text.replaceAll("\\p{Punct}", "").toLowerCase()).equals(dwArray.get(n))) {
     				clean = 0;
     			} 
     		}
	      	for (int x = 0; x < dwCustom.size(); x++) {
     			if (text.replaceAll("\\p{Punct}", "").toLowerCase().equals(dwCustom.get(x))) {
     				clean = 2;
     			}
     		}
     		if (clean == 1) {
     			checkedText = text.replaceAll("\\s","");	
     		} else if (clean == 0) {
     			checkedText =  "<mark>" + text.replaceAll("\\s","") + "</mark>";	
     			dwCount++;
     		} else if (clean == 2) {
     			checkedText =  "<mark class=green>" + text.replaceAll("\\s","") + "</mark>";	
     			dwCount++;
     		}
       	wordArray.add(checkedText);
       	cleanText = cleanText + " " + checkedText;
       	outText = cleanText.trim();
        }
        System.out.println(wordArray);
        readFile.close();
        
        if (outText.equals("null")){
       	 outText = "Place your essay here...";
        } else {
       	 
        }
	} catch (FileNotFoundException error) {
		System.out.println("Ahh!!! Error!!!");
	}
   System.out.println(dwCount);
   
   int dwEssay = 100-2*dwCount;
   int dwMem = (30-2*dwCount)*100/30;
   String essayLetter = "N/A";
   String memLetter = "N/A";
	if (dwCount >= 50) {
		dwEssay = 0;
	}
	if (dwCount >= 15) {
		dwMem = 0;
	} 
	if (dwCount <= 5) {
		essayLetter = "A";
	} 
	if (dwCount > 5 && dwCount <= 10) {
		essayLetter = "B";
	}
	if (dwCount > 10 && dwCount <= 15) {
		essayLetter = "C";
	}
	if (dwCount > 15 && dwCount <= 20) {
		essayLetter = "D";
	}
	if (dwCount > 20) {
		essayLetter = "F";
	} 
	if (dwCount <= 1) {
		memLetter = "A";
	} 
	if (dwCount > 1 && dwCount <= 3) {
		memLetter = "B";
	} 
	if (dwCount > 3 && dwCount <= 4) {
		memLetter = "C";
	} 
	if (dwCount > 4 && dwCount <= 6) {
		memLetter = "D";
	} 
	if (dwCount > 6) {
		memLetter = "F";
	} 
		%> 
		
<body>
	<nav>
		<ul>
		<li><a href="?action=Index" class="bimg" style="background-image: url('WordCrypt_Gage/images/logo_clicked.png'); background-image: no-repeat;" ><img src="WordCrypt_Gage/images/logo_clicked.png" alt="The WordCrypt Logo" width="250" style="text-align: center; padding: 0;  opacity: 0;" ></a></li>
		<li style="float:right"><a href="?action=Contact" style="padding: 1px 14px;"><h4>Contact&nbsp;</h4></a></li>
		<li style="float:right"><a href="?action=About" style="padding: 1px 14px;"><h4>&nbsp;About&nbsp;</h4></a></li>
		<li style="float:right"><a href="?action=Info" style="padding: 1px 14px;"><h4>&nbsp;&nbsp;Info&nbsp;&nbsp;</h4></a></li>
		</ul>
	</nav>
	
	<main>
		 <br>
		<br>
		<form method=post>
		<div>
		<button class="button buttonFixed" style="float:right;" onClick="myFunction(); runScript();" >Find Dead Words</button>
		<div class="dwCounter">Deadword Count: <%=dwCount %> <br> Essay Grade &asymp; <%=dwEssay%>%, <%=essayLetter%><br> Memoir Grade &asymp; <%=dwMem%>%, <%=memLetter%></div>
		</div>
			<div class="center" style="height: auto">
	         <pre class="textarea" onkeydown="keydown1(event,this);" onclick="tabSwitch()" spellcheck="true" id=divArea contenteditable="true"  style="height: auto; min-height: 800px; width: 600px;" onkeydown="doStuff()"><%=outText%></pre></div>
	         <textarea style="visibility:hidden;" contenteditable="true"  name=textArea id=textArea > <%=outText%> </textarea>   
	    </form>	    
		<br>
		<br> 
	</main> 

</body>
<footer>
<em> WordCrypt&trade;  All rights reserved.</em>
</footer>
</html>