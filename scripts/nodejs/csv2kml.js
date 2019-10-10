require('dotenv').config();
const fs = require('fs');
const parse = require('csv-parse');
const kml = require('gtran-kml');

// Get local configuration
const {
  PROTCIVILPT_DATA_PATH,
  PROTCIVILPT_CSV_SEPARATOR
} = process.env;

// Get input date
const date = process.argv[2];

// Filenames
const inputFilename = PROTCIVILPT_DATA_PATH + date + '.csv';
const outputFilename = PROTCIVILPT_DATA_PATH + date + '.kml';

// Validate data path
if (!PROTCIVILPT_DATA_PATH && !fs.existsSync(PROTCIVILPT_DATA_PATH)) {
  console.log('Parametro PROTCIVILPT_DATA_PATH invalido');
  process.exit(1);
}

// Validate 
if (!PROTCIVILPT_CSV_SEPARATOR || PROTCIVILPT_CSV_SEPARATOR.length > 1) {
  console.log('Parametro PROTCIVILPT_CSV_SEPARATOR invalido');
  process.exit(1);
}

// Validate input file
if (!fs.existsSync(inputFilename)) {
  console.log('Ficheiro de input não existe: ' + inputFilename);
  process.exit(1);
}

// Start CSV to KML conversion
(async function() {
  const csvString = fs.readFileSync(inputFilename);
  const data = await parseCSVAsync(csvString);
  const geojson = data2geojson(data);
  const result = await geojson2kml(geojson, outputFilename);
  console.log(result);
})();

/**
 * Async function to parse CSV string
 * @param {String} csvString 
 */
async function parseCSVAsync(csvString) {
  return new Promise((resolve, reject) => {
    const output = [];
    parse(csvString, {
      trim: true,
      skip_empty_lines: true,
      delimiter: PROTCIVILPT_CSV_SEPARATOR,
      columns: true
    })
    .on('readable', function(){
      let record
      while (record = this.read()) {
        record.Latitude = parseFloat(record.Latitude.replace(',', '.'));
        record.Longitude = parseFloat(record.Longitude.replace(',', '.'));
        output.push(record);
      }
    })
    .on('end', function(){
      resolve(output);
    })
  });
}

/**
 * Converts and array of records into a GeoJSON object
 * @param {Array} data 
 */
function data2geojson(data) {
  const geojson = {
    type: 'FeatureCollection',
    features: []
  }

  // Iterate each record
  geojson.features = data.map(record => {
    return {
      'type': 'Feature',
      'geometry': { "type": "Point", "coordinates": [ record.Longitude, record.Latitude ] },
      'properties': record
    }
  });
  return geojson;
}

/**
 * Saves a KML file from a GeoJSON object
 * @param {Object} geojson 
 * @param {*} filename 
 */
async function geojson2kml(geojson, filename) {
  return kml.fromGeoJson(geojson, filename, {
    symbol: (feature) => {
      return {
        color: '#2dcd86',
        alpha: 255 * Math.random(),
        scale: 1,
        icon: 'http://maps.google.com/mapfiles/kml/shapes/square.png'
      }
    },
    name: 'Numero'
  });
}