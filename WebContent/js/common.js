// 获取URL
function getUrl() {
	var fullPath = window.location.pathname;
	if (fullPath != "/") {
		return fullPath.substring(ctxRoot.length, fullPath.length);
	} else {
		return "/";
	}
}

// 获取URL上的参数
function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

// 打开链接，参数:url-链接, isCurrentPage-是否在当前页面打开(true|false)
function openUrl(url, isNewWindow) {
	if (typeof (isNewWindow) != "undefined" && isNewWindow) {
		window.open(ctxRoot + url);
	} else {
		location.href = ctxRoot + url;
	}
}