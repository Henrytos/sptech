// base case -> is size 0 or 1 element
// recursive case -> as long as you have subdivision in the array

function sort(animes) {
  if (animes.length <= 1) return animes;

  let minorAnimesPoints = [];
  let majorAnimesPoints = [];

  let positionMedium = Math.floor(animes.length / 2);
  let comparisonAnimes = animes[positionMedium];

  for (let position = 0; position < animes.length; position++) {
    let anime = animes[position];

    if (position == positionMedium) continue;

    if (anime.points <= comparisonAnimes.points) minorAnimesPoints.push(anime);
    else majorAnimesPoints.push(anime);
  }

  return [...sort(minorAnimesPoints), comparisonAnimes, ...sort(majorAnimesPoints)];
}

const animes = [
  {
    title: "Shingeki no Kyojin Season 3 Part 2",
    image_url: "https://cdn.myanimelist.net/images/anime/1517/100633l.jpg",
    anime_id: 38524,
    gender: "Action",
    target_audience: "Shounen",
    points: 10
  },
  {
    title: "Gintama. Shirogane no Tamashii-hen - Kouhan-sen",
    image_url: "https://cdn.myanimelist.net/images/anime/1776/96566l.jpg",
    anime_id: 37491,
    gender: "Action",
    target_audience: "Shounen",
    points: 102
  },
  {
    title: "Monster",
    image_url: "https://cdn.myanimelist.net/images/anime/10/18793l.jpg",
    anime_id: 19,
    gender: "Drama",
    target_audience: "Seinen",
    points: 130
  },
  {
    title: "Gintama.",
    image_url: "https://cdn.myanimelist.net/images/anime/3/83528l.jpg",
    anime_id: 34096,
    gender: "Action",
    target_audience: "Shounen",
    points: 210
  },
  {
    title: "Gintama",
    image_url: "https://cdn.myanimelist.net/images/anime/10/73274l.jpg",
    anime_id: 918,
    gender: "Action",
    target_audience: "Shounen",
    points: 103
  }
];
const animesOrder = sort(animes);

console.log({
  animes,
  animesOrder,
});
