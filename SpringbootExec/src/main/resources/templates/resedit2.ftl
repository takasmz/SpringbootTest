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
				<form role="form" action="/submit" method="post" enctype="multipart/form-data">
					<input type="hidden" name="courseno" value="${curCourse.sn}">
					<div class="form-group">
						<label for="exampleInputEmail1">作业序号</label>
						<i class="fa fa-envelope"></i>
						<input type="text" class="form-control" name="xh">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">学生姓名</label>
						<i class="fa fa-envelope"></i>
						<input type="text" class="form-control" name="studentname">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">学号</label>
						<i class="fa fa-envelope"></i>
						<input type="text" class="form-control" name="studentno">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">上交时间</label>
						<i class="fa fa-envelope"></i>
						<input type="datetime-local" class="form-control" name="commitTime">
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