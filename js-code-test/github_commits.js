$(document).ready(function() {
  var url =  "https://api.github.com/repos/rails/rails/commits";
  $.getJSON(url + "?callback=?", null, function(commits) {
      urls = url_array(commits)

      display = create_display_object(urls)

      for(url in display) {
          n_of_commits = display[url];
          d = dimension(n_of_commits)
          $("#content").append("<img src='"+url+" width='"+d+"' height='"+d+"' />");
      }
  });
});

var dimension = function(n) {
    base = 50;
    multiplier = n-1;
    return multiplier*10+50;
}

var create_display_object = function(urls) {
    display = {}
    for(i in urls) {
        avatar_url = urls[i]
        display[avatar_url] = 0
        // count the occurrence of this avatar_url
        for(var j=0; j<20;j++) {
          if(avatar_url == urls[j]){
              display[avatar_url]++;
          }
      }
  }
  return display
}

var url_array = function(commits) {
    var output = commits.data.slice(0,20);
    urls = [];
    for(i in output) {
      urls.push(output[i].committer.avatar_url)
  }
  return urls
}