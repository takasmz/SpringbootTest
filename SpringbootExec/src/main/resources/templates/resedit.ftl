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
			<table class="table table-hover">
				<thead>
				    <tr>
				    	<th>序号</th>	
				    	<th>标题</th>
				    	<th>详细描述 </th>
				    	<th>实验资源</th>	
				    	<th>资源</th>
				    	<th>#</th>		    
					</tr>
				</thead>
				<tbody>
				  <#list courseResources as courseResource>  
				    <tr>
				    	<td>${courseResource.xh}</td>
				    	<td>${courseResource.title}</td>
				    	<td>${courseResource.description}</td>
				    	<td>
				    		<#if courseResource.pptFilename?? && courseResource.pptFilename!="">
				    			<a href="/contents/${curCourse.path}/download/${courseResource.pptFilename}">
									<img src="/images/ppt.png"></img>
								</a>
				    		</#if>
				    		<#if courseResource.planFilename?? && courseResource.planFilename!="">
				    			<a href="/contents/${curCourse.path}/download/${courseResource.planFilename}">
									<img src="/images/ppt.png"></img>
								</a>
				    		</#if>
				    		<#if courseResource.videoFilename?? && courseResource.videoFilename!="">
				    			<a href="/contents/${curCourse.path}/download/${courseResource.videoFilename}">
									<img src="/images/ppt.png"></img>
								</a>
				    		</#if>
				    	</td>
				    	<td>
				    		<#if courseResource.pptFilename?? && courseResource.pptFilename!="">
				    			<a href="/contents/${curCourse.path}/download/${courseResource.pptFilename}">
									<img src="/images/ppt.png"></img>
								</a>
				    		</#if>
				    		<#if courseResource.planFilename?? && courseResource.planFilename!="">
				    			<a href="/contents/${curCourse.path}/download/${courseResource.planFilename}">
									<img src="/images/ppt.png"></img>
								</a>
				    		</#if>
				    		<#if courseResource.videoFilename?? && courseResource.videoFilename!="">
				    			<a href="/contents/${curCourse.path}/download/${courseResource.videoFilename}">
									<img src="/images/ppt.png"></img>
								</a>
				    		</#if>
				    	</td>
				    	<td>
				    		<a href="/resdelete?sn=${curCourse.sn}&resxh=${courseResource.xh}">
									<img src="/images/delete.png"></img>
						    </a>
				    	</td>
					</tr>
					</#list>
				</tbody>
			</table>
			<tr height="160px">  
            <td colspan="4" align="center">
                <!--
                pageShow 总页数, 当前页, 请求服务地址, 页面大小默认15, 显示最多分页个数, 请求服务地址参数默认为p, 分页样式（可选：gray（默认）、orange、blue）
                -->
                <#import "pageShow.ftl" as page>
                <@page.pageShow _totalPageNum=totalsize  _currentPageNo=pagenumber  _pageName="resedit"  _pageSize=15  _styleClassName="gray"/><br/>
            </td>  
        </tr>  
			
			<div class="container">
				<form role="form" action="/resupdate" method="post" enctype="multipart/form-data">
					<input type="hidden" name="courseno" value="${curCourse.sn}">
					<div class="form-group">
						<label for="exampleInputEmail1">序号</label>
						<i class="fa fa-envelope"></i>
						<input type="text" class="form-control" name="xh">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">标题</label>
						<i class="fa fa-envelope"></i>
						<input type="text" class="form-control" name="title">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">描述</label>
						<i class="fa fa-envelope"></i>
						<input type="text" class="form-control" name="description">
					</div>
					<div class="form-group">
					 <input type="radio"  name="restype" value="ppt">课件资源</input>
					 <input type="radio"  name="restype" value="plan">教案资源</input>
					 <input type="radio"  name="restype" value="video">视频资源</input>
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">文件上传</label>
						<i class="fa fa-envelope"></i>
						<input type="file" class="form-control" name="file">
					</div>
					
					<div class="form-actions">						
						<button type="submit" class="btn btn-danger">提交</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</@defaultLayout.layout>