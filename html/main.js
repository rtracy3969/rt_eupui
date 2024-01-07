var IsInEUP = false

window.addEventListener('message', function (event) {
	if (event.data.action == "openeup") {
		$("body").css("display", "block");
		IsInEUP = true;
	}
	if (event.data.action == "bcso") {
		$(".bcso").css("display", "block");
	}
    if (event.data.action == "gw") {
		$(".gw").css("display", "block");
	}
	if (event.data.action == "sast") {
		$(".sast").css("display", "block");
	}
	if (event.data.action == "lspd") {
		$(".lspd").css("display", "block");
	}
	if (event.data.action == "lspa") {
		$(".lspa").css("display", "block");
	}
	if (event.data.action == "changename") {
		$('#title').text(event.data.title);
	}
});

document.onkeydown = function(data) {
	if (data.which == 37 && IsInEUP) {
		$.post("http://scully_eupui/RotatePedLeft", JSON.stringify({}));
	}
	if (data.which == 39 && IsInEUP) {
		$.post("http://scully_eupui/RotatePedRight", JSON.stringify({}));
	}
}

function choose() {
	$("body").css("display", "none");
	$.post("http://scully_eupui/closeeup", JSON.stringify({}));
	IsInEUP = false;
}

function next() {
    $.post("http://scully_eupui/next", JSON.stringify({}));
}

function prev() {
    $.post("http://scully_eupui/prev", JSON.stringify({}));
}

function changedept1() {
    $.post("http://scully_eupui/bcso", JSON.stringify({}));
}

function changedept2() {
    $.post("http://scully_eupui/gw", JSON.stringify({}));
}

function changedept3() {
    $.post("http://scully_eupui/sast", JSON.stringify({}));
}

function changedept4() {
    $.post("http://scully_eupui/lspd", JSON.stringify({}));
}

function changedept5() {
    $.post("http://scully_eupui/lspa", JSON.stringify({}));
}