chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
        var url = tabs[0].url;
        var re = new RegExp("http://stackoverflow.com/questions/.*/.*$");

        //document.write(url + "\n");

        if (re.test(url)) {
            document.write("yes");

            //$.ajax({ url: url, success: function(data) { alert(data); } });
            
            var tc = document.getElementsByClassName("whiteblock");
            
            document.write(tc.length);
            for (var i = 0; i < tc.length; i++) {
                document.write(tc[i] + "\n");
            }
        }

        document.write("end");
});

