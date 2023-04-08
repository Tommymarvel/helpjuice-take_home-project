// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'channels';
import App from './channels/consumer';

//= require jquery
//= require jquery_ujs

//= require chart.js
//= require jquery
//= require jquery_ujs
//= require action_cable
//= require_tree .


// Create search count channel
const searchCountChannel = App.cable.subscriptions.create("SearchCountChannel", {
  received(data) {
    // Parse incoming data as JSON
    const searchCountData = JSON.parse(data);
    console.log(searchCountData);

    // Update all users chart
    if (searchCountData.chartType === "allUsers") {
      console.log('Initializing all users chart...');
      const allUsersChart = new Chart(document.getElementById("all-users-chart"), {
        type: "bar",
        data: {
          labels: searchCountData.labels,
          datasets: [{
            label: "Search Count",
            data: searchCountData.data,
            backgroundColor: "rgba(54, 162, 235, 0.5)",
            borderColor: "rgba(54, 162, 235, 1)",
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }

    // Update private chart
    if (searchCountData.chartType === "private") {
      const privateChart = new Chart(document.getElementById("private-chart"), {
        type: "bar",
        data: {
          labels: searchCountData.labels,
          datasets: [{
            label: "Search Count",
            data: searchCountData.data,
            backgroundColor: "rgba(255, 99, 132, 0.5)",
            borderColor: "rgba(255, 99, 132, 1)",
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    }
  }
});

// Function to update the search count charts
function updateSearchCountCharts() {
  // Get all users search count data
  $.ajax({
    url: "/search_count",
    data: { chart_type: "allUsers" },
    success: function(response) {
      const allUsersSearchCountData = JSON.parse(response);
      searchCountChannel.send(JSON.stringify(allUsersSearchCountData));
    }
  });

  // Get private search count data
  $.ajax({
    url: "/search_count",
    data: { chart_type: "private" },
    success: function(response) {
      const privateSearchCountData = JSON.parse(response);
      searchCountChannel.send(JSON.stringify(privateSearchCountData));
    }
  });
}

// Update search count charts on page load and every 5 seconds
$(document).ready(function() {
  updateSearchCountCharts();
  setInterval(updateSearchCountCharts, 5000);
});
