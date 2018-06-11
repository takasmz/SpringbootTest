package com.springbootexec.Tools;

import java.io.FileReader;
import java.io.IOException;
import org.pegdown.PegDownProcessor;
/**
 * markdown文件转html格式
 * 可以使用：Pegdown
 * @author zhengjie
 *
 */
public class MarkdownToHtml { 

	/*
	public static void main(String args[]) throws IOException{
		System.out.println(get("intro.md"));
	}
	/
	 * 
	 */
    public  String get(String md) throws IOException{
        //java.io.InputStream in = this.getClass().getResourceAsStream("markdown.md");
        FileReader r = new FileReader(md);
        char[] cbuf = new char[9999];
        String html= null;
        while( r.read(cbuf) != -1){
        	html = new String(cbuf);
        }
        PegDownProcessor pdp = new PegDownProcessor(Integer.MAX_VALUE);
        html = pdp.markdownToHtml(html);
        System.out.println(html.substring(0, 10));
        return html;
    }
    
    public  String getmd(String md) throws IOException{
        //java.io.InputStream in = this.getClass().getResourceAsStream("markdown.md");
        FileReader r = new FileReader(md);
        char[] cbuf = new char[9999];
        String html= null;
        while( r.read(cbuf) != -1){
        	html = new String(cbuf);
        }
        
        return html;
    }
}
