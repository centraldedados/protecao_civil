# Dados da Autoridade Nacional da Proteção Civil  

fonte: [website](http://www.prociv.pt/) da Autoridade Nacional da Proteção Civil

### Como utilizar
1. Configurar o intervalo de datas pretendido no ficheiro de configuração ```config.rb```  
2. Executar ```make export``` 

Na pasta ```data``` são guardados os ficheiros exportados.  
Por omissão é um ficheiro um cada dia de ocorrências.


### Notas
O website da ANPC está desenvolvido em Angular, [lançado em Julho/2016](https://www.publico.pt/2016/07/29/sociedade/noticia/novo-site-da-proteccao-civil-gerir-ou-disponibilizar-informacao-1739727).
Exportação em XLSX, CSV e KMZ.  
Só permite a exportação directa no UI até um máximo de 7 dias de intervalo.  

**Endpoint para exportação do dia**
```
http://www.prociv.pt/en-US/Pages/export.aspx?ex=1&l=0&d=&c=&f=&t=0&n=0&e=0
```  

**Endpoint para exportação de histórico (intervalo máximo de 7 dias)**
```
http://www.prociv.pt/pt-PT/Paginas/export.aspx?ex=1&l=1&d=&n=&s=&f=&e=
```   

| Parámetro | Descrição |
| -------- | --------- |
| ex | boolean, sempre verdadeiro para exportação |
| l | boolean, se verdadeiro é obrigatório colocar um intervalo de datas, caso contrário exporta o dia corrente.  |
| d | distrito (ver tabela, deixar sem Id para todos os distritos) |
| n | código da natureza da ocorrência (ver tabela, deixar sem Id para todas as naturezas de ocorrência) |
| s | data início (ex: 2017.01.01) |
| f | data final (ex: 2017.01.07) |
| e | tipo de exportação (XLSX: 0, CSV: 1, KMZ: 2) |

#### Colunas dos ficheiros XLSX e CSV
| Nome | Descrição |
| ---- | --------- |
| Numero | |
| DataOcorrencia | |
| DataFechoOperacional | |
| Natureza | |
| EstadoOcorrencia | |
| Distrito | |
| Concelho | |
| Freguesia | |
| Localidade | |
| Latitude | |
| Longitude | |
| NumeroMeiosTerrestresEnvolvidos | |
| NumeroOperacionaisTerrestresEnvolvidos | |
| NumeroMeiosAereosEnvolvidos | |
| NumeroOperacionaisAereosEnvolvidos | |

#### Distritos
Listagem de distritos e respectivos códigos

| Id | Distrito |
|----|----------|
| 1 | Aveiro |
| 2 | Beja |
| 3 | Braga |
| 4 | Bragança |
| 5 | Castelo Branco |
| 6 | Coimbra |
| 8 | Évora |
| 9 | Faro |
| 10 | Guarda |
| 11 | Leiria |
| 12 | Lisboa |
| 13 | Portalegre |
| 14 | Porto |
| 15 | Santarém |
| 16 | Setúbal |
| 17 | Viana do Castelo |
| 18 | Vila Real |
| 19 | Viseu |

#### Natureza de Ocorrências
Listagem da natureza de Ocorrências e respectivos códigos

| Id | Natureza |
|----|----------|
|196 | Acidentes / Abalroamento aquático|
|190 | Acidentes / Abalroamento ferroviário|
|188 | Acidentes / Acidente Aéreo|
|186 | Acidentes / Acidentes com veículos fora de estrada|
|193 | Acidentes / Afundamento ou adornamento|
|189 | Acidentes / Atropelamento ferroviário|
|184 | Acidentes / Atropelamento rodoviário|
|191 | Acidentes / Choque entre veículos ou composições ferroviárias|
|195 | Acidentes / Colisão Aquática|
|185 | Acidentes / Colisão rodoviária|
|192 | Acidentes / Descarrilamento ferroviário|
|187 | Acidentes / Despiste|
|194 | Acidentes / Encalhe|
|293 | Acidentes / Transporte Suspenso|
|199 | Acidentes industriais e tecnológicos / Biológicos, dentro de uma instalação|
|202 | Acidentes industriais e tecnológicos / Biológicos, em trânsito|
|203 | Acidentes industriais e tecnológicos / Fuga de Gás em conduta|
|204 | Acidentes industriais e tecnológicos / Fuga de Gás em garrafa|
|205 | Acidentes industriais e tecnológicos / Fuga de Gás em reservatório|
|206 | Acidentes industriais e tecnológicos / Queda de Satélite|
|198 | Acidentes industriais e tecnológicos / Químicos, dentro de uma instalação|
|201 | Acidentes industriais e tecnológicos / Químicos, em trânsito|
|197 | Acidentes industriais e tecnológicos / Radiológicos, dentro de uma instalação|
|200 | Acidentes industriais e tecnológicos / Radiológicos, em trânsito|
|261 | Assistência e Prevenção a actividades humanas / Abastecimento de Água a entidades privadas|
|260 | Assistência e Prevenção a actividades humanas / Abastecimento de Água a entidades públicas|
|259 | Assistência e Prevenção a actividades humanas / Abastecimento de Água à População|
|264 | Assistência e Prevenção a actividades humanas / Abertura de Elevadores|
|262 | Assistência e Prevenção a actividades humanas / Abertura de porta com socorro|
|263 | Assistência e Prevenção a actividades humanas / Abertura de porta sem socorro|
|272 | Assistência e Prevenção a actividades humanas / Acompanhamento de Transportes|
|258 | Assistência e Prevenção a actividades humanas / Apoio psicossocial|
|257 | Assistência e Prevenção a actividades humanas / Assistência à população e Apoio Social|
|270 | Assistência e Prevenção a actividades humanas / Busca e Resgate Aquático, de Animais|
|268 | Assistência e Prevenção a actividades humanas / Busca e Resgate Aquático, de Pessoas|
|269 | Assistência e Prevenção a actividades humanas / Busca e Resgate Terrestre, de Animais|
|267 | Assistência e Prevenção a actividades humanas / Busca e Resgate Terrestre, de Pessoas|
|273 | Assistência e Prevenção a actividades humanas / Corte ou Remoção de elementos em perigo de queda|
|266 | Assistência e Prevenção a actividades humanas / Evacuação|
|256 | Assistência e Prevenção a actividades humanas / Limpeza de Via e Sinalização de Perigo|
|254 | Assistência e Prevenção a actividades humanas / Patrulhamento, Reconhecimento e Vigilância|
|255 | Assistência e Prevenção a actividades humanas / Prevenção a actividades de lazer|
|271 | Assistência e Prevenção a actividades humanas / Prevenção a Queimadas|
|265 | Assistência e Prevenção a actividades humanas / Reboque e Desempanagem|
|240 | Assistência em Saúde / Afogamento|
|235 | Assistência em Saúde / Doença|
|241 | Assistência em Saúde / Evacuação e Transporte médico aéreo|
|234 | Assistência em Saúde / Intoxicação|
|239 | Assistência em Saúde / Pré-Afogamento|
|237 | Assistência em Saúde / Queimadura|
|238 | Assistência em Saúde / Trabalho de Parto|
|245 | Assistência em Saúde / Transporte de Doentes entre Unidades de Saúde|
|242 | Assistência em Saúde / Transporte de orgãos para transplante|
|244 | Assistência em Saúde / Transporte Extra SIEM|
|243 | Assistência em Saúde / Transporte Regular de Doentes|
|236 | Assistência em Saúde / Trauma|
|230 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Colapso de galerias e cavidades artificiais|
|216 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Corte de abastecimento de água|
|218 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Corte de abastecimento de gás|
|217 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Corte de abastecimento eléctrico|
|228 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Dano em oleodutos e gasodutos|
|226 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Dano em redes de abastecimento de água|
|227 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Dano em redes de abastecimento de gás|
|225 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Dano ou Queda de redes de fornecimento eléctrico|
|219 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Desabamento de estruturas edificadas|
|224 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Desentupimento / Tamponamento|
|222 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Inundação de estruturas ou superfícies por precipitação intensa|
|223 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Inundação de estruturas por água canalizada|
|221 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Movimento de massa|
|215 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Queda de Árvore|
|220 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Queda de elementos de construção em estruturas edificadas|
|229 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Queda de estruturas temporárias ou móveis|
|233 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Queda de projectil comandado|
|231 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Ruptura de Barragens|
|232 | Comprometimento total ou parcial de segurança, serviços ou estruturas / Sabotagem a estruturas críticas|
|288 | Estados de Alerta / Estado de Alerta Especial Nível Amarelo (Estado de Alerta - nivel 2*)|
|287 | Estados de Alerta / Estado de Alerta Especial Nível Azul (Estado de Alerta - nivel 1*)|
|289 | Estados de Alerta / Estado de Alerta Especial Nível Laranja (Estado de Alerta - nivel 3*)|
|290 | Estados de Alerta / Estado de Alerta Especial Nível Vermelho (Estado de Alerta - nivel 4*)|
|291 | Estados de Alerta / Situação Crítica|
|161 | Fenómenos Naturais / Actividade Vulcânica|
|151 | Fenómenos Naturais / Cheia|
|160 | Fenómenos Naturais / Colapso de cavidades suberrâneas naturais|
|292 | Fenómenos Naturais / Enxurrada/Aluvião|
|159 | Fenómenos Naturais / Erosão costeira|
|158 | Fenómenos Naturais / Inundação por galgamento costeiro|
|154 | Fenómenos Naturais / Nevões|
|155 | Fenómenos Naturais / Ondas de calor|
|156 | Fenómenos Naturais / Ondas de frio|
|162 | Fenómenos Naturais / Queda de Meteorito|
|157 | Fenómenos Naturais / Secas|
|153 | Fenómenos Naturais / Sismo|
|152 | Fenómenos Naturais / Ventos fortes|
|214 | Incêndios em Detritos / Detritos confinados|
|213 | Incêndios em Detritos / Detritos não confinados|
|178 | Incêndios em Equipamento e Produtos / Equipamentos|
|179 | Incêndios em Equipamento e Produtos / Produtos|
|181 | Incêndios em Transportes / Aéreo|
|183 | Incêndios em Transportes / Aquático|
|182 | Incêndios em Transportes / Ferroviário|
|180 | Incêndios em Transportes / Rodoviário|
|209 | Incêndios Rurais / Agrícola|
|210 | Incêndios Rurais / Consolidação de Rescaldo|
|211 | Incêndios Rurais / Gestão de Combustível|
|208 | Incêndios Rurais / Mato|
|207 | Incêndios Rurais / Povoamento Florestal|
|212 | Incêndios Rurais / Queima|
|171 | Incêndios Urbanos ou em Área Urbanizável / Áreas Comerciais e Gares de Transportes|
|174 | Incêndios Urbanos ou em Área Urbanizável / Bibliotecas e Arquivos|
|172 | Incêndios Urbanos ou em Área Urbanizável / Desporto e Lazer|
|177 | Incêndios Urbanos ou em Área Urbanizável / Edifícios degradados ou devolutos|
|169 | Incêndios Urbanos ou em Área Urbanizável / Espectáculos e Reuniões Públicas|
|164 | Incêndios Urbanos ou em Área Urbanizável / Estacionamento de superfície|
|165 | Incêndios Urbanos ou em Área Urbanizável / Estacionamento em profundidade ou silo|
|163 | Incêndios Urbanos ou em Área Urbanizável / Habitacional|
|168 | Incêndios Urbanos ou em Área Urbanizável / Hospitalares e Lares de Idosos|
|170 | Incêndios Urbanos ou em Área Urbanizável / Hotelaria e Restauração|
|176 | Incêndios Urbanos ou em Área Urbanizável / Indústria, Oficina e Armazém|
|175 | Incêndios Urbanos ou em Área Urbanizável / Militar, Forças de Segurança e Forças de Socorro|
|173 | Incêndios Urbanos ou em Área Urbanizável / Museus e Galerias de Arte|
|167 | Incêndios Urbanos ou em Área Urbanizável / Parque Escolar|
|166 | Incêndios Urbanos ou em Área Urbanizável / Serviços Administrativos|
|248 | Intervenção em conflitos legais / Agressão/Violação|
|246 | Intervenção em conflitos legais / Ameaça de explosão|
|253 | Intervenção em conflitos legais / Apoio às Forças de Segurança|
|247 | Intervenção em conflitos legais / Explosão|
|251 | Intervenção em conflitos legais / Motim|
|252 | Intervenção em conflitos legais / Remoção e/ou Transporte de cadáver|
|250 | Intervenção em conflitos legais / Suicídio/Homicídio consumado|
|249 | Intervenção em conflitos legais / Suicídio/Homicídio na forma tentada|
|277 | Operações / Deslocações em Formação|
|279 | Operações / Deslocações em Serviço Geral|
|278 | Operações / Deslocações Oficiais|
|276 | Operações / Exercício ou Simulacro|
|283 | Operações / Missões Internacionais de Assistência|
|282 | Operações / Missões Internacionais em Socorro|
|281 | Operações / Operações Nacionais de Assistência|
|280 | Operações / Operações Nacionais de Socorro|
|274 | Operações / Pré-posicionamento de Meios|
|275 | Operações / Pré-posicionamento de Meios DECIF|
|284 | Operações / Reconhecimento Aéreo|
|285 | Operações / Rendição de Meios|
|286 | Operações / Reposicionamento de Meios Aéreos|



