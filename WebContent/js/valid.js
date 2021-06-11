//判断输入内容是否为空    
function isNull(str) {
	if (str != undefined && str.length != 0 && str != 'null' && str != 'NULL' && str != "") {
		if(str.replace(/\s/g,"") == ""){
			return true;
		} else {
			return false;
		}
	} else {
		return true;
	}
}

// 判断日期类型是否为YYYY-MM-DD格式的类型
function isDate(str) {
	if (str.length != 0) {
		var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
		var r = str.match(reg);
		if (r == null) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断日期类型是否为YYYY-MM-DD hh:mm:ss格式的类型
function isDateTime(str) {
	if (str.length != 0) {
		var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
		var r = str.match(reg);
		if (r == null) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断日期类型是否为hh:mm:ss格式的类型
function isTime(str) {
	if (str.length != 0) {
		var reg = /^((20|21|22|23|[0-1]\d)\:[0-5][0-9])(\:[0-5][0-9])?$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的字符是否为英文字母
function isLetter(str) {
	if (str.length != 0) {
		var reg = /^[a-zA-Z]+$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的字符是否为整数
function isInteger(str) {
	if (str.length != 0) {
		var reg = /^[-+]?\d*$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的字符是否为双精度
function isDouble(str) {
	if (str.length != 0) {
		var reg = /^[-\+]?\d+(\.\d+)?$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的字符是否只包含数字
function isNum(str){
    if (str.length != 0) {
        var reg = /^[0-9]+$/;
        if (!reg.test(str)) {
            return false;
        } else {
            return true;
        }
    }
}

//判断输入的字符是否为:a-z,A-Z,0-9,_
function isLetterNum(str){
	if (str.length != 0) {
		var reg = /^[a-zA-Z0-9]+$/g;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}


// 判断输入的字符是否为:a-z,A-Z,0-9,_
function isString(str) {
	if (str.length != 0) {
		var reg = /^[a-zA-Z0-9_]+$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

//判断输入的密码强度
function isStrength(str) {
	if (str.length != 0) {
		var reg = /^(?!\D+$)(?=.*[A-Z])(?=.*[a-z])[0-9A-Za-z]{6,20}$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的字符是否为中文
function isChinese(str) {
	if (str.length != 0) {
		var reg = /^[\u0391-\uFFE5]+$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的EMAIL格式是否正确
function isEmail(str) {
	if (str.length != 0) {
		var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的邮编(只能为六位)是否正确
function isZip(str) {
	if (str.length != 0) {
		var reg = /^\d{6}$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 判断输入的数字不大于某个特定的数字
function maxValue(str, maxValue) {
	if (str.length != 0) {
		var reg = /^[-+]?\d*$/;
		if (!reg.test(str)) {// 判断是否为数字类型
			if (val > parseInt(maxValue)) {
				return true;
			} else {
				return false;
			}
		}
	}
}

// 判断输入的数字不小于某个特定的数字
function minValue(str, minValue) {
	if (str.length != 0) {
		var reg = /^[-+]?\d*$/;
		if (!reg.test(str)) {// 判断是否为数字类型
			if (val < parseInt(minValue)) {
				return true;
			} else {
				return false;
			}
		}
	}
}

// 判断是否是固定电话
function isTel(str) {
	if (str.length != 0) {
		var reg = /(^(\d{3,4}-)?\d{7,8})$|(13[0-9]{9})|(1[0-9]{10})/;
		if (reg.test(str)) {
			return true;
		} else {
			return false;
		}
	}
}

// 判断是否是手机号码
function isPhone(str) {
	if (str.length != 0) {
		var reg = /^1[0-9][0-9]\d{8}$/;
		if ((reg.test(str))) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

// 判断是否是邮箱
function isEmail(str) {
	if (str.length != 0) {
		var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,5}$/;
		if ((reg.test(str))) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

// 判断是否是中国邮政编码(6位)
function isZipCode(str) {
	if (str.length != 0) {
		var reg = /^[1-9][0-9]{5}$/;
		if (!reg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
}

// 匹配腾讯QQ号
function isQQ(str) {
	if (str.length != 0) {
		var reg = /[1-9][0-9]{4,}/;
		if (str.match(reg) == null) {
			return false;
		} else {
			return true;
		}
	}
}

// 匹配身份证(15位或18位)
function isIdcard(str) {
	var reg15 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
	var reg18 = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
	if (str.length != 0) {
		if (str.match(reg15) == null && str.match(reg18) == null) {
			return false;
		} else {
			return true;
		}
	}
}

// 校验统一社会信用代码
function isCreditCode(str){
	var reg = /^[^_IOZSVa-z\W]{2}\d{6}[^_IOZSVa-z\W]{10}$/;
	if(str.length != 0){
		if(str.match(reg) == null){
			return false;
		} else {
			return true;
		}
	}
}

// 校验是否为8位数字的发票号码
function isInvoiceNumber(str) {
	var reg = /^[0-9]*$/;
    if (str.length != 8) {
        return false;
    }
    if(str.length != 0) {
        if(str.match(reg) == null) {
            return false;
        } else {
            return true;
        }
    }
}

// 校验中英文的长度
function lenString(str) {
	var l = 0;
	var a = str.split("");
	for (var i=0; i<a.length; i++) {
		if (a[i].charCodeAt(0)<299) {
			l++;
		} else {
			l+=2;
		}
	 }
	 return l;
}

//截取含中文的字符串(先去掉html标签，只保留文本)
function splitString(str, len, flag) {
	if(lenString(str)>len){
		var l = 0;
		var splitLen = 0;
		str = str.replace(/<[^>].*?>/g,"");
		if(lenString(str)<=len){
			return str;
		}
		var a = str.split("");

		for (var i=0; i<a.length; i++) {
			if (a[i].charCodeAt(0)<299) {
				l++;
			} else {
				l+=2;
			}
			if(l>=len){
				splitLen = i;
				break;
			}
		}
		if(flag){
			return str.substring(0,splitLen+1);
		} else {
			return str.substring(0,splitLen+1)+"...";
		}
	} else {
		return str;
	}
}

//校验输入框是否为空
function validNull(obj, msgId, msgContent){
	var str = $(obj).val();
	if(isNull(str)){
		if(msgContent!=undefined){
			$("#"+msgId).html(msgContent);
		} else {
			$("#"+msgId).html("不能为空!");
		}
	} else {
		$("#"+msgId).html("");
	}
}

//校验输入框剩余长度
function validStringLen(obj, maxLen, msgId){
	var str = $(obj).val();
	var len = lenString(str);
	if(len==0){
		$("#"+msgId).html("");
	} else if(len<=maxLen){
		$("#"+msgId).html("还能录入"+parseInt((maxLen-len)/2)+"个汉字或"+parseInt(maxLen-len)+"个字符");
		$("#"+msgId).addClass("color-green");
		$("#"+msgId).removeClass("color-red");
	} else {
		$("#"+msgId).html("最多录入"+parseInt(maxLen/2)+"个汉字或"+maxLen+"个字符");
		$("#"+msgId).addClass("color-red");
		$("#"+msgId).removeClass("color-green");
	}
}

//格式化金额
function formatMoney(s, n){
 n = n > 0 && n <= 20 ? n : 0;
 s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
 var l = s.split(".")[0].split("").reverse();
 var r = s.split(".")[1];
 var t = "";
 for(i = 0; i < l.length; i ++ ){
	 t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
 }
   if(n > 0){
	   return t.split("").reverse().join("") + "." + r;
   } else {
	   return t.split("").reverse().join("");
   }
}

// 安全化手机号码（隐藏中间四位）
function formatPhone(str){
	if(!isPhone(str)){
		return false;
	}
	var middle = str.substr(3,4);
	str = str.replace(middle, "****");
	return str;
}

// 日期加减
function addDate(date, day){
    var d = new Date(date);
    d.setDate(d.getDate() + day);
    return getDateStr(d);
}

function getDateStr(time) {
    return formatTime(time,"yyyy-MM-dd");
}

function getTimeStr(time) {
    return formatTime(time,"yyyy-MM-dd hh:mm:ss");
}

function formatTime(time,pattern) {
    if (isNull(time + "")) {
        return '';
    }
    pattern = pattern || "yyyy-MM-dd";
    if (isDouble(Date.parse(time))) {
        return new Date(Date.parse(time)).format(pattern);
    }
    if (isDouble(time)) {
        return new Date(time).format(pattern);
    }
    return time;
}

// 日期时间格式转化
function getDateTimeStr(DateTime){
    if (isNull(DateTime + "")) {
        return '';
    }
    if (isDouble(Date.parse(DateTime))) {
        return new Date(Date.parse(DateTime)).format("yyyy-MM-dd hh:mm:ss");
    }
    if (isDouble(DateTime)) {
        return new Date(DateTime).format("yyyy-MM-dd hh:mm:ss");
    }
    return '';
}

/**
* js时间对象的格式化;
* eg:format="yyyy-MM-dd hh:mm:ss";
*/
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1,  //month   
        "d+": this.getDate(),     //day   
        "h+": this.getHours(),    //hour   
        "m+": this.getMinutes(),  //minute   
        "s+": this.getSeconds(), //second   
        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter   
        "S": this.getMilliseconds() //millisecond   
    }
    var week=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    if (/(w+)/.test(format)){
    	format = format.replace(RegExp.$1, week[this.getDay()]);
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}

/**
*js中更改日期
* y年， m月， d日， h小时， n分钟，s秒
*/
Date.prototype.DateAdd = function(strInterval, Number) {
	var dtTmp = this;
	switch (strInterval) {
		case 's' :return new Date(Date.parse(dtTmp) + (1000 * Number));
		case 'n' :return new Date(Date.parse(dtTmp) + (60000 * Number));
		case 'h' :return new Date(Date.parse(dtTmp) + (3600000 * Number));
		case 'd' :return new Date(Date.parse(dtTmp) + (86400000 * Number));
		case 'w' :return new Date(Date.parse(dtTmp) + ((86400000 * 7) * Number));
		case 'q' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number*3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
		case 'm' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
		case 'y' :return new Date((dtTmp.getFullYear() + Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
	}
}

function DateDiff(d1,d2){
	var day = 24 * 60 * 60 *1000;
	try{
		var dateArr = d1.split("-");
		var checkDate = new Date();
	    checkDate.setFullYear(dateArr[0], dateArr[1]-1, dateArr[2]);
	    var checkTime = checkDate.getTime();

	    var dateArr2 = d2.split("-");
	    var checkDate2 = new Date();
	    checkDate2.setFullYear(dateArr2[0], dateArr2[1]-1, dateArr2[2]);
	    var checkTime2 = checkDate2.getTime();

	    var cha = (checkTime - checkTime2)/day;
	    return cha;
	} catch(e){
		return false;
	}
}

/**
 *
 * @param beginTime
 * @param endTime
 * @returns {Boolean}
 * time_range ("21:30", "23:30");
 *
 */

function time_range(beginTime, endTime) {
	if(isNull(beginTime)){
		beginTime = "8:00";
	}
	if(isNull(endTime)){
		endTime = "22:00";
	}

    var strb = beginTime.split (":");
    if (strb.length != 2) {
        return false;
    }

    var stre = endTime.split (":");
    if (stre.length != 2) {
        return false;
    }

    var b = new Date ();
    var e = new Date ();
    var n = new Date ();

    b.setHours (strb[0]);
    b.setMinutes (strb[1]);
    e.setHours (stre[0]);
    e.setMinutes (stre[1]);

    if (n.getTime () - b.getTime () > 0 && n.getTime () - e.getTime () < 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * 数组去重
 */
Array.prototype.unique3 = function(){
	var res = [];
	var json = {};
	for(var i = 0; i < this.length; i++){
		if(!json[this[i]]){
			res.push(this[i]);
			json[this[i]] = 1;
		}
	}
	return res;
}

/**
 * 网址正则验证
 */
function IsURL(str_url){
    var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
        + "|" // 允许IP和DOMAIN（域名）
        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
        + "[a-z]{2,6})" // first level domain- .com or .museum
        + "(:[0-9]{1,4})?" // 端口- :80
        + "((/?)|" // a slash isn't required if there is no file name
        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    var re=new RegExp(strRegex);
    //re.test()
    if (re.test(str_url)){
        return (true);
    }else{
        return (false);
    }
}
