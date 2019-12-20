function Clear(){
	$(".option").remove();
}

function OnCreate(name, id) {
	$("#ui").attr('ui_id', id);
	$("#title").text(name);
	$('body').css('display', 'block');
}


function InsertOption(id, title, description, button_text){
	var aID = "id_" + ($(".option").length);
	$(".container").append('<div class="option"><div class="optionTitle"><h1>'+title+'</h1><div><label>'+description+'</label></div></div><div class="optionButton"><div onclick="OnOptionClick(this)" option="'+id+'" id="optionBtn" class="optionBtn '+aID+'"><h1>'+button_text+'</h1></div></div></div>');
	
	$("." + aID).data("option",id);
}

function InsertText(id, text) {
	$(".container").append('<div class="text-container"><p>' + text + '</p></div>');
}


function OnOptionClick(e){
	var id 		= $("#ui").attr('ui_id');
	var option  = $(e).data("option");
	
	CallEvent("CUI:OptionPressed", id, option);
	playClick();
}

function playClick(){
	var audio = new Audio('http://asset/createui/utils/click.wav');
	audio.play();
}



(function(obj)
	{
		ue.game = {};
		ue.game.callevent = function(name, ...args)
		{
			if (typeof name != "string") {
				return;
			}

			if (args.length == 0) {
				obj.callevent(name, "")
			}
			else {
				let params = []
				for (let i = 0; i < args.length; i++) {
					params[i] = args[i];
				}
				obj.callevent(name, JSON.stringify(params));
			}
		};
	})(ue.game);
CallEvent = ue.game.callevent;
