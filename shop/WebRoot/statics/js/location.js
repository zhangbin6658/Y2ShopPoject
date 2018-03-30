$("#province").change(function(){
	var province = $("#province").val();
	if(province !=null && province !=""){
		$.ajax({
			type:post,
			url:,
			data:{},
			success:function(){}
		});
	}
	
});

$("#county").change(function(){
	var county = $("#county").val();
	if(county !=null && county !=""){
		$.ajax({
			type:post,
			url:,
			data:{},
			success:function(){}
		});
	}
});