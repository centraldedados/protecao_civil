# 🚨 Dados da Autoridade Nacional da Proteção Civil  

Ver [README.md](../../README.md) na raiz

## Requerimento: NodeJS
Ver [NodeJS](https://nodejs.org)

### Como utilizar
```shell
$ cd scripts/nodejs
$ npm install
$ cp .env.example .env
$ nano .env # Editar configuração de download
$ npm run start
```

### Converter ficheiros CSV diários em KML
```shell
$ cd scripts/nodejs
$ node csv2kml 2019-01-01 # Passar a data como parametro; Termina com exit(0) no caso de sucesso
```
