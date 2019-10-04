require('dotenv').config();
const fs = require('fs');
const request = require('request');
const moment = require('moment');

// Get local configuration
const {
  PROTCIVILPT_SLEEP_INTERVAL,
  PROTCIVILPT_EXPORT_FORMAT,
  PROTCIVILPT_DISTRICT_ID,
  PROTCIVILPT_OCCURRENCE_ID,
  PROTCIVILPT_EXPORT_START_DATE,
  PROTCIVILPT_EXPORT_END_DATE,
  PROTCIVILPT_DATA_PATH
} = process.env;

// Export formats
const export_formats = {
  "xlsx": 0,
  "csv": 1,
  "kmz": 2
}

// Sleep interval
const sleep_interval = parseFloat(PROTCIVILPT_SLEEP_INTERVAL) || 2;

// Check for configuration errors
// Check if export format is correct
if (!export_formats[PROTCIVILPT_EXPORT_FORMAT]) {
  console.log("Formato de exportação inexistente. Verifique a configuração.");
  process.exit(1)
}

// Check for export dates interval >= 7 days
const start_date = moment(PROTCIVILPT_EXPORT_START_DATE);
const end_date = moment(PROTCIVILPT_EXPORT_END_DATE);
if ( start_date.diff(end_date, 'days') > 7 ) {
  console.log("Intervalo de datas a exportar não pode ser superior a 7 dias.");
  process.exit(1)
}

// URL request parameters
const ex = 1;
const l = 1;
const d = PROTCIVILPT_DISTRICT_ID;
const n = PROTCIVILPT_OCCURRENCE_ID;
const s = PROTCIVILPT_EXPORT_START_DATE;
const f = PROTCIVILPT_EXPORT_END_DATE;
const e = export_formats[PROTCIVILPT_EXPORT_FORMAT];

// Write file helper
function write_file(file, content) {
  fs.writeFileSync(file, content, 'utf8');
}

// Setup all the dates we want
const current_date = moment(PROTCIVILPT_EXPORT_START_DATE)
date_range = [] // Array with dates to download
while (current_date <= end_date) { // Creates array of dates with the start_date and end_date
  date_range.push(current_date.clone());
  current_date.add(1, 'day');
}

// Helper sleep
console.log(`Tempo de espera entre pedidos: ${PROTCIVILPT_SLEEP_INTERVAL} segundos`);
const sleep = async (delay) => await (new Promise((res, rej) => setTimeout(res, delay * 1000)));

// Helper async request
const asyncRequest = async (options) => {
  return new Promise((resolve, reject) => {
    request(options, (error, response, body) => {
      if (error) reject(error);
      resolve(body);
    });
  });
}

// Get data by date
const download = async (start, end) => {
  let date = start.format('YYYY.MM.DD');
  let options = {
    url: `http://www.prociv.pt/pt-PT/Paginas/export.aspx?ex=${ex}&l=${l}&d=${d}&n=${n}&s=${date}&f=${date}&e=${e}`,
    headers: { "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:42.0) Gecko/20100101 Firefox/42.0" },
    encoding: 'latin1' // IS NOT UTF8!!!
  }
  console.log(`A pedir as ocorrências de ${date} em ${options.url}...`);
  let response = await asyncRequest(options);

  // Setup filename and extension to keep
  const filename_extension = PROTCIVILPT_EXPORT_FORMAT;
  const file = `${PROTCIVILPT_DATA_PATH}${start.format('YYYY-MM-DD')}.${filename_extension}`

  console.log(`A guardar ficheiro ${file}...`);
  fs.writeFileSync(file, response);
}

// Iterate over dates
(async function() {
  for (let index = 0; index <= date_range.length - 1; index++) {
    let date = date_range[index];
    await download(date, date);
    await sleep(sleep_interval);
  }

  console.log("Recolha de dados finalizada.");
})();
