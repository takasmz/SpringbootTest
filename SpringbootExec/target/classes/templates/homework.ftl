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
				    	<th>作业一</th>	
				    	<th>作业二</th>	
				    	<th>作业三</th>	
				    	<th>作业四</th>	
				    	<th>作业五</th>	
				    	<th>作业六</th>	
				    	<th>作业七</th>	
				    	<th>作业八</th>
				    	<th>作业九</th>	
				    	<th>作业十</th>					    
					</tr>
				</thead>
				<tbody>
					<#list homeworkstats as homework1>  
				    <tr>
				    	<td>${homework1.studentno}</td>
				    	<td>${homework1.name}</td>
				    	<td>${homework1.times[0]}</td>
				    	<td>${homework1.times[1]}</td>
				    	<td>${homework1.times[2]}</td>
				    	<td>${homework1.times[3]}</td>
				    	<td>${homework1.times[4]}</td>
				    	<td>${homework1.times[5]}</td>
				    	<td>${homework1.times[6]}</td>
				    	<td>${homework1.times[7]}</td>
				    	<td>${homework1.times[8]}</td>
				    	<td>${homework1.times[9]}</td>
					</tr>
					</#list>					
				</tbody>
			</table>
		</div>
		</div>
	</div>
	
</@defaultLayout.layout>