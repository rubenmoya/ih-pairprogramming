var fs = require('fs');

function formatRating(number){

  var num = Math.trunc(number);
  var str = "";

  for (var i=0; i<num; i++){
    str += '*';
  }

  return str;
}

function sortedEpisodes(episodes){

  return episodes.sort(function(episode1, episode2){
      return episode1.episode_number - episode2.episode_number;
    });

}

function printEpisodes(episodes) {
  episodes.forEach(function(episode){
     console.log('Title: ' + episode.title);
     console.log(episode.description);
     console.log('Rating: ' + episode.rating + ' ' + formatRating(episode.rating));
     console.log('\r\n');
  });
}

function filterEpisodes(episodes) {
  return episodes.filter(function(episode) {
    return episode.rating < 8.5;
  });
}

function searchJonSnow(episodes) {
  var episodeArr = [];

  episodes.forEach(function(episode) {
    if (episode.description.indexOf('Jon Snow') >= 0) {
      episodeArr.push(episode);
    }
  });

  return episodeArr;
}

function fileActions(err, file){
  if (err) {
      throw err;
  }
  var episodes = searchJonSnow(JSON.parse(file));

  printEpisodes(episodes);

}


fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);
