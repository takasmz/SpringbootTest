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
				    	<th>上交时间</th>
				    	<th>学生名</th>				    
					</tr>
				</thead>
				<tbody>
					<#list homework as homework1>  
				    <tr>
				    	<td>${homework1.xh}</td>
				    	<td>${homework1.commitTime}</td>
				    	<td>${homework1.studentname}</td>
					</tr>
					</#list>					
				</tbody>
			</table>
		</div>
		</div>
	</div>
	
</@defaultLayout.layout>