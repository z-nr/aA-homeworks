console.log('Hello from the JavaScript console!');


$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  success: function (weatherData) {
    console.log(weatherData);
  },
});

console.log('this code is written after the ajax request');
