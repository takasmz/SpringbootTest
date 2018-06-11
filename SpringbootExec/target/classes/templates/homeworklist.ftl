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
				    	<th>学号</th>	
				    	<th>姓名</th>
				    	<th>一 </th>
				    	<th>二</th>				    
					</tr>
				</thead>
				<tbody>
					<#list homeworkListStats as homeworkListStat>  
				    <tr>
				    	<td>${homeworkListStat.sno}</td>
				    	<td>${homeworkListStat.name}</td>
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
					</tr>
					</#list>					
				</tbody>
			</table>
		</div>
	</div>
</@defaultLayout.layout>