<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Form get textarea value - Editor.md examples</title>
        <link rel="stylesheet" href="/components/editormd/examples/css/style.css" />
        <link rel="stylesheet" href="/components/editormd/css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>表单取值</h1>   
                <p>Form get textarea value.</p>     
            </header>
            <form method="post" action="/introedit">
                <div id="test-editormd">

                    <textarea style="display:none;" name="intro">${htmlURL}</textarea>
                </div>
                <div style="width:90%;margin: 10px auto;">
                    <input type="submit" name="submit" value="提交表单 Submit" style="padding: 5px;" /> 
                </div>               
            </form>
        </div>        
        <script src="/components/editormd/examples/js/jquery.min.js"></script>
        <script src="/components/editormd/editormd.js"></script>   
            <script type="text/javascript">
			var testEditor;

            $(function() {
                testEditor = editormd("test-editormd", {
                    width   : "90%",
                    height  : 640,
                    syncScrolling : "single",
                    path    : "../lib/"
                });             
                //testEditor.getMarkdown();       // 获取 Markdown 源码
                //testEditor.getHTML();           // 获取 Textarea 保存的 HTML 源码
                //testEditor.getPreviewedHTML();  // 获取预览窗口里的 HTML，在开启 watch 且没有开启 saveHTMLToTextarea 时使用
            });
        </script>
    </body>
</html>