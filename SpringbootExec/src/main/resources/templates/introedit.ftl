<#-- 引入布局指令的命名空间 -->
<#import "layout.ftl" as defaultLayout>
<#-- 调用布局指令 -->
<@defaultLayout.layout>

		<div class="box border orange">
		<div class="box-title">
			<h4><i class="fa fa-hand-o-up"></i>${curCourse.caption}</h4>
			<div class="tools">
				<a href="#box-config" data-toggle="modal" class="config"><i class="fa fa-cog"></i></a>									
				<a href="javascript:;" class="reload"><i class="fa fa-refresh"></i></a>												
				<a href="javascript:;" class="collapse"><i class="fa fa-chevron-up"></i></a>
				<a href="javascript:;" class="remove"><i class="fa fa-times"></i></a>																							
			</div>
		</div>
		<div class="box-body">
		  <div class="container">
			<#assign homeUrl = html>
             <form method="post" action="/introedit">
                <div id="test-editormd">
                    <!-- Custom textarea name attribute <textarea style="display:none;" name="test-textarea-name"> -->
                    <textarea style="display:none;"></textarea>
                </div>
                <div style="width:90%;margin: 10px auto;">
                    <input type="submit" name="submit" value="提交 Submit" style="padding: 5px;" /> 
                </div>               
            </form>
        </div>        
        <script src="/components/editormd/examples/js/jquery.min.js"></script>
        <script src="/components/editormd/editormd.js"></script>   
        <script type="text/javascript">
            $(function() {
                $.get("intro.md", function(md) {
                    var testEditor = editormd("test-editormd", {
                        width  : "90%",
                        height : 640,
                        path   : "../lib/",
                        appendMarkdown : md,
                        saveHTMLToTextarea : true
                    });
                });

                //testEditor.getMarkdown();       // 获取 Markdown 源码
                //testEditor.getHTML();           // 获取 Textarea 保存的 HTML 源码
                //testEditor.getPreviewedHTML();  // 获取预览窗口里的 HTML，在开启 watch 且没有开启 saveHTMLToTextarea 时使用
            });
        </script>

          </div>
		</div>
		
	</div>
</@defaultLayout.layout>