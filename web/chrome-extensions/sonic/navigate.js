chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
        var url = tabs[0].url;
        var re = new RegExp("http://stackoverflow.com/questions/.*/.*$");

        //var tc = document.getElementById("hej");
        //document.write(tc + "\n");
        
        if (re.test(url)) {
            document.write("stackoverflow\n");
        }

        document.write("(end)");
});

