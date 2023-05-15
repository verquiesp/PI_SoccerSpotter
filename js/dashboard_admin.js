const dataDiv = document.getElementById("tableBody");
const apiUrl = "https://v3.football.api-sports.io/players/topscorers";
const apiKey = "eef2e35318525c99cb43985ea590af22";
const season = "2018";
const league = "61";

const headers = {
  "x-rapidapi-host": "v3.football.api-sports.io",
  "x-rapidapi-key": apiKey,
};

const url = new URL(apiUrl);
url.searchParams.append("season", season);
url.searchParams.append("league", league);

fetch(url, {
  method: "GET",
  headers: headers,
})
  .then((response) => response.json())
  .then((response) => {
    const tableData = response.response.map((playerData) => {
      const player = playerData.player;
      const team = playerData.statistics[0].team;
      const goals = playerData.statistics[0].goals.total;
      const assists = playerData.statistics[0].goals.assists;
      const photoUrl = player.photo;

      return [photoUrl, player.name, team.name, goals, assists];
    });

    const dataTable = $("#playerTable").DataTable({
      data: tableData,
      columns: [
        {
          title: "Photo",
          render: function (data) {
            return '<img src="' + data + '" width="50" height="50">';
          },
        },
        { title: "Player" },
        { title: "Team" },
        { title: "Goals" },
        { title: "Assists" },
      ],
      responsive: true,
      pagingType: "simple_numbers",
      lengthMenu: [5, 10, 15],
    });
  })
  .catch((err) => {
    console.log(err);
  });
