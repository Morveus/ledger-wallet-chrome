function ISO7064Mod97_10Check() {};

ISO7064Mod97_10Check.encode = function (str) {
  var c = this.computeCheck(str);
  if (c == 0) {
    return str + "00";
  } else if (c < 10) {
    return str + "0" + c;
  } else {
    return str + c;
  }
}

ISO7064Mod97_10Check.verify = function (str) {
  //return parseInt(str, 10) % 97 == 1;
  var check = 0;
  for (var i = 0; i < str.length -1; ++i) {
    var ch = str.charCodeAt(i) - 48;
    if (ch < 0 || ch > 9) return false;
    check = ((check + ch) * 10) % 97;
  }
  check += str.charCodeAt(str.length -1) - 48;
  return (check % 97) == 1;
  
}

ISO7064Mod97_10Check.computeCheck = function (str) {
  // We could do this... but JS has limited integer precision (53 bits not 64)
  // (98 - (parseInt(str, 10)* 100) % 97) % 97
  // Use Homer's Rule instead.
  var check = 0;
  for (var i = 0; i < str.length; ++i) {
    var ch = str.charCodeAt(i) - 48;
    check = ((check + ch) * 10) % 97;
  }
  return (98 - ((check*10) % 97)) % 97;
}

ISO7064Mod97_10Check.check = function(str) {
	keyData 	= ISO7064Mod97_10Check.getData(str);
	checkEncode = ISO7064Mod97_10Check.encode(keyData);

	console.log(keyData);
	console.log(checkEncode);

	return (str == checkEncode);
}

ISO7064Mod97_10Check.getCheckDigit = function (str) {
  return parseInt(str.substring(str.length-2));
}

ISO7064Mod97_10Check.getData = function (str) {
  return str.substring(0, str.length - 2);
}