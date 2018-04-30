var $tbody = document.querySelector("tbody");
var $dateInput = document.querySelector("#date");
var $searchBtn = document.querySelector("#search");

$searchBtn.addEventListener("click", handleSearchButtonClick);

var filteredSightings = dataSet;

// renderTable renders the filteredSightings to the tbody
function renderTable() {
  $tbody.innerHTML = "";
  for (var i = 0; i < filteredSightings.length; i++) {
    var sighting = filteredSightings[i];
    var fields = Object.keys(sighting);


    var $row = $tbody.insertRow(i);
    for (var j = 0; j < fields.length; j++) {
      var field = fields[j];
      var $cell = $row.insertCell(j);
      $cell.innerText = sighting[field];
    }
  }
}

function handleSearchButtonClick() {
    var filterDate = $dateInput;

    filteredSightings = dataSet.filter(function(sighting) {
    var sightingDate = sighting.date;

    return sightingDate === filterDate;
  });
  renderTable();
}

// Render the table for the first time on page load
renderTable();