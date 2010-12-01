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
})