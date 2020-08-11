// var mysql = require("mysql");

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "Newtech21!",
// });

// con.connect(function (err) {
//   if (err) throw err;
//   console.log("Connected!");
// });

chrome.browserAction.onClicked.addListener(function (activeTab) {
  var newURL = "https://youtube.com";
  chrome.tabs.create({ url: newURL });
});
