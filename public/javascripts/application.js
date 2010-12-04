$(function() {
  hljs.tabReplace = '    ';
	hljs.initHighlightingOnLoad();
  $("pre code").each(function(i, e) {hljs.highlightBlock(e, '    ')});
  
	if( $("#wmd-container textarea").length ) {
		
		$("#wmd-container textarea").elastic();
		
		if($("#wmd-container textarea").focus()) {
			$("#wmd-container textarea").TextAreaResizer(); 
		}
	}
	
	$("#wmd-preview").live('click', function() {
		$("pre code").each(function(i, e) {hljs.highlightBlock(e, '    ')});
	});
	
  editPost = function() {
   var title = $("input#post_title").val();
   
   $("#post-wrapper h2.post_header a").text(title);
   
   //1st: Removes all non alphanumeric characters from the string.
   //2nd: No more than one of the separator in a row.
   //3rd: Remove leading/trailing separator.
   var url = "/publish_date/"+title.replace(/[^a-zA-Z0-9]+/g, "-").replace(/-{2,}/g, "-").replace(/^-|-$/g, "").toLowerCase();
   
   $("#title-container").text(url);
  }
	
	$("#post_title").live("keyup", function(event) {
    editPost();
	});
})