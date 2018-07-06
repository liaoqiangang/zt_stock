/**
 * 自定义验证
 */
(function($){
	if ($.validator) {
		//起始于结束值比较
		$.validator.addMethod("greater", function(value, element,param) {
			var preValue = $("#"+param).val();
			preValue = parseFloat(preValue) || 0;
			value = parseFloat(value) || 0;
			var preUnit = $("#"+param).next("select");
			if(preUnit && preUnit.length>0){
				preValue = preValue * parseInt(preUnit.val());
			}
			var commUnit = $(element).next("select");
			if(preUnit && preUnit.length>0 && commUnit && commUnit.length>0){
				value = value * parseInt(commUnit.val());
			}
	        return this.optional(element) || value >= preValue;
	        }, "不能大于起始值");
	}

})(jQuery);