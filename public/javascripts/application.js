$(function() {
  hljs.tabReplace = '    ';
	hljs.initHighlightingOnLoad();
  $("pre code").each(function(i, e) {hljs.highlightBlock(e, '    ')});
})