$(document).ready(function(){
});

//이미지 미리보기
$("#").change(function(){
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(300);        
	    }
	    reader.readAsDataURL(this.files[0]);
});
//subCategory설정
function SubCategory(category){

	var category = category.value;
	var sub = new Array();
	sub[1] = new Array('Weapon','AR','SMG','SG','DMR','SR');
	sub[2] = new Array('Bullet','5.56mm','7.62mm','9mm');
	sub[3] = new Array('Armor','Helmet','Jacket','Backpack');
	var target = document.getElementById("subCategory");
	
	target.options.length = 0;
	
	for(var i=0; i<sub[category].length; i++){
		var option = document.createElement("option");
		option.value = i+1;
		option.innerHTML = sub[category][i];
		target.appendChild(option);	
	}
}
