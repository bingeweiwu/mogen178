<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<body>
	<jsp:include page="top.jsp" />
	<div class="page-container">
		<div class="container">
			<div class="row">

				<form class="form-horizontal" onsubmit="return check()" action="posts?action=save" method="post" >
					<input type="hidden" name="fenlei" class="input" value="2">
					<fieldset>
						<div id="legend" class="">
							<legend class="">提问</legend>
						</div>
						<div class="control-group">

							<!-- Text input-->
							<label class="control-label" for="input01">标题</label>
							<div class="controls">
								<input type="text" id="title" name="title" placeholder="请输入标题......"
									class="input">
							</div>
						</div>

						<div class="control-group">

							<!-- Textarea -->
							<label class="control-label">内容</label>
							<div class="controls">
								<div class="textarea">
									<textarea type="" class=""  id="context" name="context" rows="10"
										style="width: 99%"> </textarea>
								</div>
							</div>
						</div>

						<div class="control-group">

							<!-- Select Basic -->
							<label class="control-label">标签</label>
							<div class="controls">
								<select class="input-xlarge" id="select" name="tag">
								</select>
							</div>

						</div>
						<div class="control-group">
							<label class="control-label">提交</label>

							<!-- Button -->
							<div class="controls">
								<button class="btn btn-success">提交</button>
							</div>
						</div>

					</fieldset>
				</form>

			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp" />

	<script type="text/javascript">
		$(window).load(function() {
			loadTags();
		})

		function loadTags() {
			var url = "ajax?action=tags"; 
			$.ajax({
				url : url,
				success : function(data) {
				 	var tags= data.split('-');
				 	 $.each(tags,function(i){
				 		var content =  tags[i];
				 		if(content != "" && content != undefined && content != null){
					 	 	$("#select").append("<option value='"+(i+1)+"'>"+tags[i]+"</option>");
				 		}
				 	  });
				}
			});
		}
		
		
		function check(){
			var A=$("#title").val();  
			var B=$("#context").val(); 

			if(A==null||A==undefined||A==""){
				alert("标题不要为空");
				  return false;
			} else if(B==null||B==undefined||B==""){
				alert("内容不要为空");
				  return false;
			}  else{
		        return true;
		    }
		}
	</script>
</body>
</html>
