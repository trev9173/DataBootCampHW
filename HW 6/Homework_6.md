
# Import dependencies


```python
import random 
import json
import pandas as pd
import csv
import requests as req
import matplotlib.pyplot as plt
from citipy import citipy
```

# Generate list of random cities


```python
citys = []

for x in range(5050):
    rand_long = random.uniform(-90,90)
    rand_lat = random.uniform(-180,180)

    city = citipy.nearest_city(rand_long,rand_lat)
    city = city.city_name
    citys.append(city)
citys

clean_cities = []
[clean_cities.append(x) for x in citys if x not in clean_cities]

clean_cities

    
```




    ['rikitea',
     'tiksi',
     'tasbuget',
     'east london',
     'saryshagan',
     'lebu',
     'bethel',
     'barentsburg',
     'vaitupu',
     'albany',
     'ushuaia',
     'cape town',
     'nizhneyansk',
     'pevek',
     'namibe',
     'lavrentiya',
     'hobart',
     'peterhead',
     'gzhatsk',
     'qaanaaq',
     'illoqqortoormiut',
     'union city',
     'sabla',
     'ancud',
     'butaritari',
     'yulara',
     'castro',
     'atuona',
     'saint-louis',
     'osoyoos',
     'luwuk',
     'punta arenas',
     'khatanga',
     'berlevag',
     'chernyshevskiy',
     'mar del plata',
     'bluff',
     'vaini',
     'lishan',
     'andrelandia',
     'bredasdorp',
     'nikolskoye',
     'chenghai',
     'vostok',
     'grand river south east',
     'hilo',
     'bilma',
     'sur',
     'dikson',
     'barrow',
     'paamiut',
     'busselton',
     'vieux-habitants',
     'labutta',
     'pitkyaranta',
     'kodinsk',
     'palabuhanratu',
     'ovre ardal',
     'padang',
     'airai',
     'mahebourg',
     'sechura',
     'ilulissat',
     'ribeira grande',
     'mataura',
     'olongapo',
     'lompoc',
     'fortuna',
     'samusu',
     'sao felix do xingu',
     'gat',
     'ponta do sol',
     'port alfred',
     'taolanaro',
     'mantua',
     'abha',
     'cap malheureux',
     'arkhangelsk',
     'faanui',
     'russellville',
     'tura',
     'lashio',
     'puerto ayora',
     'tabialan',
     'aykhal',
     'bonthe',
     'vallenar',
     'saint-philippe',
     'utiroa',
     'avarua',
     'new norfolk',
     'dudinka',
     'amderma',
     'half moon bay',
     'provideniya',
     'listvyanka',
     'agadir',
     'quatre cocos',
     'liverpool',
     'svetlaya',
     'luderitz',
     'taoudenni',
     'turbat',
     'severo-kurilsk',
     'hofn',
     'tuatapere',
     'suntar',
     'rumonge',
     'manta',
     'krasnoarmeysk',
     'victoria',
     'kjopsvik',
     'makokou',
     'syamzha',
     'fuxin',
     'ludvika',
     'daru',
     'mys shmidta',
     'meridian',
     'cumaribo',
     'chagda',
     'tuktoyaktuk',
     'nelson bay',
     'trinidad',
     'port hardy',
     'muli',
     'broken hill',
     'itarema',
     'chokurdakh',
     'saint-augustin',
     'quang ngai',
     'unai',
     'springfield',
     'zlobin',
     'hvammstangi',
     'katsuura',
     'nanortalik',
     'san rafael',
     'mayo',
     'clyde river',
     'ermelo',
     'mananjary',
     'novyy urengoy',
     'newport',
     'bambous virieux',
     'marsa matruh',
     'bathsheba',
     'benha',
     'rio pardo de minas',
     'dunedin',
     'valenca',
     'thompson',
     'georgetown',
     'longyearbyen',
     'yellowknife',
     'chitrakonda',
     'babushkin',
     'jamestown',
     'ketchikan',
     'tabuk',
     'saint george',
     'banda aceh',
     'yelan',
     'poum',
     'jamame',
     'aleppo',
     'khani',
     'byron bay',
     'kahului',
     'hedaru',
     'neepawa',
     'wahpeton',
     'cherskiy',
     'jedrzejow',
     'souillac',
     'sentyabrskiy',
     'la primavera',
     'tommot',
     'torbay',
     'kapaa',
     'hermanus',
     'bemidji',
     'ranot',
     'severodvinsk',
     'jalu',
     'walvis bay',
     'orzhytsya',
     'benghazi',
     'attawapiskat',
     'hasaki',
     'teya',
     'hithadhoo',
     'temaraia',
     'saskylakh',
     'san vicente de canete',
     'sassandra',
     'khonuu',
     'tezu',
     'ylivieska',
     'tasiilaq',
     'te anau',
     'burica',
     'otjimbingwe',
     'yerbogachen',
     'shilovo',
     'manyana',
     'gubakha',
     'sovetskiy',
     'upernavik',
     'biltine',
     'pangnirtung',
     'arraial do cabo',
     'sabha',
     'ucluelet',
     'plettenberg bay',
     'tumannyy',
     'waverly',
     'puerto suarez',
     'harthill',
     'penzance',
     'pangkalanbuun',
     'ahuimanu',
     'carnarvon',
     'cabo san lucas',
     'akyab',
     'esperance',
     'aranda de duero',
     'garmsar',
     'meulaboh',
     'ostrovnoy',
     'corsicana',
     'hambantota',
     'coihaique',
     'meyungs',
     'chuy',
     'dingle',
     'bengkulu',
     'clermont',
     'santa maria',
     'itoman',
     'tupik',
     'yar-sale',
     'samana',
     'belaya gora',
     'north bend',
     'alofi',
     'erpeli',
     'roma',
     'shubarshi',
     'rio gallegos',
     'san patricio',
     'naqadeh',
     'houma',
     'nguiu',
     'bom jesus',
     'saldanha',
     'bonavista',
     'nurota',
     'lagdo',
     'san quintin',
     'kodiak',
     'havre-saint-pierre',
     'mehamn',
     'harlingen',
     'sinnamary',
     'marsh harbour',
     'belushya guba',
     'luau',
     'sao filipe',
     'khorixas',
     'codrington',
     'suifenhe',
     'dulce grande',
     'eltham',
     'hovd',
     'fukue',
     'ibra',
     'port hawkesbury',
     'scarborough',
     'port-gentil',
     'bol',
     'mandalgovi',
     'isangel',
     'guerrero negro',
     'bereda',
     'richards bay',
     'warqla',
     'mutis',
     'mount gambier',
     'alice springs',
     'santarem',
     'fort morgan',
     'vanavara',
     'waingapu',
     'manzil jamil',
     'kavieng',
     'iqaluit',
     'visby',
     'umm lajj',
     'kruisfontein',
     'shimoda',
     'borogontsy',
     'cabimas',
     'atambua',
     'lorengau',
     'azare',
     'kargala',
     'batagay',
     'jiazi',
     'port elizabeth',
     'rawannawi',
     'havlickuv brod',
     'kingisepp',
     'yuancheng',
     'vardo',
     'sitka',
     'buin',
     'galle',
     'katangli',
     'hays',
     'conceicao do mato dentro',
     'natal',
     'alcantara',
     'timaru',
     'namatanai',
     'omsukchan',
     'vao',
     'bousso',
     'la mata',
     'sanchursk',
     'saleaula',
     'santiago',
     'labuhan',
     'ambilobe',
     'pietarsaari',
     'iracoubo',
     'fare',
     'hope',
     'port lincoln',
     'flagstaff',
     'west point',
     'abu samrah',
     'warora',
     'lanigan',
     'caravelas',
     'waitati',
     'simao',
     'geraldton',
     'ketchenery',
     'goderich',
     'acapulco',
     'burgersdorp',
     'salalah',
     'bourail',
     'whitley bay',
     'northam',
     'chaozhou',
     'hobyo',
     'gawler',
     'krasnoselkup',
     'hue',
     'marcona',
     'komsomolskiy',
     'talnakh',
     'asau',
     'hella',
     'calvinia',
     'guicheng',
     'bilibino',
     'jaisalmer',
     'cockburn town',
     'tual',
     'thinadhoo',
     'nabire',
     'iranshahr',
     'falmouth',
     'shingu',
     'moose factory',
     'cidreira',
     'norman wells',
     'lufilufi',
     'znamenka',
     'egvekinot',
     'eureka',
     'zhanakorgan',
     'orchard homes',
     'hakui',
     'wencheng',
     'kajaani',
     'anadyr',
     'cornwall',
     'kaitangata',
     'lodwar',
     'sobolevo',
     'tessalit',
     'narsaq',
     'clarence town',
     'okato',
     'barre',
     'kamenskoye',
     'kalabo',
     'tarakan',
     'kerema',
     'mizdah',
     'jussara',
     'morgaushi',
     'nizwa',
     'teguldet',
     'praia da vitoria',
     'dombarovskiy',
     'ndele',
     'xadani',
     'porbandar',
     'klaksvik',
     'north versailles',
     'tsihombe',
     'kota belud',
     'conceicao do araguaia',
     'grand gaube',
     'aybak',
     'necochea',
     'oliver',
     'hamilton',
     'tidore',
     'kuliyapitiya',
     'marzuq',
     'olafsvik',
     'presidencia roque saenz pena',
     'gambela',
     'tibati',
     'pisco',
     'fairbanks',
     'halalo',
     'greenville',
     'novotroitskaya',
     'rovaniemi',
     'dodge city',
     'pozo colorado',
     'yumen',
     'waimana',
     'okhotsk',
     'kieta',
     'nalut',
     'vila franca do campo',
     'beroroha',
     'chiredzi',
     'sao joao da barra',
     'taksimo',
     'morgan city',
     'ampanihy',
     'narrabri',
     'odweyne',
     'kenai',
     'sindand',
     'tianmen',
     'ducheng',
     'quballat',
     'inta',
     'gimli',
     'chokwe',
     'namtsy',
     'satitoa',
     'coquimbo',
     'gander',
     'batemans bay',
     'arroio grande',
     'sinjai',
     'najran',
     'the pas',
     'urucara',
     'margate',
     'merauke',
     'hokitika',
     'oriximina',
     'boden',
     'tamworth',
     'rawson',
     'antalaha',
     'faya',
     'aklavik',
     'mahina',
     'zhezkazgan',
     'sampit',
     'mahibadhoo',
     'verkhoyansk',
     'kinablangan',
     'srednekolymsk',
     'san cristobal',
     'mao',
     'fomboni',
     'swan hill',
     'west des moines',
     'pacific grove',
     'bolobo',
     'altona',
     'kazalinsk',
     'kuching',
     'amboasary',
     'tromso',
     'tautira',
     'ulaangom',
     'traunstein',
     'floro',
     'lesosibirsk',
     'canaries',
     'ossora',
     'petropavlovsk-kamchatskiy',
     'astoria',
     'tawnat',
     'port augusta',
     'ambanja',
     'la ronge',
     'omboue',
     'jizan',
     'port blair',
     'nemuro',
     'portland',
     'laguna',
     'erzin',
     'merrill',
     'mokshan',
     'tabory',
     'chapais',
     'gazli',
     'farmington',
     'jinka',
     'ust-nera',
     'riyadh',
     'srandakan',
     'tabiauea',
     'comodoro rivadavia',
     'keshan',
     'axim',
     'eyl',
     'grindavik',
     'ksenyevka',
     'takoradi',
     'roseburg',
     'brooks',
     'inirida',
     'vyartsilya',
     'bambanglipuro',
     'zhoucheng',
     'livingstone',
     'impfondo',
     'hearst',
     'salina',
     'lambarene',
     'tahta',
     'yala',
     'santa isabel do rio negro',
     'mbamba',
     'zabol',
     'ballina',
     'montepuez',
     'brae',
     'nirgua',
     'gevgelija',
     'voh',
     'sulangan',
     'sayaxche',
     'nattarasankottai',
     'barra dos coqueiros',
     'tha chang',
     'sangmelima',
     'yarada',
     'hami',
     'jumla',
     'westport',
     'zonguldak',
     'kandrian',
     'kerrville',
     'jais',
     'knyaginino',
     'marfino',
     'ravar',
     'bataipora',
     'awjilah',
     'saint-pierre',
     'winslow',
     'yorosso',
     'jaciara',
     'gijon',
     'pedasi',
     'tubuala',
     'alotau',
     'canutama',
     'bilgoraj',
     'wa',
     'nesna',
     'avera',
     'zhigansk',
     'yelbarga',
     'sayyan',
     'mabaruma',
     'durusu',
     'tarrafal',
     'biak',
     'ondorhaan',
     'sorland',
     'lasa',
     'bowen',
     'dalbandin',
     'darnah',
     'banes',
     'haines junction',
     'mendi',
     'meadow lake',
     'rungata',
     'antofagasta',
     'rio cuarto',
     'port-cartier',
     'ogaminana',
     'yatou',
     'dolbeau',
     'mason city',
     'port keats',
     'jacareacanga',
     'compostela',
     'kwinana',
     'ivdel',
     'ledyard',
     'ajaccio',
     'turayf',
     'kamenka',
     'rio grande',
     'tabou',
     'vila velha',
     'bima',
     'razole',
     'kloulklubed',
     'malpe',
     'saint-leu',
     'umzimvubu',
     'west wendover',
     'asfi',
     'posevnaya',
     'dharchula',
     'hutchinson',
     'kalmunai',
     'ware',
     'carutapera',
     'belmonte',
     'buala',
     'leningradskiy',
     'peru',
     'azul',
     'artyom',
     'waipawa',
     'constitucion',
     'sangalhos',
     'bording',
     'manggar',
     'los llanos de aridane',
     'boo',
     'cabinda',
     'darovskoy',
     'sao jose da coroa grande',
     'hetauda',
     'ha',
     'chantada',
     'sidi bu zayd',
     'ahipara',
     'porto walter',
     'honiara',
     'kosh-agach',
     'fivizzano',
     'louisbourg',
     'matara',
     'pundaguitan',
     'sola',
     'san luis',
     'ust-omchug',
     'nioro',
     'chibombo',
     'korsor',
     'shelburne',
     'arkhara',
     'high level',
     'kannod',
     'palmer',
     'palauig',
     'lakes entrance',
     'san miguel',
     'youkounkoun',
     'saint anthony',
     'zelenogorskiy',
     'eldikan',
     'mnogovershinnyy',
     'shu',
     'drayton valley',
     'shache',
     'cairns',
     'kharan',
     'padre paraiso',
     'kavaratti',
     'norden',
     'russell',
     'minab',
     'turukhansk',
     'leshukonskoye',
     'kushmurun',
     'carauari',
     'mogadouro',
     'arlit',
     'ratnagiri',
     'bealanana',
     'beian',
     'mae hong son',
     'baghdad',
     'tuxtla gutierrez',
     'la sarre',
     'lagoa',
     'fort nelson',
     'kendari',
     'murmashi',
     'zhaotong',
     'yenagoa',
     'bucerias',
     'ayer itam',
     'wagar',
     'guiren',
     'sarany',
     'saint-dizier',
     'ituni',
     'beaverlodge',
     'vestmanna',
     'price',
     'oktyabrskoye',
     'at-bashi',
     'maniitsoq',
     'curup',
     'rocha',
     'tigil',
     'salinopolis',
     'nuuk',
     'mackay',
     'komatipoort',
     'nara',
     'cayenne',
     'severnyy',
     'rock springs',
     'sillod',
     'kholtoson',
     'ngunguru',
     'yairipok',
     'kamaishi',
     'atbasar',
     'broome',
     'casper',
     'pangody',
     'sorvag',
     'polovinnoye',
     'oranjestad',
     'yirol',
     'dubbo',
     'karaton',
     'santa marta',
     'boyuibe',
     'grand terrace',
     'descalvado',
     'aksu',
     'udachnyy',
     'karratha',
     'pemberton',
     'mokolo',
     'chakwal',
     'golden',
     'phan thiet',
     'emba',
     'radenci',
     'herat',
     'pontes e lacerda',
     'kemijarvi',
     'lenart',
     'ozernovskiy',
     'oskarshamn',
     'tete',
     'aqtobe',
     'catalina foothills',
     'ziyamet',
     'iskandar',
     'shitkino',
     'gravdal',
     'peniche',
     'armacao dos buzios',
     'shenjiamen',
     'sol-iletsk',
     'fergus falls',
     'wahran',
     'nizhniy odes',
     'kuche',
     'ardatov',
     'sibolga',
     'pinawa',
     'susanville',
     'ayan',
     'yerofey pavlovich',
     'garoua',
     'mayumba',
     'misratah',
     'noumea',
     'prokuplje',
     'rimouski',
     'nanfeng',
     'ekibastuz',
     'sal rei',
     'rockport',
     'canete',
     'diego de almagro',
     'inyonga',
     'torrelavega',
     'tiarei',
     'grand centre',
     'kundla',
     'izhma',
     'niwari',
     'karachi',
     'nouakchott',
     'zanjan',
     'nosy varika',
     'novo aripuana',
     'san ramon',
     'olinda',
     'kumluca',
     'kargasok',
     'harper',
     'mount isa',
     'bandarbeyla',
     'monte escobedo',
     'svetlogorsk',
     'onokhoy',
     'bielsk podlaski',
     'coahuayana',
     'vanimo',
     'banon',
     'vinh',
     'sataua',
     'tawang',
     'emerald',
     'hwange',
     'mayskiy',
     'mouila',
     'seymchan',
     'graciano sanchez',
     'khandyga',
     'sivaki',
     'denizli',
     'ericeira',
     'mugur-aksy',
     'verkhnevilyuysk',
     'upata',
     'lolua',
     'azar shahr',
     'marawi',
     'angoche',
     'maun',
     'rundu',
     'dukat',
     'bairiki',
     'panjakent',
     'adrar',
     'walla walla',
     'oistins',
     'mandera',
     'totoral',
     'pionerskiy',
     'arona',
     'watertown',
     'uppsala',
     'mumford',
     'cruz',
     'galiwinku',
     'tonantins',
     'longlac',
     'ola',
     'kurya',
     'cienega',
     'talaya',
     'bajo baudo',
     'baiyin',
     'blackpool',
     'novosokolniki',
     'kineta',
     'buchanan',
     'barbar',
     'yurginskoye',
     'saint-joseph',
     'beyneu',
     'jiamusi',
     'omaruru',
     'vrangel',
     'palimbang',
     'roald',
     'saqqez',
     'kiunga',
     'kindia',
     'tekeli',
     'oldebroek',
     'ngama',
     'acatzingo',
     'constantine',
     'pemba',
     'jiroft',
     'karwar',
     'arua',
     'halifax',
     'boa vista',
     'les cayes',
     'college',
     'loreto',
     'gamba',
     'altotonga',
     'valdivia',
     'jalpan',
     'malakal',
     'oxford',
     'nogent-le-rotrou',
     'mallapuram',
     'kedrovyy',
     'sisimiut',
     'santa barbara',
     'diffa',
     'terre haute',
     'verkhniy fiagdon',
     'catuday',
     'buraydah',
     'novaya zaimka',
     'husavik',
     'salamiyah',
     'kailua',
     'buarcos',
     'yaan',
     'dillon',
     'puunsi',
     'monaco-ville',
     'pochutla',
     'boyolangu',
     'korem',
     'fasa',
     'suchedniow',
     'richard toll',
     'astana',
     'zhangjiakou',
     'crotone',
     'baykit',
     'vilanova del cami',
     'chipinge',
     'muros',
     'glenwood springs',
     'prince rupert',
     'tsnori',
     'ovalle',
     'toowoomba',
     'tucurui',
     'deep river',
     'gazanjyk',
     'puerto escondido',
     'mahanje',
     'zilair',
     'abashiri',
     'aswan',
     'stamsund',
     'luanda',
     'kyzyl',
     'burnie',
     'cristalina',
     'touros',
     'cabedelo',
     'viligili',
     'ixtapa',
     'barawe',
     'iskilip',
     'grand-lahou',
     'sept-iles',
     'la rioja',
     'kletskaya',
     'rorvik',
     'smolenka',
     'zhanaozen',
     'mitsamiouli',
     'troitskoye',
     'uige',
     'consolacion del sur',
     'macamic',
     'honningsvag',
     'aripuana',
     'kamakwie',
     'wuwei',
     'navirai',
     'andevoranto',
     'esmeraldas',
     'neuquen',
     'nouadhibou',
     'porto san giorgio',
     'huarmey',
     'nantucket',
     'sungaipenuh',
     'kapit',
     'mazamari',
     ...]



# Get data for cities


```python
#Url and api key for OpenWeather
url = "http://api.openweathermap.org/data/2.5/weather?"
api_key = "26ee17b7b6bca81b3e075392644a5aec"

#Create lists 
lats = []
hums = []
names = []
countries = []
dates = []
lngs = []
max_temps = []
wind_speeds = []
clouds = []

z = 0

# Extract info for random cities
for x in range(len(clean_cities)):
    query_url = url + "q=" + clean_cities[z] + "&APPID=" + api_key + "&units=imperial"
    city_data = req.get(query_url).json()
    
    print("Processing Record " + str(z) + ' of ' +  str(len(clean_cities)) + ' | ' + str(clean_cities[z]))
    print(query_url)
    
    z = z + 1
    
    try:
        #Make lists of the data 
        lats.append(city_data['coord']['lat'])
        names.append(city_data['name'])
        countries.append(city_data['sys']['country'])
        dates.append(city_data['dt'])
        lngs.append(city_data['coord']['lon'])
        max_temps.append(city_data['main']['temp_max'])
        hums.append(city_data['main']['humidity'])
        wind_speeds.append(city_data['wind']['speed'])
        clouds.append(city_data["clouds"]["all"])
    except KeyError:
        continue
```

    Processing Record 0 of 1433 | rikitea
    http://api.openweathermap.org/data/2.5/weather?q=rikitea&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1 of 1433 | tiksi
    http://api.openweathermap.org/data/2.5/weather?q=tiksi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 2 of 1433 | tasbuget
    http://api.openweathermap.org/data/2.5/weather?q=tasbuget&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 3 of 1433 | east london
    http://api.openweathermap.org/data/2.5/weather?q=east london&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 4 of 1433 | saryshagan
    http://api.openweathermap.org/data/2.5/weather?q=saryshagan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 5 of 1433 | lebu
    http://api.openweathermap.org/data/2.5/weather?q=lebu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 6 of 1433 | bethel
    http://api.openweathermap.org/data/2.5/weather?q=bethel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 7 of 1433 | barentsburg
    http://api.openweathermap.org/data/2.5/weather?q=barentsburg&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 8 of 1433 | vaitupu
    http://api.openweathermap.org/data/2.5/weather?q=vaitupu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 9 of 1433 | albany
    http://api.openweathermap.org/data/2.5/weather?q=albany&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 10 of 1433 | ushuaia
    http://api.openweathermap.org/data/2.5/weather?q=ushuaia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 11 of 1433 | cape town
    http://api.openweathermap.org/data/2.5/weather?q=cape town&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 12 of 1433 | nizhneyansk
    http://api.openweathermap.org/data/2.5/weather?q=nizhneyansk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 13 of 1433 | pevek
    http://api.openweathermap.org/data/2.5/weather?q=pevek&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 14 of 1433 | namibe
    http://api.openweathermap.org/data/2.5/weather?q=namibe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 15 of 1433 | lavrentiya
    http://api.openweathermap.org/data/2.5/weather?q=lavrentiya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 16 of 1433 | hobart
    http://api.openweathermap.org/data/2.5/weather?q=hobart&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 17 of 1433 | peterhead
    http://api.openweathermap.org/data/2.5/weather?q=peterhead&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 18 of 1433 | gzhatsk
    http://api.openweathermap.org/data/2.5/weather?q=gzhatsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 19 of 1433 | qaanaaq
    http://api.openweathermap.org/data/2.5/weather?q=qaanaaq&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 20 of 1433 | illoqqortoormiut
    http://api.openweathermap.org/data/2.5/weather?q=illoqqortoormiut&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 21 of 1433 | union city
    http://api.openweathermap.org/data/2.5/weather?q=union city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 22 of 1433 | sabla
    http://api.openweathermap.org/data/2.5/weather?q=sabla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 23 of 1433 | ancud
    http://api.openweathermap.org/data/2.5/weather?q=ancud&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 24 of 1433 | butaritari
    http://api.openweathermap.org/data/2.5/weather?q=butaritari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 25 of 1433 | yulara
    http://api.openweathermap.org/data/2.5/weather?q=yulara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 26 of 1433 | castro
    http://api.openweathermap.org/data/2.5/weather?q=castro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 27 of 1433 | atuona
    http://api.openweathermap.org/data/2.5/weather?q=atuona&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 28 of 1433 | saint-louis
    http://api.openweathermap.org/data/2.5/weather?q=saint-louis&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 29 of 1433 | osoyoos
    http://api.openweathermap.org/data/2.5/weather?q=osoyoos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 30 of 1433 | luwuk
    http://api.openweathermap.org/data/2.5/weather?q=luwuk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 31 of 1433 | punta arenas
    http://api.openweathermap.org/data/2.5/weather?q=punta arenas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 32 of 1433 | khatanga
    http://api.openweathermap.org/data/2.5/weather?q=khatanga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 33 of 1433 | berlevag
    http://api.openweathermap.org/data/2.5/weather?q=berlevag&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 34 of 1433 | chernyshevskiy
    http://api.openweathermap.org/data/2.5/weather?q=chernyshevskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 35 of 1433 | mar del plata
    http://api.openweathermap.org/data/2.5/weather?q=mar del plata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 36 of 1433 | bluff
    http://api.openweathermap.org/data/2.5/weather?q=bluff&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 37 of 1433 | vaini
    http://api.openweathermap.org/data/2.5/weather?q=vaini&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 38 of 1433 | lishan
    http://api.openweathermap.org/data/2.5/weather?q=lishan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 39 of 1433 | andrelandia
    http://api.openweathermap.org/data/2.5/weather?q=andrelandia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 40 of 1433 | bredasdorp
    http://api.openweathermap.org/data/2.5/weather?q=bredasdorp&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 41 of 1433 | nikolskoye
    http://api.openweathermap.org/data/2.5/weather?q=nikolskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 42 of 1433 | chenghai
    http://api.openweathermap.org/data/2.5/weather?q=chenghai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 43 of 1433 | vostok
    http://api.openweathermap.org/data/2.5/weather?q=vostok&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 44 of 1433 | grand river south east
    http://api.openweathermap.org/data/2.5/weather?q=grand river south east&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 45 of 1433 | hilo
    http://api.openweathermap.org/data/2.5/weather?q=hilo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 46 of 1433 | bilma
    http://api.openweathermap.org/data/2.5/weather?q=bilma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 47 of 1433 | sur
    http://api.openweathermap.org/data/2.5/weather?q=sur&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 48 of 1433 | dikson
    http://api.openweathermap.org/data/2.5/weather?q=dikson&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 49 of 1433 | barrow
    http://api.openweathermap.org/data/2.5/weather?q=barrow&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 50 of 1433 | paamiut
    http://api.openweathermap.org/data/2.5/weather?q=paamiut&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 51 of 1433 | busselton
    http://api.openweathermap.org/data/2.5/weather?q=busselton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 52 of 1433 | vieux-habitants
    http://api.openweathermap.org/data/2.5/weather?q=vieux-habitants&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 53 of 1433 | labutta
    http://api.openweathermap.org/data/2.5/weather?q=labutta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 54 of 1433 | pitkyaranta
    http://api.openweathermap.org/data/2.5/weather?q=pitkyaranta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 55 of 1433 | kodinsk
    http://api.openweathermap.org/data/2.5/weather?q=kodinsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 56 of 1433 | palabuhanratu
    http://api.openweathermap.org/data/2.5/weather?q=palabuhanratu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 57 of 1433 | ovre ardal
    http://api.openweathermap.org/data/2.5/weather?q=ovre ardal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 58 of 1433 | padang
    http://api.openweathermap.org/data/2.5/weather?q=padang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 59 of 1433 | airai
    http://api.openweathermap.org/data/2.5/weather?q=airai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 60 of 1433 | mahebourg
    http://api.openweathermap.org/data/2.5/weather?q=mahebourg&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 61 of 1433 | sechura
    http://api.openweathermap.org/data/2.5/weather?q=sechura&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 62 of 1433 | ilulissat
    http://api.openweathermap.org/data/2.5/weather?q=ilulissat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 63 of 1433 | ribeira grande
    http://api.openweathermap.org/data/2.5/weather?q=ribeira grande&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 64 of 1433 | mataura
    http://api.openweathermap.org/data/2.5/weather?q=mataura&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 65 of 1433 | olongapo
    http://api.openweathermap.org/data/2.5/weather?q=olongapo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 66 of 1433 | lompoc
    http://api.openweathermap.org/data/2.5/weather?q=lompoc&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 67 of 1433 | fortuna
    http://api.openweathermap.org/data/2.5/weather?q=fortuna&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 68 of 1433 | samusu
    http://api.openweathermap.org/data/2.5/weather?q=samusu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 69 of 1433 | sao felix do xingu
    http://api.openweathermap.org/data/2.5/weather?q=sao felix do xingu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 70 of 1433 | gat
    http://api.openweathermap.org/data/2.5/weather?q=gat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 71 of 1433 | ponta do sol
    http://api.openweathermap.org/data/2.5/weather?q=ponta do sol&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 72 of 1433 | port alfred
    http://api.openweathermap.org/data/2.5/weather?q=port alfred&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 73 of 1433 | taolanaro
    http://api.openweathermap.org/data/2.5/weather?q=taolanaro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 74 of 1433 | mantua
    http://api.openweathermap.org/data/2.5/weather?q=mantua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 75 of 1433 | abha
    http://api.openweathermap.org/data/2.5/weather?q=abha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 76 of 1433 | cap malheureux
    http://api.openweathermap.org/data/2.5/weather?q=cap malheureux&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 77 of 1433 | arkhangelsk
    http://api.openweathermap.org/data/2.5/weather?q=arkhangelsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 78 of 1433 | faanui
    http://api.openweathermap.org/data/2.5/weather?q=faanui&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 79 of 1433 | russellville
    http://api.openweathermap.org/data/2.5/weather?q=russellville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 80 of 1433 | tura
    http://api.openweathermap.org/data/2.5/weather?q=tura&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 81 of 1433 | lashio
    http://api.openweathermap.org/data/2.5/weather?q=lashio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 82 of 1433 | puerto ayora
    http://api.openweathermap.org/data/2.5/weather?q=puerto ayora&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 83 of 1433 | tabialan
    http://api.openweathermap.org/data/2.5/weather?q=tabialan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 84 of 1433 | aykhal
    http://api.openweathermap.org/data/2.5/weather?q=aykhal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 85 of 1433 | bonthe
    http://api.openweathermap.org/data/2.5/weather?q=bonthe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 86 of 1433 | vallenar
    http://api.openweathermap.org/data/2.5/weather?q=vallenar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 87 of 1433 | saint-philippe
    http://api.openweathermap.org/data/2.5/weather?q=saint-philippe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 88 of 1433 | utiroa
    http://api.openweathermap.org/data/2.5/weather?q=utiroa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 89 of 1433 | avarua
    http://api.openweathermap.org/data/2.5/weather?q=avarua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 90 of 1433 | new norfolk
    http://api.openweathermap.org/data/2.5/weather?q=new norfolk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 91 of 1433 | dudinka
    http://api.openweathermap.org/data/2.5/weather?q=dudinka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 92 of 1433 | amderma
    http://api.openweathermap.org/data/2.5/weather?q=amderma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 93 of 1433 | half moon bay
    http://api.openweathermap.org/data/2.5/weather?q=half moon bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 94 of 1433 | provideniya
    http://api.openweathermap.org/data/2.5/weather?q=provideniya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 95 of 1433 | listvyanka
    http://api.openweathermap.org/data/2.5/weather?q=listvyanka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 96 of 1433 | agadir
    http://api.openweathermap.org/data/2.5/weather?q=agadir&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 97 of 1433 | quatre cocos
    http://api.openweathermap.org/data/2.5/weather?q=quatre cocos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 98 of 1433 | liverpool
    http://api.openweathermap.org/data/2.5/weather?q=liverpool&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 99 of 1433 | svetlaya
    http://api.openweathermap.org/data/2.5/weather?q=svetlaya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 100 of 1433 | luderitz
    http://api.openweathermap.org/data/2.5/weather?q=luderitz&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 101 of 1433 | taoudenni
    http://api.openweathermap.org/data/2.5/weather?q=taoudenni&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 102 of 1433 | turbat
    http://api.openweathermap.org/data/2.5/weather?q=turbat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 103 of 1433 | severo-kurilsk
    http://api.openweathermap.org/data/2.5/weather?q=severo-kurilsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 104 of 1433 | hofn
    http://api.openweathermap.org/data/2.5/weather?q=hofn&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 105 of 1433 | tuatapere
    http://api.openweathermap.org/data/2.5/weather?q=tuatapere&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 106 of 1433 | suntar
    http://api.openweathermap.org/data/2.5/weather?q=suntar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 107 of 1433 | rumonge
    http://api.openweathermap.org/data/2.5/weather?q=rumonge&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 108 of 1433 | manta
    http://api.openweathermap.org/data/2.5/weather?q=manta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 109 of 1433 | krasnoarmeysk
    http://api.openweathermap.org/data/2.5/weather?q=krasnoarmeysk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 110 of 1433 | victoria
    http://api.openweathermap.org/data/2.5/weather?q=victoria&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 111 of 1433 | kjopsvik
    http://api.openweathermap.org/data/2.5/weather?q=kjopsvik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 112 of 1433 | makokou
    http://api.openweathermap.org/data/2.5/weather?q=makokou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 113 of 1433 | syamzha
    http://api.openweathermap.org/data/2.5/weather?q=syamzha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 114 of 1433 | fuxin
    http://api.openweathermap.org/data/2.5/weather?q=fuxin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 115 of 1433 | ludvika
    http://api.openweathermap.org/data/2.5/weather?q=ludvika&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 116 of 1433 | daru
    http://api.openweathermap.org/data/2.5/weather?q=daru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 117 of 1433 | mys shmidta
    http://api.openweathermap.org/data/2.5/weather?q=mys shmidta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 118 of 1433 | meridian
    http://api.openweathermap.org/data/2.5/weather?q=meridian&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 119 of 1433 | cumaribo
    http://api.openweathermap.org/data/2.5/weather?q=cumaribo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 120 of 1433 | chagda
    http://api.openweathermap.org/data/2.5/weather?q=chagda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 121 of 1433 | tuktoyaktuk
    http://api.openweathermap.org/data/2.5/weather?q=tuktoyaktuk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 122 of 1433 | nelson bay
    http://api.openweathermap.org/data/2.5/weather?q=nelson bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 123 of 1433 | trinidad
    http://api.openweathermap.org/data/2.5/weather?q=trinidad&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 124 of 1433 | port hardy
    http://api.openweathermap.org/data/2.5/weather?q=port hardy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 125 of 1433 | muli
    http://api.openweathermap.org/data/2.5/weather?q=muli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 126 of 1433 | broken hill
    http://api.openweathermap.org/data/2.5/weather?q=broken hill&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 127 of 1433 | itarema
    http://api.openweathermap.org/data/2.5/weather?q=itarema&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 128 of 1433 | chokurdakh
    http://api.openweathermap.org/data/2.5/weather?q=chokurdakh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 129 of 1433 | saint-augustin
    http://api.openweathermap.org/data/2.5/weather?q=saint-augustin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 130 of 1433 | quang ngai
    http://api.openweathermap.org/data/2.5/weather?q=quang ngai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 131 of 1433 | unai
    http://api.openweathermap.org/data/2.5/weather?q=unai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 132 of 1433 | springfield
    http://api.openweathermap.org/data/2.5/weather?q=springfield&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 133 of 1433 | zlobin
    http://api.openweathermap.org/data/2.5/weather?q=zlobin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 134 of 1433 | hvammstangi
    http://api.openweathermap.org/data/2.5/weather?q=hvammstangi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 135 of 1433 | katsuura
    http://api.openweathermap.org/data/2.5/weather?q=katsuura&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 136 of 1433 | nanortalik
    http://api.openweathermap.org/data/2.5/weather?q=nanortalik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 137 of 1433 | san rafael
    http://api.openweathermap.org/data/2.5/weather?q=san rafael&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 138 of 1433 | mayo
    http://api.openweathermap.org/data/2.5/weather?q=mayo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 139 of 1433 | clyde river
    http://api.openweathermap.org/data/2.5/weather?q=clyde river&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 140 of 1433 | ermelo
    http://api.openweathermap.org/data/2.5/weather?q=ermelo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 141 of 1433 | mananjary
    http://api.openweathermap.org/data/2.5/weather?q=mananjary&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 142 of 1433 | novyy urengoy
    http://api.openweathermap.org/data/2.5/weather?q=novyy urengoy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 143 of 1433 | newport
    http://api.openweathermap.org/data/2.5/weather?q=newport&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 144 of 1433 | bambous virieux
    http://api.openweathermap.org/data/2.5/weather?q=bambous virieux&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 145 of 1433 | marsa matruh
    http://api.openweathermap.org/data/2.5/weather?q=marsa matruh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 146 of 1433 | bathsheba
    http://api.openweathermap.org/data/2.5/weather?q=bathsheba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 147 of 1433 | benha
    http://api.openweathermap.org/data/2.5/weather?q=benha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 148 of 1433 | rio pardo de minas
    http://api.openweathermap.org/data/2.5/weather?q=rio pardo de minas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 149 of 1433 | dunedin
    http://api.openweathermap.org/data/2.5/weather?q=dunedin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 150 of 1433 | valenca
    http://api.openweathermap.org/data/2.5/weather?q=valenca&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 151 of 1433 | thompson
    http://api.openweathermap.org/data/2.5/weather?q=thompson&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 152 of 1433 | georgetown
    http://api.openweathermap.org/data/2.5/weather?q=georgetown&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 153 of 1433 | longyearbyen
    http://api.openweathermap.org/data/2.5/weather?q=longyearbyen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 154 of 1433 | yellowknife
    http://api.openweathermap.org/data/2.5/weather?q=yellowknife&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 155 of 1433 | chitrakonda
    http://api.openweathermap.org/data/2.5/weather?q=chitrakonda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 156 of 1433 | babushkin
    http://api.openweathermap.org/data/2.5/weather?q=babushkin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 157 of 1433 | jamestown
    http://api.openweathermap.org/data/2.5/weather?q=jamestown&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 158 of 1433 | ketchikan
    http://api.openweathermap.org/data/2.5/weather?q=ketchikan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 159 of 1433 | tabuk
    http://api.openweathermap.org/data/2.5/weather?q=tabuk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 160 of 1433 | saint george
    http://api.openweathermap.org/data/2.5/weather?q=saint george&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 161 of 1433 | banda aceh
    http://api.openweathermap.org/data/2.5/weather?q=banda aceh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 162 of 1433 | yelan
    http://api.openweathermap.org/data/2.5/weather?q=yelan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 163 of 1433 | poum
    http://api.openweathermap.org/data/2.5/weather?q=poum&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 164 of 1433 | jamame
    http://api.openweathermap.org/data/2.5/weather?q=jamame&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 165 of 1433 | aleppo
    http://api.openweathermap.org/data/2.5/weather?q=aleppo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 166 of 1433 | khani
    http://api.openweathermap.org/data/2.5/weather?q=khani&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 167 of 1433 | byron bay
    http://api.openweathermap.org/data/2.5/weather?q=byron bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 168 of 1433 | kahului
    http://api.openweathermap.org/data/2.5/weather?q=kahului&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 169 of 1433 | hedaru
    http://api.openweathermap.org/data/2.5/weather?q=hedaru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 170 of 1433 | neepawa
    http://api.openweathermap.org/data/2.5/weather?q=neepawa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 171 of 1433 | wahpeton
    http://api.openweathermap.org/data/2.5/weather?q=wahpeton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 172 of 1433 | cherskiy
    http://api.openweathermap.org/data/2.5/weather?q=cherskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 173 of 1433 | jedrzejow
    http://api.openweathermap.org/data/2.5/weather?q=jedrzejow&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 174 of 1433 | souillac
    http://api.openweathermap.org/data/2.5/weather?q=souillac&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 175 of 1433 | sentyabrskiy
    http://api.openweathermap.org/data/2.5/weather?q=sentyabrskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 176 of 1433 | la primavera
    http://api.openweathermap.org/data/2.5/weather?q=la primavera&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 177 of 1433 | tommot
    http://api.openweathermap.org/data/2.5/weather?q=tommot&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 178 of 1433 | torbay
    http://api.openweathermap.org/data/2.5/weather?q=torbay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 179 of 1433 | kapaa
    http://api.openweathermap.org/data/2.5/weather?q=kapaa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 180 of 1433 | hermanus
    http://api.openweathermap.org/data/2.5/weather?q=hermanus&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 181 of 1433 | bemidji
    http://api.openweathermap.org/data/2.5/weather?q=bemidji&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 182 of 1433 | ranot
    http://api.openweathermap.org/data/2.5/weather?q=ranot&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 183 of 1433 | severodvinsk
    http://api.openweathermap.org/data/2.5/weather?q=severodvinsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 184 of 1433 | jalu
    http://api.openweathermap.org/data/2.5/weather?q=jalu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 185 of 1433 | walvis bay
    http://api.openweathermap.org/data/2.5/weather?q=walvis bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 186 of 1433 | orzhytsya
    http://api.openweathermap.org/data/2.5/weather?q=orzhytsya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 187 of 1433 | benghazi
    http://api.openweathermap.org/data/2.5/weather?q=benghazi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 188 of 1433 | attawapiskat
    http://api.openweathermap.org/data/2.5/weather?q=attawapiskat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 189 of 1433 | hasaki
    http://api.openweathermap.org/data/2.5/weather?q=hasaki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 190 of 1433 | teya
    http://api.openweathermap.org/data/2.5/weather?q=teya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 191 of 1433 | hithadhoo
    http://api.openweathermap.org/data/2.5/weather?q=hithadhoo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 192 of 1433 | temaraia
    http://api.openweathermap.org/data/2.5/weather?q=temaraia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 193 of 1433 | saskylakh
    http://api.openweathermap.org/data/2.5/weather?q=saskylakh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 194 of 1433 | san vicente de canete
    http://api.openweathermap.org/data/2.5/weather?q=san vicente de canete&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 195 of 1433 | sassandra
    http://api.openweathermap.org/data/2.5/weather?q=sassandra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 196 of 1433 | khonuu
    http://api.openweathermap.org/data/2.5/weather?q=khonuu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 197 of 1433 | tezu
    http://api.openweathermap.org/data/2.5/weather?q=tezu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 198 of 1433 | ylivieska
    http://api.openweathermap.org/data/2.5/weather?q=ylivieska&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 199 of 1433 | tasiilaq
    http://api.openweathermap.org/data/2.5/weather?q=tasiilaq&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 200 of 1433 | te anau
    http://api.openweathermap.org/data/2.5/weather?q=te anau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 201 of 1433 | burica
    http://api.openweathermap.org/data/2.5/weather?q=burica&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 202 of 1433 | otjimbingwe
    http://api.openweathermap.org/data/2.5/weather?q=otjimbingwe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 203 of 1433 | yerbogachen
    http://api.openweathermap.org/data/2.5/weather?q=yerbogachen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 204 of 1433 | shilovo
    http://api.openweathermap.org/data/2.5/weather?q=shilovo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 205 of 1433 | manyana
    http://api.openweathermap.org/data/2.5/weather?q=manyana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 206 of 1433 | gubakha
    http://api.openweathermap.org/data/2.5/weather?q=gubakha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 207 of 1433 | sovetskiy
    http://api.openweathermap.org/data/2.5/weather?q=sovetskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 208 of 1433 | upernavik
    http://api.openweathermap.org/data/2.5/weather?q=upernavik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 209 of 1433 | biltine
    http://api.openweathermap.org/data/2.5/weather?q=biltine&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 210 of 1433 | pangnirtung
    http://api.openweathermap.org/data/2.5/weather?q=pangnirtung&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 211 of 1433 | arraial do cabo
    http://api.openweathermap.org/data/2.5/weather?q=arraial do cabo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 212 of 1433 | sabha
    http://api.openweathermap.org/data/2.5/weather?q=sabha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 213 of 1433 | ucluelet
    http://api.openweathermap.org/data/2.5/weather?q=ucluelet&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 214 of 1433 | plettenberg bay
    http://api.openweathermap.org/data/2.5/weather?q=plettenberg bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 215 of 1433 | tumannyy
    http://api.openweathermap.org/data/2.5/weather?q=tumannyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 216 of 1433 | waverly
    http://api.openweathermap.org/data/2.5/weather?q=waverly&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 217 of 1433 | puerto suarez
    http://api.openweathermap.org/data/2.5/weather?q=puerto suarez&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 218 of 1433 | harthill
    http://api.openweathermap.org/data/2.5/weather?q=harthill&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 219 of 1433 | penzance
    http://api.openweathermap.org/data/2.5/weather?q=penzance&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 220 of 1433 | pangkalanbuun
    http://api.openweathermap.org/data/2.5/weather?q=pangkalanbuun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 221 of 1433 | ahuimanu
    http://api.openweathermap.org/data/2.5/weather?q=ahuimanu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 222 of 1433 | carnarvon
    http://api.openweathermap.org/data/2.5/weather?q=carnarvon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 223 of 1433 | cabo san lucas
    http://api.openweathermap.org/data/2.5/weather?q=cabo san lucas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 224 of 1433 | akyab
    http://api.openweathermap.org/data/2.5/weather?q=akyab&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 225 of 1433 | esperance
    http://api.openweathermap.org/data/2.5/weather?q=esperance&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 226 of 1433 | aranda de duero
    http://api.openweathermap.org/data/2.5/weather?q=aranda de duero&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 227 of 1433 | garmsar
    http://api.openweathermap.org/data/2.5/weather?q=garmsar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 228 of 1433 | meulaboh
    http://api.openweathermap.org/data/2.5/weather?q=meulaboh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 229 of 1433 | ostrovnoy
    http://api.openweathermap.org/data/2.5/weather?q=ostrovnoy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 230 of 1433 | corsicana
    http://api.openweathermap.org/data/2.5/weather?q=corsicana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 231 of 1433 | hambantota
    http://api.openweathermap.org/data/2.5/weather?q=hambantota&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 232 of 1433 | coihaique
    http://api.openweathermap.org/data/2.5/weather?q=coihaique&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 233 of 1433 | meyungs
    http://api.openweathermap.org/data/2.5/weather?q=meyungs&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 234 of 1433 | chuy
    http://api.openweathermap.org/data/2.5/weather?q=chuy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 235 of 1433 | dingle
    http://api.openweathermap.org/data/2.5/weather?q=dingle&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 236 of 1433 | bengkulu
    http://api.openweathermap.org/data/2.5/weather?q=bengkulu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 237 of 1433 | clermont
    http://api.openweathermap.org/data/2.5/weather?q=clermont&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 238 of 1433 | santa maria
    http://api.openweathermap.org/data/2.5/weather?q=santa maria&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 239 of 1433 | itoman
    http://api.openweathermap.org/data/2.5/weather?q=itoman&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 240 of 1433 | tupik
    http://api.openweathermap.org/data/2.5/weather?q=tupik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 241 of 1433 | yar-sale
    http://api.openweathermap.org/data/2.5/weather?q=yar-sale&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 242 of 1433 | samana
    http://api.openweathermap.org/data/2.5/weather?q=samana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 243 of 1433 | belaya gora
    http://api.openweathermap.org/data/2.5/weather?q=belaya gora&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 244 of 1433 | north bend
    http://api.openweathermap.org/data/2.5/weather?q=north bend&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 245 of 1433 | alofi
    http://api.openweathermap.org/data/2.5/weather?q=alofi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 246 of 1433 | erpeli
    http://api.openweathermap.org/data/2.5/weather?q=erpeli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 247 of 1433 | roma
    http://api.openweathermap.org/data/2.5/weather?q=roma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 248 of 1433 | shubarshi
    http://api.openweathermap.org/data/2.5/weather?q=shubarshi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 249 of 1433 | rio gallegos
    http://api.openweathermap.org/data/2.5/weather?q=rio gallegos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 250 of 1433 | san patricio
    http://api.openweathermap.org/data/2.5/weather?q=san patricio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 251 of 1433 | naqadeh
    http://api.openweathermap.org/data/2.5/weather?q=naqadeh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 252 of 1433 | houma
    http://api.openweathermap.org/data/2.5/weather?q=houma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 253 of 1433 | nguiu
    http://api.openweathermap.org/data/2.5/weather?q=nguiu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 254 of 1433 | bom jesus
    http://api.openweathermap.org/data/2.5/weather?q=bom jesus&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 255 of 1433 | saldanha
    http://api.openweathermap.org/data/2.5/weather?q=saldanha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 256 of 1433 | bonavista
    http://api.openweathermap.org/data/2.5/weather?q=bonavista&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 257 of 1433 | nurota
    http://api.openweathermap.org/data/2.5/weather?q=nurota&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 258 of 1433 | lagdo
    http://api.openweathermap.org/data/2.5/weather?q=lagdo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 259 of 1433 | san quintin
    http://api.openweathermap.org/data/2.5/weather?q=san quintin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 260 of 1433 | kodiak
    http://api.openweathermap.org/data/2.5/weather?q=kodiak&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 261 of 1433 | havre-saint-pierre
    http://api.openweathermap.org/data/2.5/weather?q=havre-saint-pierre&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 262 of 1433 | mehamn
    http://api.openweathermap.org/data/2.5/weather?q=mehamn&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 263 of 1433 | harlingen
    http://api.openweathermap.org/data/2.5/weather?q=harlingen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 264 of 1433 | sinnamary
    http://api.openweathermap.org/data/2.5/weather?q=sinnamary&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 265 of 1433 | marsh harbour
    http://api.openweathermap.org/data/2.5/weather?q=marsh harbour&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 266 of 1433 | belushya guba
    http://api.openweathermap.org/data/2.5/weather?q=belushya guba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 267 of 1433 | luau
    http://api.openweathermap.org/data/2.5/weather?q=luau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 268 of 1433 | sao filipe
    http://api.openweathermap.org/data/2.5/weather?q=sao filipe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 269 of 1433 | khorixas
    http://api.openweathermap.org/data/2.5/weather?q=khorixas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 270 of 1433 | codrington
    http://api.openweathermap.org/data/2.5/weather?q=codrington&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 271 of 1433 | suifenhe
    http://api.openweathermap.org/data/2.5/weather?q=suifenhe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 272 of 1433 | dulce grande
    http://api.openweathermap.org/data/2.5/weather?q=dulce grande&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 273 of 1433 | eltham
    http://api.openweathermap.org/data/2.5/weather?q=eltham&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 274 of 1433 | hovd
    http://api.openweathermap.org/data/2.5/weather?q=hovd&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 275 of 1433 | fukue
    http://api.openweathermap.org/data/2.5/weather?q=fukue&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 276 of 1433 | ibra
    http://api.openweathermap.org/data/2.5/weather?q=ibra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 277 of 1433 | port hawkesbury
    http://api.openweathermap.org/data/2.5/weather?q=port hawkesbury&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 278 of 1433 | scarborough
    http://api.openweathermap.org/data/2.5/weather?q=scarborough&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 279 of 1433 | port-gentil
    http://api.openweathermap.org/data/2.5/weather?q=port-gentil&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 280 of 1433 | bol
    http://api.openweathermap.org/data/2.5/weather?q=bol&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 281 of 1433 | mandalgovi
    http://api.openweathermap.org/data/2.5/weather?q=mandalgovi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 282 of 1433 | isangel
    http://api.openweathermap.org/data/2.5/weather?q=isangel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 283 of 1433 | guerrero negro
    http://api.openweathermap.org/data/2.5/weather?q=guerrero negro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 284 of 1433 | bereda
    http://api.openweathermap.org/data/2.5/weather?q=bereda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 285 of 1433 | richards bay
    http://api.openweathermap.org/data/2.5/weather?q=richards bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 286 of 1433 | warqla
    http://api.openweathermap.org/data/2.5/weather?q=warqla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 287 of 1433 | mutis
    http://api.openweathermap.org/data/2.5/weather?q=mutis&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 288 of 1433 | mount gambier
    http://api.openweathermap.org/data/2.5/weather?q=mount gambier&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 289 of 1433 | alice springs
    http://api.openweathermap.org/data/2.5/weather?q=alice springs&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 290 of 1433 | santarem
    http://api.openweathermap.org/data/2.5/weather?q=santarem&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 291 of 1433 | fort morgan
    http://api.openweathermap.org/data/2.5/weather?q=fort morgan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 292 of 1433 | vanavara
    http://api.openweathermap.org/data/2.5/weather?q=vanavara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 293 of 1433 | waingapu
    http://api.openweathermap.org/data/2.5/weather?q=waingapu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 294 of 1433 | manzil jamil
    http://api.openweathermap.org/data/2.5/weather?q=manzil jamil&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 295 of 1433 | kavieng
    http://api.openweathermap.org/data/2.5/weather?q=kavieng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 296 of 1433 | iqaluit
    http://api.openweathermap.org/data/2.5/weather?q=iqaluit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 297 of 1433 | visby
    http://api.openweathermap.org/data/2.5/weather?q=visby&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 298 of 1433 | umm lajj
    http://api.openweathermap.org/data/2.5/weather?q=umm lajj&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 299 of 1433 | kruisfontein
    http://api.openweathermap.org/data/2.5/weather?q=kruisfontein&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 300 of 1433 | shimoda
    http://api.openweathermap.org/data/2.5/weather?q=shimoda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 301 of 1433 | borogontsy
    http://api.openweathermap.org/data/2.5/weather?q=borogontsy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 302 of 1433 | cabimas
    http://api.openweathermap.org/data/2.5/weather?q=cabimas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 303 of 1433 | atambua
    http://api.openweathermap.org/data/2.5/weather?q=atambua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 304 of 1433 | lorengau
    http://api.openweathermap.org/data/2.5/weather?q=lorengau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 305 of 1433 | azare
    http://api.openweathermap.org/data/2.5/weather?q=azare&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 306 of 1433 | kargala
    http://api.openweathermap.org/data/2.5/weather?q=kargala&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 307 of 1433 | batagay
    http://api.openweathermap.org/data/2.5/weather?q=batagay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 308 of 1433 | jiazi
    http://api.openweathermap.org/data/2.5/weather?q=jiazi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 309 of 1433 | port elizabeth
    http://api.openweathermap.org/data/2.5/weather?q=port elizabeth&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 310 of 1433 | rawannawi
    http://api.openweathermap.org/data/2.5/weather?q=rawannawi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 311 of 1433 | havlickuv brod
    http://api.openweathermap.org/data/2.5/weather?q=havlickuv brod&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 312 of 1433 | kingisepp
    http://api.openweathermap.org/data/2.5/weather?q=kingisepp&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 313 of 1433 | yuancheng
    http://api.openweathermap.org/data/2.5/weather?q=yuancheng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 314 of 1433 | vardo
    http://api.openweathermap.org/data/2.5/weather?q=vardo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 315 of 1433 | sitka
    http://api.openweathermap.org/data/2.5/weather?q=sitka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 316 of 1433 | buin
    http://api.openweathermap.org/data/2.5/weather?q=buin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 317 of 1433 | galle
    http://api.openweathermap.org/data/2.5/weather?q=galle&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 318 of 1433 | katangli
    http://api.openweathermap.org/data/2.5/weather?q=katangli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 319 of 1433 | hays
    http://api.openweathermap.org/data/2.5/weather?q=hays&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 320 of 1433 | conceicao do mato dentro
    http://api.openweathermap.org/data/2.5/weather?q=conceicao do mato dentro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 321 of 1433 | natal
    http://api.openweathermap.org/data/2.5/weather?q=natal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 322 of 1433 | alcantara
    http://api.openweathermap.org/data/2.5/weather?q=alcantara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 323 of 1433 | timaru
    http://api.openweathermap.org/data/2.5/weather?q=timaru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 324 of 1433 | namatanai
    http://api.openweathermap.org/data/2.5/weather?q=namatanai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 325 of 1433 | omsukchan
    http://api.openweathermap.org/data/2.5/weather?q=omsukchan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 326 of 1433 | vao
    http://api.openweathermap.org/data/2.5/weather?q=vao&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 327 of 1433 | bousso
    http://api.openweathermap.org/data/2.5/weather?q=bousso&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 328 of 1433 | la mata
    http://api.openweathermap.org/data/2.5/weather?q=la mata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 329 of 1433 | sanchursk
    http://api.openweathermap.org/data/2.5/weather?q=sanchursk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 330 of 1433 | saleaula
    http://api.openweathermap.org/data/2.5/weather?q=saleaula&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 331 of 1433 | santiago
    http://api.openweathermap.org/data/2.5/weather?q=santiago&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 332 of 1433 | labuhan
    http://api.openweathermap.org/data/2.5/weather?q=labuhan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 333 of 1433 | ambilobe
    http://api.openweathermap.org/data/2.5/weather?q=ambilobe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 334 of 1433 | pietarsaari
    http://api.openweathermap.org/data/2.5/weather?q=pietarsaari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 335 of 1433 | iracoubo
    http://api.openweathermap.org/data/2.5/weather?q=iracoubo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 336 of 1433 | fare
    http://api.openweathermap.org/data/2.5/weather?q=fare&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 337 of 1433 | hope
    http://api.openweathermap.org/data/2.5/weather?q=hope&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 338 of 1433 | port lincoln
    http://api.openweathermap.org/data/2.5/weather?q=port lincoln&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 339 of 1433 | flagstaff
    http://api.openweathermap.org/data/2.5/weather?q=flagstaff&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 340 of 1433 | west point
    http://api.openweathermap.org/data/2.5/weather?q=west point&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 341 of 1433 | abu samrah
    http://api.openweathermap.org/data/2.5/weather?q=abu samrah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 342 of 1433 | warora
    http://api.openweathermap.org/data/2.5/weather?q=warora&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 343 of 1433 | lanigan
    http://api.openweathermap.org/data/2.5/weather?q=lanigan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 344 of 1433 | caravelas
    http://api.openweathermap.org/data/2.5/weather?q=caravelas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 345 of 1433 | waitati
    http://api.openweathermap.org/data/2.5/weather?q=waitati&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 346 of 1433 | simao
    http://api.openweathermap.org/data/2.5/weather?q=simao&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 347 of 1433 | geraldton
    http://api.openweathermap.org/data/2.5/weather?q=geraldton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 348 of 1433 | ketchenery
    http://api.openweathermap.org/data/2.5/weather?q=ketchenery&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 349 of 1433 | goderich
    http://api.openweathermap.org/data/2.5/weather?q=goderich&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 350 of 1433 | acapulco
    http://api.openweathermap.org/data/2.5/weather?q=acapulco&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 351 of 1433 | burgersdorp
    http://api.openweathermap.org/data/2.5/weather?q=burgersdorp&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 352 of 1433 | salalah
    http://api.openweathermap.org/data/2.5/weather?q=salalah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 353 of 1433 | bourail
    http://api.openweathermap.org/data/2.5/weather?q=bourail&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 354 of 1433 | whitley bay
    http://api.openweathermap.org/data/2.5/weather?q=whitley bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 355 of 1433 | northam
    http://api.openweathermap.org/data/2.5/weather?q=northam&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 356 of 1433 | chaozhou
    http://api.openweathermap.org/data/2.5/weather?q=chaozhou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 357 of 1433 | hobyo
    http://api.openweathermap.org/data/2.5/weather?q=hobyo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 358 of 1433 | gawler
    http://api.openweathermap.org/data/2.5/weather?q=gawler&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 359 of 1433 | krasnoselkup
    http://api.openweathermap.org/data/2.5/weather?q=krasnoselkup&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 360 of 1433 | hue
    http://api.openweathermap.org/data/2.5/weather?q=hue&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 361 of 1433 | marcona
    http://api.openweathermap.org/data/2.5/weather?q=marcona&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 362 of 1433 | komsomolskiy
    http://api.openweathermap.org/data/2.5/weather?q=komsomolskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 363 of 1433 | talnakh
    http://api.openweathermap.org/data/2.5/weather?q=talnakh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 364 of 1433 | asau
    http://api.openweathermap.org/data/2.5/weather?q=asau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 365 of 1433 | hella
    http://api.openweathermap.org/data/2.5/weather?q=hella&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 366 of 1433 | calvinia
    http://api.openweathermap.org/data/2.5/weather?q=calvinia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 367 of 1433 | guicheng
    http://api.openweathermap.org/data/2.5/weather?q=guicheng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 368 of 1433 | bilibino
    http://api.openweathermap.org/data/2.5/weather?q=bilibino&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 369 of 1433 | jaisalmer
    http://api.openweathermap.org/data/2.5/weather?q=jaisalmer&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 370 of 1433 | cockburn town
    http://api.openweathermap.org/data/2.5/weather?q=cockburn town&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 371 of 1433 | tual
    http://api.openweathermap.org/data/2.5/weather?q=tual&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 372 of 1433 | thinadhoo
    http://api.openweathermap.org/data/2.5/weather?q=thinadhoo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 373 of 1433 | nabire
    http://api.openweathermap.org/data/2.5/weather?q=nabire&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 374 of 1433 | iranshahr
    http://api.openweathermap.org/data/2.5/weather?q=iranshahr&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 375 of 1433 | falmouth
    http://api.openweathermap.org/data/2.5/weather?q=falmouth&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 376 of 1433 | shingu
    http://api.openweathermap.org/data/2.5/weather?q=shingu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 377 of 1433 | moose factory
    http://api.openweathermap.org/data/2.5/weather?q=moose factory&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 378 of 1433 | cidreira
    http://api.openweathermap.org/data/2.5/weather?q=cidreira&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 379 of 1433 | norman wells
    http://api.openweathermap.org/data/2.5/weather?q=norman wells&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 380 of 1433 | lufilufi
    http://api.openweathermap.org/data/2.5/weather?q=lufilufi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 381 of 1433 | znamenka
    http://api.openweathermap.org/data/2.5/weather?q=znamenka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 382 of 1433 | egvekinot
    http://api.openweathermap.org/data/2.5/weather?q=egvekinot&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 383 of 1433 | eureka
    http://api.openweathermap.org/data/2.5/weather?q=eureka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 384 of 1433 | zhanakorgan
    http://api.openweathermap.org/data/2.5/weather?q=zhanakorgan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 385 of 1433 | orchard homes
    http://api.openweathermap.org/data/2.5/weather?q=orchard homes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 386 of 1433 | hakui
    http://api.openweathermap.org/data/2.5/weather?q=hakui&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 387 of 1433 | wencheng
    http://api.openweathermap.org/data/2.5/weather?q=wencheng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 388 of 1433 | kajaani
    http://api.openweathermap.org/data/2.5/weather?q=kajaani&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 389 of 1433 | anadyr
    http://api.openweathermap.org/data/2.5/weather?q=anadyr&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 390 of 1433 | cornwall
    http://api.openweathermap.org/data/2.5/weather?q=cornwall&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 391 of 1433 | kaitangata
    http://api.openweathermap.org/data/2.5/weather?q=kaitangata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 392 of 1433 | lodwar
    http://api.openweathermap.org/data/2.5/weather?q=lodwar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 393 of 1433 | sobolevo
    http://api.openweathermap.org/data/2.5/weather?q=sobolevo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 394 of 1433 | tessalit
    http://api.openweathermap.org/data/2.5/weather?q=tessalit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 395 of 1433 | narsaq
    http://api.openweathermap.org/data/2.5/weather?q=narsaq&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 396 of 1433 | clarence town
    http://api.openweathermap.org/data/2.5/weather?q=clarence town&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 397 of 1433 | okato
    http://api.openweathermap.org/data/2.5/weather?q=okato&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 398 of 1433 | barre
    http://api.openweathermap.org/data/2.5/weather?q=barre&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 399 of 1433 | kamenskoye
    http://api.openweathermap.org/data/2.5/weather?q=kamenskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 400 of 1433 | kalabo
    http://api.openweathermap.org/data/2.5/weather?q=kalabo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 401 of 1433 | tarakan
    http://api.openweathermap.org/data/2.5/weather?q=tarakan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 402 of 1433 | kerema
    http://api.openweathermap.org/data/2.5/weather?q=kerema&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 403 of 1433 | mizdah
    http://api.openweathermap.org/data/2.5/weather?q=mizdah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 404 of 1433 | jussara
    http://api.openweathermap.org/data/2.5/weather?q=jussara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 405 of 1433 | morgaushi
    http://api.openweathermap.org/data/2.5/weather?q=morgaushi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 406 of 1433 | nizwa
    http://api.openweathermap.org/data/2.5/weather?q=nizwa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 407 of 1433 | teguldet
    http://api.openweathermap.org/data/2.5/weather?q=teguldet&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 408 of 1433 | praia da vitoria
    http://api.openweathermap.org/data/2.5/weather?q=praia da vitoria&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 409 of 1433 | dombarovskiy
    http://api.openweathermap.org/data/2.5/weather?q=dombarovskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 410 of 1433 | ndele
    http://api.openweathermap.org/data/2.5/weather?q=ndele&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 411 of 1433 | xadani
    http://api.openweathermap.org/data/2.5/weather?q=xadani&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 412 of 1433 | porbandar
    http://api.openweathermap.org/data/2.5/weather?q=porbandar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 413 of 1433 | klaksvik
    http://api.openweathermap.org/data/2.5/weather?q=klaksvik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 414 of 1433 | north versailles
    http://api.openweathermap.org/data/2.5/weather?q=north versailles&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 415 of 1433 | tsihombe
    http://api.openweathermap.org/data/2.5/weather?q=tsihombe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 416 of 1433 | kota belud
    http://api.openweathermap.org/data/2.5/weather?q=kota belud&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 417 of 1433 | conceicao do araguaia
    http://api.openweathermap.org/data/2.5/weather?q=conceicao do araguaia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 418 of 1433 | grand gaube
    http://api.openweathermap.org/data/2.5/weather?q=grand gaube&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 419 of 1433 | aybak
    http://api.openweathermap.org/data/2.5/weather?q=aybak&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 420 of 1433 | necochea
    http://api.openweathermap.org/data/2.5/weather?q=necochea&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 421 of 1433 | oliver
    http://api.openweathermap.org/data/2.5/weather?q=oliver&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 422 of 1433 | hamilton
    http://api.openweathermap.org/data/2.5/weather?q=hamilton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 423 of 1433 | tidore
    http://api.openweathermap.org/data/2.5/weather?q=tidore&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 424 of 1433 | kuliyapitiya
    http://api.openweathermap.org/data/2.5/weather?q=kuliyapitiya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 425 of 1433 | marzuq
    http://api.openweathermap.org/data/2.5/weather?q=marzuq&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 426 of 1433 | olafsvik
    http://api.openweathermap.org/data/2.5/weather?q=olafsvik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 427 of 1433 | presidencia roque saenz pena
    http://api.openweathermap.org/data/2.5/weather?q=presidencia roque saenz pena&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 428 of 1433 | gambela
    http://api.openweathermap.org/data/2.5/weather?q=gambela&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 429 of 1433 | tibati
    http://api.openweathermap.org/data/2.5/weather?q=tibati&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 430 of 1433 | pisco
    http://api.openweathermap.org/data/2.5/weather?q=pisco&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 431 of 1433 | fairbanks
    http://api.openweathermap.org/data/2.5/weather?q=fairbanks&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 432 of 1433 | halalo
    http://api.openweathermap.org/data/2.5/weather?q=halalo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 433 of 1433 | greenville
    http://api.openweathermap.org/data/2.5/weather?q=greenville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 434 of 1433 | novotroitskaya
    http://api.openweathermap.org/data/2.5/weather?q=novotroitskaya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 435 of 1433 | rovaniemi
    http://api.openweathermap.org/data/2.5/weather?q=rovaniemi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 436 of 1433 | dodge city
    http://api.openweathermap.org/data/2.5/weather?q=dodge city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 437 of 1433 | pozo colorado
    http://api.openweathermap.org/data/2.5/weather?q=pozo colorado&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 438 of 1433 | yumen
    http://api.openweathermap.org/data/2.5/weather?q=yumen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 439 of 1433 | waimana
    http://api.openweathermap.org/data/2.5/weather?q=waimana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 440 of 1433 | okhotsk
    http://api.openweathermap.org/data/2.5/weather?q=okhotsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 441 of 1433 | kieta
    http://api.openweathermap.org/data/2.5/weather?q=kieta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 442 of 1433 | nalut
    http://api.openweathermap.org/data/2.5/weather?q=nalut&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 443 of 1433 | vila franca do campo
    http://api.openweathermap.org/data/2.5/weather?q=vila franca do campo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 444 of 1433 | beroroha
    http://api.openweathermap.org/data/2.5/weather?q=beroroha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 445 of 1433 | chiredzi
    http://api.openweathermap.org/data/2.5/weather?q=chiredzi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 446 of 1433 | sao joao da barra
    http://api.openweathermap.org/data/2.5/weather?q=sao joao da barra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 447 of 1433 | taksimo
    http://api.openweathermap.org/data/2.5/weather?q=taksimo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 448 of 1433 | morgan city
    http://api.openweathermap.org/data/2.5/weather?q=morgan city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 449 of 1433 | ampanihy
    http://api.openweathermap.org/data/2.5/weather?q=ampanihy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 450 of 1433 | narrabri
    http://api.openweathermap.org/data/2.5/weather?q=narrabri&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 451 of 1433 | odweyne
    http://api.openweathermap.org/data/2.5/weather?q=odweyne&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 452 of 1433 | kenai
    http://api.openweathermap.org/data/2.5/weather?q=kenai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 453 of 1433 | sindand
    http://api.openweathermap.org/data/2.5/weather?q=sindand&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 454 of 1433 | tianmen
    http://api.openweathermap.org/data/2.5/weather?q=tianmen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 455 of 1433 | ducheng
    http://api.openweathermap.org/data/2.5/weather?q=ducheng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 456 of 1433 | quballat
    http://api.openweathermap.org/data/2.5/weather?q=quballat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 457 of 1433 | inta
    http://api.openweathermap.org/data/2.5/weather?q=inta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 458 of 1433 | gimli
    http://api.openweathermap.org/data/2.5/weather?q=gimli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 459 of 1433 | chokwe
    http://api.openweathermap.org/data/2.5/weather?q=chokwe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 460 of 1433 | namtsy
    http://api.openweathermap.org/data/2.5/weather?q=namtsy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 461 of 1433 | satitoa
    http://api.openweathermap.org/data/2.5/weather?q=satitoa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 462 of 1433 | coquimbo
    http://api.openweathermap.org/data/2.5/weather?q=coquimbo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 463 of 1433 | gander
    http://api.openweathermap.org/data/2.5/weather?q=gander&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 464 of 1433 | batemans bay
    http://api.openweathermap.org/data/2.5/weather?q=batemans bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 465 of 1433 | arroio grande
    http://api.openweathermap.org/data/2.5/weather?q=arroio grande&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 466 of 1433 | sinjai
    http://api.openweathermap.org/data/2.5/weather?q=sinjai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 467 of 1433 | najran
    http://api.openweathermap.org/data/2.5/weather?q=najran&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 468 of 1433 | the pas
    http://api.openweathermap.org/data/2.5/weather?q=the pas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 469 of 1433 | urucara
    http://api.openweathermap.org/data/2.5/weather?q=urucara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 470 of 1433 | margate
    http://api.openweathermap.org/data/2.5/weather?q=margate&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 471 of 1433 | merauke
    http://api.openweathermap.org/data/2.5/weather?q=merauke&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 472 of 1433 | hokitika
    http://api.openweathermap.org/data/2.5/weather?q=hokitika&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 473 of 1433 | oriximina
    http://api.openweathermap.org/data/2.5/weather?q=oriximina&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 474 of 1433 | boden
    http://api.openweathermap.org/data/2.5/weather?q=boden&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 475 of 1433 | tamworth
    http://api.openweathermap.org/data/2.5/weather?q=tamworth&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 476 of 1433 | rawson
    http://api.openweathermap.org/data/2.5/weather?q=rawson&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 477 of 1433 | antalaha
    http://api.openweathermap.org/data/2.5/weather?q=antalaha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 478 of 1433 | faya
    http://api.openweathermap.org/data/2.5/weather?q=faya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 479 of 1433 | aklavik
    http://api.openweathermap.org/data/2.5/weather?q=aklavik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 480 of 1433 | mahina
    http://api.openweathermap.org/data/2.5/weather?q=mahina&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 481 of 1433 | zhezkazgan
    http://api.openweathermap.org/data/2.5/weather?q=zhezkazgan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 482 of 1433 | sampit
    http://api.openweathermap.org/data/2.5/weather?q=sampit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 483 of 1433 | mahibadhoo
    http://api.openweathermap.org/data/2.5/weather?q=mahibadhoo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 484 of 1433 | verkhoyansk
    http://api.openweathermap.org/data/2.5/weather?q=verkhoyansk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 485 of 1433 | kinablangan
    http://api.openweathermap.org/data/2.5/weather?q=kinablangan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 486 of 1433 | srednekolymsk
    http://api.openweathermap.org/data/2.5/weather?q=srednekolymsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 487 of 1433 | san cristobal
    http://api.openweathermap.org/data/2.5/weather?q=san cristobal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 488 of 1433 | mao
    http://api.openweathermap.org/data/2.5/weather?q=mao&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 489 of 1433 | fomboni
    http://api.openweathermap.org/data/2.5/weather?q=fomboni&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 490 of 1433 | swan hill
    http://api.openweathermap.org/data/2.5/weather?q=swan hill&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 491 of 1433 | west des moines
    http://api.openweathermap.org/data/2.5/weather?q=west des moines&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 492 of 1433 | pacific grove
    http://api.openweathermap.org/data/2.5/weather?q=pacific grove&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 493 of 1433 | bolobo
    http://api.openweathermap.org/data/2.5/weather?q=bolobo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 494 of 1433 | altona
    http://api.openweathermap.org/data/2.5/weather?q=altona&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 495 of 1433 | kazalinsk
    http://api.openweathermap.org/data/2.5/weather?q=kazalinsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 496 of 1433 | kuching
    http://api.openweathermap.org/data/2.5/weather?q=kuching&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 497 of 1433 | amboasary
    http://api.openweathermap.org/data/2.5/weather?q=amboasary&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 498 of 1433 | tromso
    http://api.openweathermap.org/data/2.5/weather?q=tromso&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 499 of 1433 | tautira
    http://api.openweathermap.org/data/2.5/weather?q=tautira&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 500 of 1433 | ulaangom
    http://api.openweathermap.org/data/2.5/weather?q=ulaangom&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 501 of 1433 | traunstein
    http://api.openweathermap.org/data/2.5/weather?q=traunstein&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 502 of 1433 | floro
    http://api.openweathermap.org/data/2.5/weather?q=floro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 503 of 1433 | lesosibirsk
    http://api.openweathermap.org/data/2.5/weather?q=lesosibirsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 504 of 1433 | canaries
    http://api.openweathermap.org/data/2.5/weather?q=canaries&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 505 of 1433 | ossora
    http://api.openweathermap.org/data/2.5/weather?q=ossora&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 506 of 1433 | petropavlovsk-kamchatskiy
    http://api.openweathermap.org/data/2.5/weather?q=petropavlovsk-kamchatskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 507 of 1433 | astoria
    http://api.openweathermap.org/data/2.5/weather?q=astoria&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 508 of 1433 | tawnat
    http://api.openweathermap.org/data/2.5/weather?q=tawnat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 509 of 1433 | port augusta
    http://api.openweathermap.org/data/2.5/weather?q=port augusta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 510 of 1433 | ambanja
    http://api.openweathermap.org/data/2.5/weather?q=ambanja&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 511 of 1433 | la ronge
    http://api.openweathermap.org/data/2.5/weather?q=la ronge&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 512 of 1433 | omboue
    http://api.openweathermap.org/data/2.5/weather?q=omboue&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 513 of 1433 | jizan
    http://api.openweathermap.org/data/2.5/weather?q=jizan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 514 of 1433 | port blair
    http://api.openweathermap.org/data/2.5/weather?q=port blair&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 515 of 1433 | nemuro
    http://api.openweathermap.org/data/2.5/weather?q=nemuro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 516 of 1433 | portland
    http://api.openweathermap.org/data/2.5/weather?q=portland&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 517 of 1433 | laguna
    http://api.openweathermap.org/data/2.5/weather?q=laguna&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 518 of 1433 | erzin
    http://api.openweathermap.org/data/2.5/weather?q=erzin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 519 of 1433 | merrill
    http://api.openweathermap.org/data/2.5/weather?q=merrill&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 520 of 1433 | mokshan
    http://api.openweathermap.org/data/2.5/weather?q=mokshan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 521 of 1433 | tabory
    http://api.openweathermap.org/data/2.5/weather?q=tabory&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 522 of 1433 | chapais
    http://api.openweathermap.org/data/2.5/weather?q=chapais&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 523 of 1433 | gazli
    http://api.openweathermap.org/data/2.5/weather?q=gazli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 524 of 1433 | farmington
    http://api.openweathermap.org/data/2.5/weather?q=farmington&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 525 of 1433 | jinka
    http://api.openweathermap.org/data/2.5/weather?q=jinka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 526 of 1433 | ust-nera
    http://api.openweathermap.org/data/2.5/weather?q=ust-nera&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 527 of 1433 | riyadh
    http://api.openweathermap.org/data/2.5/weather?q=riyadh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 528 of 1433 | srandakan
    http://api.openweathermap.org/data/2.5/weather?q=srandakan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 529 of 1433 | tabiauea
    http://api.openweathermap.org/data/2.5/weather?q=tabiauea&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 530 of 1433 | comodoro rivadavia
    http://api.openweathermap.org/data/2.5/weather?q=comodoro rivadavia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 531 of 1433 | keshan
    http://api.openweathermap.org/data/2.5/weather?q=keshan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 532 of 1433 | axim
    http://api.openweathermap.org/data/2.5/weather?q=axim&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 533 of 1433 | eyl
    http://api.openweathermap.org/data/2.5/weather?q=eyl&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 534 of 1433 | grindavik
    http://api.openweathermap.org/data/2.5/weather?q=grindavik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 535 of 1433 | ksenyevka
    http://api.openweathermap.org/data/2.5/weather?q=ksenyevka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 536 of 1433 | takoradi
    http://api.openweathermap.org/data/2.5/weather?q=takoradi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 537 of 1433 | roseburg
    http://api.openweathermap.org/data/2.5/weather?q=roseburg&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 538 of 1433 | brooks
    http://api.openweathermap.org/data/2.5/weather?q=brooks&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 539 of 1433 | inirida
    http://api.openweathermap.org/data/2.5/weather?q=inirida&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 540 of 1433 | vyartsilya
    http://api.openweathermap.org/data/2.5/weather?q=vyartsilya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 541 of 1433 | bambanglipuro
    http://api.openweathermap.org/data/2.5/weather?q=bambanglipuro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 542 of 1433 | zhoucheng
    http://api.openweathermap.org/data/2.5/weather?q=zhoucheng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 543 of 1433 | livingstone
    http://api.openweathermap.org/data/2.5/weather?q=livingstone&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 544 of 1433 | impfondo
    http://api.openweathermap.org/data/2.5/weather?q=impfondo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 545 of 1433 | hearst
    http://api.openweathermap.org/data/2.5/weather?q=hearst&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 546 of 1433 | salina
    http://api.openweathermap.org/data/2.5/weather?q=salina&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 547 of 1433 | lambarene
    http://api.openweathermap.org/data/2.5/weather?q=lambarene&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 548 of 1433 | tahta
    http://api.openweathermap.org/data/2.5/weather?q=tahta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 549 of 1433 | yala
    http://api.openweathermap.org/data/2.5/weather?q=yala&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 550 of 1433 | santa isabel do rio negro
    http://api.openweathermap.org/data/2.5/weather?q=santa isabel do rio negro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 551 of 1433 | mbamba
    http://api.openweathermap.org/data/2.5/weather?q=mbamba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 552 of 1433 | zabol
    http://api.openweathermap.org/data/2.5/weather?q=zabol&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 553 of 1433 | ballina
    http://api.openweathermap.org/data/2.5/weather?q=ballina&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 554 of 1433 | montepuez
    http://api.openweathermap.org/data/2.5/weather?q=montepuez&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 555 of 1433 | brae
    http://api.openweathermap.org/data/2.5/weather?q=brae&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 556 of 1433 | nirgua
    http://api.openweathermap.org/data/2.5/weather?q=nirgua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 557 of 1433 | gevgelija
    http://api.openweathermap.org/data/2.5/weather?q=gevgelija&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 558 of 1433 | voh
    http://api.openweathermap.org/data/2.5/weather?q=voh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 559 of 1433 | sulangan
    http://api.openweathermap.org/data/2.5/weather?q=sulangan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 560 of 1433 | sayaxche
    http://api.openweathermap.org/data/2.5/weather?q=sayaxche&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 561 of 1433 | nattarasankottai
    http://api.openweathermap.org/data/2.5/weather?q=nattarasankottai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 562 of 1433 | barra dos coqueiros
    http://api.openweathermap.org/data/2.5/weather?q=barra dos coqueiros&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 563 of 1433 | tha chang
    http://api.openweathermap.org/data/2.5/weather?q=tha chang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 564 of 1433 | sangmelima
    http://api.openweathermap.org/data/2.5/weather?q=sangmelima&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 565 of 1433 | yarada
    http://api.openweathermap.org/data/2.5/weather?q=yarada&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 566 of 1433 | hami
    http://api.openweathermap.org/data/2.5/weather?q=hami&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 567 of 1433 | jumla
    http://api.openweathermap.org/data/2.5/weather?q=jumla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 568 of 1433 | westport
    http://api.openweathermap.org/data/2.5/weather?q=westport&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 569 of 1433 | zonguldak
    http://api.openweathermap.org/data/2.5/weather?q=zonguldak&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 570 of 1433 | kandrian
    http://api.openweathermap.org/data/2.5/weather?q=kandrian&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 571 of 1433 | kerrville
    http://api.openweathermap.org/data/2.5/weather?q=kerrville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 572 of 1433 | jais
    http://api.openweathermap.org/data/2.5/weather?q=jais&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 573 of 1433 | knyaginino
    http://api.openweathermap.org/data/2.5/weather?q=knyaginino&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 574 of 1433 | marfino
    http://api.openweathermap.org/data/2.5/weather?q=marfino&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 575 of 1433 | ravar
    http://api.openweathermap.org/data/2.5/weather?q=ravar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 576 of 1433 | bataipora
    http://api.openweathermap.org/data/2.5/weather?q=bataipora&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 577 of 1433 | awjilah
    http://api.openweathermap.org/data/2.5/weather?q=awjilah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 578 of 1433 | saint-pierre
    http://api.openweathermap.org/data/2.5/weather?q=saint-pierre&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 579 of 1433 | winslow
    http://api.openweathermap.org/data/2.5/weather?q=winslow&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 580 of 1433 | yorosso
    http://api.openweathermap.org/data/2.5/weather?q=yorosso&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 581 of 1433 | jaciara
    http://api.openweathermap.org/data/2.5/weather?q=jaciara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 582 of 1433 | gijon
    http://api.openweathermap.org/data/2.5/weather?q=gijon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 583 of 1433 | pedasi
    http://api.openweathermap.org/data/2.5/weather?q=pedasi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 584 of 1433 | tubuala
    http://api.openweathermap.org/data/2.5/weather?q=tubuala&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 585 of 1433 | alotau
    http://api.openweathermap.org/data/2.5/weather?q=alotau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 586 of 1433 | canutama
    http://api.openweathermap.org/data/2.5/weather?q=canutama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 587 of 1433 | bilgoraj
    http://api.openweathermap.org/data/2.5/weather?q=bilgoraj&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 588 of 1433 | wa
    http://api.openweathermap.org/data/2.5/weather?q=wa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 589 of 1433 | nesna
    http://api.openweathermap.org/data/2.5/weather?q=nesna&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 590 of 1433 | avera
    http://api.openweathermap.org/data/2.5/weather?q=avera&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 591 of 1433 | zhigansk
    http://api.openweathermap.org/data/2.5/weather?q=zhigansk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 592 of 1433 | yelbarga
    http://api.openweathermap.org/data/2.5/weather?q=yelbarga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 593 of 1433 | sayyan
    http://api.openweathermap.org/data/2.5/weather?q=sayyan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 594 of 1433 | mabaruma
    http://api.openweathermap.org/data/2.5/weather?q=mabaruma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 595 of 1433 | durusu
    http://api.openweathermap.org/data/2.5/weather?q=durusu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 596 of 1433 | tarrafal
    http://api.openweathermap.org/data/2.5/weather?q=tarrafal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 597 of 1433 | biak
    http://api.openweathermap.org/data/2.5/weather?q=biak&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 598 of 1433 | ondorhaan
    http://api.openweathermap.org/data/2.5/weather?q=ondorhaan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 599 of 1433 | sorland
    http://api.openweathermap.org/data/2.5/weather?q=sorland&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 600 of 1433 | lasa
    http://api.openweathermap.org/data/2.5/weather?q=lasa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 601 of 1433 | bowen
    http://api.openweathermap.org/data/2.5/weather?q=bowen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 602 of 1433 | dalbandin
    http://api.openweathermap.org/data/2.5/weather?q=dalbandin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 603 of 1433 | darnah
    http://api.openweathermap.org/data/2.5/weather?q=darnah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 604 of 1433 | banes
    http://api.openweathermap.org/data/2.5/weather?q=banes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 605 of 1433 | haines junction
    http://api.openweathermap.org/data/2.5/weather?q=haines junction&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 606 of 1433 | mendi
    http://api.openweathermap.org/data/2.5/weather?q=mendi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 607 of 1433 | meadow lake
    http://api.openweathermap.org/data/2.5/weather?q=meadow lake&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 608 of 1433 | rungata
    http://api.openweathermap.org/data/2.5/weather?q=rungata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 609 of 1433 | antofagasta
    http://api.openweathermap.org/data/2.5/weather?q=antofagasta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 610 of 1433 | rio cuarto
    http://api.openweathermap.org/data/2.5/weather?q=rio cuarto&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 611 of 1433 | port-cartier
    http://api.openweathermap.org/data/2.5/weather?q=port-cartier&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 612 of 1433 | ogaminana
    http://api.openweathermap.org/data/2.5/weather?q=ogaminana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 613 of 1433 | yatou
    http://api.openweathermap.org/data/2.5/weather?q=yatou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 614 of 1433 | dolbeau
    http://api.openweathermap.org/data/2.5/weather?q=dolbeau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 615 of 1433 | mason city
    http://api.openweathermap.org/data/2.5/weather?q=mason city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 616 of 1433 | port keats
    http://api.openweathermap.org/data/2.5/weather?q=port keats&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 617 of 1433 | jacareacanga
    http://api.openweathermap.org/data/2.5/weather?q=jacareacanga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 618 of 1433 | compostela
    http://api.openweathermap.org/data/2.5/weather?q=compostela&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 619 of 1433 | kwinana
    http://api.openweathermap.org/data/2.5/weather?q=kwinana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 620 of 1433 | ivdel
    http://api.openweathermap.org/data/2.5/weather?q=ivdel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 621 of 1433 | ledyard
    http://api.openweathermap.org/data/2.5/weather?q=ledyard&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 622 of 1433 | ajaccio
    http://api.openweathermap.org/data/2.5/weather?q=ajaccio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 623 of 1433 | turayf
    http://api.openweathermap.org/data/2.5/weather?q=turayf&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 624 of 1433 | kamenka
    http://api.openweathermap.org/data/2.5/weather?q=kamenka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 625 of 1433 | rio grande
    http://api.openweathermap.org/data/2.5/weather?q=rio grande&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 626 of 1433 | tabou
    http://api.openweathermap.org/data/2.5/weather?q=tabou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 627 of 1433 | vila velha
    http://api.openweathermap.org/data/2.5/weather?q=vila velha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 628 of 1433 | bima
    http://api.openweathermap.org/data/2.5/weather?q=bima&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 629 of 1433 | razole
    http://api.openweathermap.org/data/2.5/weather?q=razole&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 630 of 1433 | kloulklubed
    http://api.openweathermap.org/data/2.5/weather?q=kloulklubed&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 631 of 1433 | malpe
    http://api.openweathermap.org/data/2.5/weather?q=malpe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 632 of 1433 | saint-leu
    http://api.openweathermap.org/data/2.5/weather?q=saint-leu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 633 of 1433 | umzimvubu
    http://api.openweathermap.org/data/2.5/weather?q=umzimvubu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 634 of 1433 | west wendover
    http://api.openweathermap.org/data/2.5/weather?q=west wendover&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 635 of 1433 | asfi
    http://api.openweathermap.org/data/2.5/weather?q=asfi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 636 of 1433 | posevnaya
    http://api.openweathermap.org/data/2.5/weather?q=posevnaya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 637 of 1433 | dharchula
    http://api.openweathermap.org/data/2.5/weather?q=dharchula&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 638 of 1433 | hutchinson
    http://api.openweathermap.org/data/2.5/weather?q=hutchinson&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 639 of 1433 | kalmunai
    http://api.openweathermap.org/data/2.5/weather?q=kalmunai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 640 of 1433 | ware
    http://api.openweathermap.org/data/2.5/weather?q=ware&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 641 of 1433 | carutapera
    http://api.openweathermap.org/data/2.5/weather?q=carutapera&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 642 of 1433 | belmonte
    http://api.openweathermap.org/data/2.5/weather?q=belmonte&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 643 of 1433 | buala
    http://api.openweathermap.org/data/2.5/weather?q=buala&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 644 of 1433 | leningradskiy
    http://api.openweathermap.org/data/2.5/weather?q=leningradskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 645 of 1433 | peru
    http://api.openweathermap.org/data/2.5/weather?q=peru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 646 of 1433 | azul
    http://api.openweathermap.org/data/2.5/weather?q=azul&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 647 of 1433 | artyom
    http://api.openweathermap.org/data/2.5/weather?q=artyom&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 648 of 1433 | waipawa
    http://api.openweathermap.org/data/2.5/weather?q=waipawa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 649 of 1433 | constitucion
    http://api.openweathermap.org/data/2.5/weather?q=constitucion&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 650 of 1433 | sangalhos
    http://api.openweathermap.org/data/2.5/weather?q=sangalhos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 651 of 1433 | bording
    http://api.openweathermap.org/data/2.5/weather?q=bording&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 652 of 1433 | manggar
    http://api.openweathermap.org/data/2.5/weather?q=manggar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 653 of 1433 | los llanos de aridane
    http://api.openweathermap.org/data/2.5/weather?q=los llanos de aridane&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 654 of 1433 | boo
    http://api.openweathermap.org/data/2.5/weather?q=boo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 655 of 1433 | cabinda
    http://api.openweathermap.org/data/2.5/weather?q=cabinda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 656 of 1433 | darovskoy
    http://api.openweathermap.org/data/2.5/weather?q=darovskoy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 657 of 1433 | sao jose da coroa grande
    http://api.openweathermap.org/data/2.5/weather?q=sao jose da coroa grande&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 658 of 1433 | hetauda
    http://api.openweathermap.org/data/2.5/weather?q=hetauda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 659 of 1433 | ha
    http://api.openweathermap.org/data/2.5/weather?q=ha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 660 of 1433 | chantada
    http://api.openweathermap.org/data/2.5/weather?q=chantada&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 661 of 1433 | sidi bu zayd
    http://api.openweathermap.org/data/2.5/weather?q=sidi bu zayd&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 662 of 1433 | ahipara
    http://api.openweathermap.org/data/2.5/weather?q=ahipara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 663 of 1433 | porto walter
    http://api.openweathermap.org/data/2.5/weather?q=porto walter&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 664 of 1433 | honiara
    http://api.openweathermap.org/data/2.5/weather?q=honiara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 665 of 1433 | kosh-agach
    http://api.openweathermap.org/data/2.5/weather?q=kosh-agach&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 666 of 1433 | fivizzano
    http://api.openweathermap.org/data/2.5/weather?q=fivizzano&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 667 of 1433 | louisbourg
    http://api.openweathermap.org/data/2.5/weather?q=louisbourg&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 668 of 1433 | matara
    http://api.openweathermap.org/data/2.5/weather?q=matara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 669 of 1433 | pundaguitan
    http://api.openweathermap.org/data/2.5/weather?q=pundaguitan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 670 of 1433 | sola
    http://api.openweathermap.org/data/2.5/weather?q=sola&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 671 of 1433 | san luis
    http://api.openweathermap.org/data/2.5/weather?q=san luis&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 672 of 1433 | ust-omchug
    http://api.openweathermap.org/data/2.5/weather?q=ust-omchug&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 673 of 1433 | nioro
    http://api.openweathermap.org/data/2.5/weather?q=nioro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 674 of 1433 | chibombo
    http://api.openweathermap.org/data/2.5/weather?q=chibombo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 675 of 1433 | korsor
    http://api.openweathermap.org/data/2.5/weather?q=korsor&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 676 of 1433 | shelburne
    http://api.openweathermap.org/data/2.5/weather?q=shelburne&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 677 of 1433 | arkhara
    http://api.openweathermap.org/data/2.5/weather?q=arkhara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 678 of 1433 | high level
    http://api.openweathermap.org/data/2.5/weather?q=high level&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 679 of 1433 | kannod
    http://api.openweathermap.org/data/2.5/weather?q=kannod&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 680 of 1433 | palmer
    http://api.openweathermap.org/data/2.5/weather?q=palmer&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 681 of 1433 | palauig
    http://api.openweathermap.org/data/2.5/weather?q=palauig&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 682 of 1433 | lakes entrance
    http://api.openweathermap.org/data/2.5/weather?q=lakes entrance&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 683 of 1433 | san miguel
    http://api.openweathermap.org/data/2.5/weather?q=san miguel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 684 of 1433 | youkounkoun
    http://api.openweathermap.org/data/2.5/weather?q=youkounkoun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 685 of 1433 | saint anthony
    http://api.openweathermap.org/data/2.5/weather?q=saint anthony&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 686 of 1433 | zelenogorskiy
    http://api.openweathermap.org/data/2.5/weather?q=zelenogorskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 687 of 1433 | eldikan
    http://api.openweathermap.org/data/2.5/weather?q=eldikan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 688 of 1433 | mnogovershinnyy
    http://api.openweathermap.org/data/2.5/weather?q=mnogovershinnyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 689 of 1433 | shu
    http://api.openweathermap.org/data/2.5/weather?q=shu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 690 of 1433 | drayton valley
    http://api.openweathermap.org/data/2.5/weather?q=drayton valley&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 691 of 1433 | shache
    http://api.openweathermap.org/data/2.5/weather?q=shache&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 692 of 1433 | cairns
    http://api.openweathermap.org/data/2.5/weather?q=cairns&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 693 of 1433 | kharan
    http://api.openweathermap.org/data/2.5/weather?q=kharan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 694 of 1433 | padre paraiso
    http://api.openweathermap.org/data/2.5/weather?q=padre paraiso&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 695 of 1433 | kavaratti
    http://api.openweathermap.org/data/2.5/weather?q=kavaratti&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 696 of 1433 | norden
    http://api.openweathermap.org/data/2.5/weather?q=norden&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 697 of 1433 | russell
    http://api.openweathermap.org/data/2.5/weather?q=russell&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 698 of 1433 | minab
    http://api.openweathermap.org/data/2.5/weather?q=minab&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 699 of 1433 | turukhansk
    http://api.openweathermap.org/data/2.5/weather?q=turukhansk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 700 of 1433 | leshukonskoye
    http://api.openweathermap.org/data/2.5/weather?q=leshukonskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 701 of 1433 | kushmurun
    http://api.openweathermap.org/data/2.5/weather?q=kushmurun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 702 of 1433 | carauari
    http://api.openweathermap.org/data/2.5/weather?q=carauari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 703 of 1433 | mogadouro
    http://api.openweathermap.org/data/2.5/weather?q=mogadouro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 704 of 1433 | arlit
    http://api.openweathermap.org/data/2.5/weather?q=arlit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 705 of 1433 | ratnagiri
    http://api.openweathermap.org/data/2.5/weather?q=ratnagiri&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 706 of 1433 | bealanana
    http://api.openweathermap.org/data/2.5/weather?q=bealanana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 707 of 1433 | beian
    http://api.openweathermap.org/data/2.5/weather?q=beian&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 708 of 1433 | mae hong son
    http://api.openweathermap.org/data/2.5/weather?q=mae hong son&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 709 of 1433 | baghdad
    http://api.openweathermap.org/data/2.5/weather?q=baghdad&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 710 of 1433 | tuxtla gutierrez
    http://api.openweathermap.org/data/2.5/weather?q=tuxtla gutierrez&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 711 of 1433 | la sarre
    http://api.openweathermap.org/data/2.5/weather?q=la sarre&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 712 of 1433 | lagoa
    http://api.openweathermap.org/data/2.5/weather?q=lagoa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 713 of 1433 | fort nelson
    http://api.openweathermap.org/data/2.5/weather?q=fort nelson&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 714 of 1433 | kendari
    http://api.openweathermap.org/data/2.5/weather?q=kendari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 715 of 1433 | murmashi
    http://api.openweathermap.org/data/2.5/weather?q=murmashi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 716 of 1433 | zhaotong
    http://api.openweathermap.org/data/2.5/weather?q=zhaotong&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 717 of 1433 | yenagoa
    http://api.openweathermap.org/data/2.5/weather?q=yenagoa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 718 of 1433 | bucerias
    http://api.openweathermap.org/data/2.5/weather?q=bucerias&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 719 of 1433 | ayer itam
    http://api.openweathermap.org/data/2.5/weather?q=ayer itam&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 720 of 1433 | wagar
    http://api.openweathermap.org/data/2.5/weather?q=wagar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 721 of 1433 | guiren
    http://api.openweathermap.org/data/2.5/weather?q=guiren&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 722 of 1433 | sarany
    http://api.openweathermap.org/data/2.5/weather?q=sarany&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 723 of 1433 | saint-dizier
    http://api.openweathermap.org/data/2.5/weather?q=saint-dizier&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 724 of 1433 | ituni
    http://api.openweathermap.org/data/2.5/weather?q=ituni&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 725 of 1433 | beaverlodge
    http://api.openweathermap.org/data/2.5/weather?q=beaverlodge&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 726 of 1433 | vestmanna
    http://api.openweathermap.org/data/2.5/weather?q=vestmanna&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 727 of 1433 | price
    http://api.openweathermap.org/data/2.5/weather?q=price&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 728 of 1433 | oktyabrskoye
    http://api.openweathermap.org/data/2.5/weather?q=oktyabrskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 729 of 1433 | at-bashi
    http://api.openweathermap.org/data/2.5/weather?q=at-bashi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 730 of 1433 | maniitsoq
    http://api.openweathermap.org/data/2.5/weather?q=maniitsoq&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 731 of 1433 | curup
    http://api.openweathermap.org/data/2.5/weather?q=curup&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 732 of 1433 | rocha
    http://api.openweathermap.org/data/2.5/weather?q=rocha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 733 of 1433 | tigil
    http://api.openweathermap.org/data/2.5/weather?q=tigil&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 734 of 1433 | salinopolis
    http://api.openweathermap.org/data/2.5/weather?q=salinopolis&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 735 of 1433 | nuuk
    http://api.openweathermap.org/data/2.5/weather?q=nuuk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 736 of 1433 | mackay
    http://api.openweathermap.org/data/2.5/weather?q=mackay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 737 of 1433 | komatipoort
    http://api.openweathermap.org/data/2.5/weather?q=komatipoort&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 738 of 1433 | nara
    http://api.openweathermap.org/data/2.5/weather?q=nara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 739 of 1433 | cayenne
    http://api.openweathermap.org/data/2.5/weather?q=cayenne&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 740 of 1433 | severnyy
    http://api.openweathermap.org/data/2.5/weather?q=severnyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 741 of 1433 | rock springs
    http://api.openweathermap.org/data/2.5/weather?q=rock springs&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 742 of 1433 | sillod
    http://api.openweathermap.org/data/2.5/weather?q=sillod&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 743 of 1433 | kholtoson
    http://api.openweathermap.org/data/2.5/weather?q=kholtoson&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 744 of 1433 | ngunguru
    http://api.openweathermap.org/data/2.5/weather?q=ngunguru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 745 of 1433 | yairipok
    http://api.openweathermap.org/data/2.5/weather?q=yairipok&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 746 of 1433 | kamaishi
    http://api.openweathermap.org/data/2.5/weather?q=kamaishi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 747 of 1433 | atbasar
    http://api.openweathermap.org/data/2.5/weather?q=atbasar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 748 of 1433 | broome
    http://api.openweathermap.org/data/2.5/weather?q=broome&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 749 of 1433 | casper
    http://api.openweathermap.org/data/2.5/weather?q=casper&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 750 of 1433 | pangody
    http://api.openweathermap.org/data/2.5/weather?q=pangody&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 751 of 1433 | sorvag
    http://api.openweathermap.org/data/2.5/weather?q=sorvag&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 752 of 1433 | polovinnoye
    http://api.openweathermap.org/data/2.5/weather?q=polovinnoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 753 of 1433 | oranjestad
    http://api.openweathermap.org/data/2.5/weather?q=oranjestad&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 754 of 1433 | yirol
    http://api.openweathermap.org/data/2.5/weather?q=yirol&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 755 of 1433 | dubbo
    http://api.openweathermap.org/data/2.5/weather?q=dubbo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 756 of 1433 | karaton
    http://api.openweathermap.org/data/2.5/weather?q=karaton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 757 of 1433 | santa marta
    http://api.openweathermap.org/data/2.5/weather?q=santa marta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 758 of 1433 | boyuibe
    http://api.openweathermap.org/data/2.5/weather?q=boyuibe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 759 of 1433 | grand terrace
    http://api.openweathermap.org/data/2.5/weather?q=grand terrace&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 760 of 1433 | descalvado
    http://api.openweathermap.org/data/2.5/weather?q=descalvado&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 761 of 1433 | aksu
    http://api.openweathermap.org/data/2.5/weather?q=aksu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 762 of 1433 | udachnyy
    http://api.openweathermap.org/data/2.5/weather?q=udachnyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 763 of 1433 | karratha
    http://api.openweathermap.org/data/2.5/weather?q=karratha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 764 of 1433 | pemberton
    http://api.openweathermap.org/data/2.5/weather?q=pemberton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 765 of 1433 | mokolo
    http://api.openweathermap.org/data/2.5/weather?q=mokolo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 766 of 1433 | chakwal
    http://api.openweathermap.org/data/2.5/weather?q=chakwal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 767 of 1433 | golden
    http://api.openweathermap.org/data/2.5/weather?q=golden&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 768 of 1433 | phan thiet
    http://api.openweathermap.org/data/2.5/weather?q=phan thiet&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 769 of 1433 | emba
    http://api.openweathermap.org/data/2.5/weather?q=emba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 770 of 1433 | radenci
    http://api.openweathermap.org/data/2.5/weather?q=radenci&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 771 of 1433 | herat
    http://api.openweathermap.org/data/2.5/weather?q=herat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 772 of 1433 | pontes e lacerda
    http://api.openweathermap.org/data/2.5/weather?q=pontes e lacerda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 773 of 1433 | kemijarvi
    http://api.openweathermap.org/data/2.5/weather?q=kemijarvi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 774 of 1433 | lenart
    http://api.openweathermap.org/data/2.5/weather?q=lenart&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 775 of 1433 | ozernovskiy
    http://api.openweathermap.org/data/2.5/weather?q=ozernovskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 776 of 1433 | oskarshamn
    http://api.openweathermap.org/data/2.5/weather?q=oskarshamn&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 777 of 1433 | tete
    http://api.openweathermap.org/data/2.5/weather?q=tete&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 778 of 1433 | aqtobe
    http://api.openweathermap.org/data/2.5/weather?q=aqtobe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 779 of 1433 | catalina foothills
    http://api.openweathermap.org/data/2.5/weather?q=catalina foothills&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 780 of 1433 | ziyamet
    http://api.openweathermap.org/data/2.5/weather?q=ziyamet&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 781 of 1433 | iskandar
    http://api.openweathermap.org/data/2.5/weather?q=iskandar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 782 of 1433 | shitkino
    http://api.openweathermap.org/data/2.5/weather?q=shitkino&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 783 of 1433 | gravdal
    http://api.openweathermap.org/data/2.5/weather?q=gravdal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 784 of 1433 | peniche
    http://api.openweathermap.org/data/2.5/weather?q=peniche&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 785 of 1433 | armacao dos buzios
    http://api.openweathermap.org/data/2.5/weather?q=armacao dos buzios&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 786 of 1433 | shenjiamen
    http://api.openweathermap.org/data/2.5/weather?q=shenjiamen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 787 of 1433 | sol-iletsk
    http://api.openweathermap.org/data/2.5/weather?q=sol-iletsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 788 of 1433 | fergus falls
    http://api.openweathermap.org/data/2.5/weather?q=fergus falls&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 789 of 1433 | wahran
    http://api.openweathermap.org/data/2.5/weather?q=wahran&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 790 of 1433 | nizhniy odes
    http://api.openweathermap.org/data/2.5/weather?q=nizhniy odes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 791 of 1433 | kuche
    http://api.openweathermap.org/data/2.5/weather?q=kuche&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 792 of 1433 | ardatov
    http://api.openweathermap.org/data/2.5/weather?q=ardatov&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 793 of 1433 | sibolga
    http://api.openweathermap.org/data/2.5/weather?q=sibolga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 794 of 1433 | pinawa
    http://api.openweathermap.org/data/2.5/weather?q=pinawa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 795 of 1433 | susanville
    http://api.openweathermap.org/data/2.5/weather?q=susanville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 796 of 1433 | ayan
    http://api.openweathermap.org/data/2.5/weather?q=ayan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 797 of 1433 | yerofey pavlovich
    http://api.openweathermap.org/data/2.5/weather?q=yerofey pavlovich&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 798 of 1433 | garoua
    http://api.openweathermap.org/data/2.5/weather?q=garoua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 799 of 1433 | mayumba
    http://api.openweathermap.org/data/2.5/weather?q=mayumba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 800 of 1433 | misratah
    http://api.openweathermap.org/data/2.5/weather?q=misratah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 801 of 1433 | noumea
    http://api.openweathermap.org/data/2.5/weather?q=noumea&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 802 of 1433 | prokuplje
    http://api.openweathermap.org/data/2.5/weather?q=prokuplje&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 803 of 1433 | rimouski
    http://api.openweathermap.org/data/2.5/weather?q=rimouski&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 804 of 1433 | nanfeng
    http://api.openweathermap.org/data/2.5/weather?q=nanfeng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 805 of 1433 | ekibastuz
    http://api.openweathermap.org/data/2.5/weather?q=ekibastuz&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 806 of 1433 | sal rei
    http://api.openweathermap.org/data/2.5/weather?q=sal rei&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 807 of 1433 | rockport
    http://api.openweathermap.org/data/2.5/weather?q=rockport&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 808 of 1433 | canete
    http://api.openweathermap.org/data/2.5/weather?q=canete&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 809 of 1433 | diego de almagro
    http://api.openweathermap.org/data/2.5/weather?q=diego de almagro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 810 of 1433 | inyonga
    http://api.openweathermap.org/data/2.5/weather?q=inyonga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 811 of 1433 | torrelavega
    http://api.openweathermap.org/data/2.5/weather?q=torrelavega&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 812 of 1433 | tiarei
    http://api.openweathermap.org/data/2.5/weather?q=tiarei&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 813 of 1433 | grand centre
    http://api.openweathermap.org/data/2.5/weather?q=grand centre&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 814 of 1433 | kundla
    http://api.openweathermap.org/data/2.5/weather?q=kundla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 815 of 1433 | izhma
    http://api.openweathermap.org/data/2.5/weather?q=izhma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 816 of 1433 | niwari
    http://api.openweathermap.org/data/2.5/weather?q=niwari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 817 of 1433 | karachi
    http://api.openweathermap.org/data/2.5/weather?q=karachi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 818 of 1433 | nouakchott
    http://api.openweathermap.org/data/2.5/weather?q=nouakchott&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 819 of 1433 | zanjan
    http://api.openweathermap.org/data/2.5/weather?q=zanjan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 820 of 1433 | nosy varika
    http://api.openweathermap.org/data/2.5/weather?q=nosy varika&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 821 of 1433 | novo aripuana
    http://api.openweathermap.org/data/2.5/weather?q=novo aripuana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 822 of 1433 | san ramon
    http://api.openweathermap.org/data/2.5/weather?q=san ramon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 823 of 1433 | olinda
    http://api.openweathermap.org/data/2.5/weather?q=olinda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 824 of 1433 | kumluca
    http://api.openweathermap.org/data/2.5/weather?q=kumluca&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 825 of 1433 | kargasok
    http://api.openweathermap.org/data/2.5/weather?q=kargasok&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 826 of 1433 | harper
    http://api.openweathermap.org/data/2.5/weather?q=harper&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 827 of 1433 | mount isa
    http://api.openweathermap.org/data/2.5/weather?q=mount isa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 828 of 1433 | bandarbeyla
    http://api.openweathermap.org/data/2.5/weather?q=bandarbeyla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 829 of 1433 | monte escobedo
    http://api.openweathermap.org/data/2.5/weather?q=monte escobedo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 830 of 1433 | svetlogorsk
    http://api.openweathermap.org/data/2.5/weather?q=svetlogorsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 831 of 1433 | onokhoy
    http://api.openweathermap.org/data/2.5/weather?q=onokhoy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 832 of 1433 | bielsk podlaski
    http://api.openweathermap.org/data/2.5/weather?q=bielsk podlaski&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 833 of 1433 | coahuayana
    http://api.openweathermap.org/data/2.5/weather?q=coahuayana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 834 of 1433 | vanimo
    http://api.openweathermap.org/data/2.5/weather?q=vanimo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 835 of 1433 | banon
    http://api.openweathermap.org/data/2.5/weather?q=banon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 836 of 1433 | vinh
    http://api.openweathermap.org/data/2.5/weather?q=vinh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 837 of 1433 | sataua
    http://api.openweathermap.org/data/2.5/weather?q=sataua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 838 of 1433 | tawang
    http://api.openweathermap.org/data/2.5/weather?q=tawang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 839 of 1433 | emerald
    http://api.openweathermap.org/data/2.5/weather?q=emerald&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 840 of 1433 | hwange
    http://api.openweathermap.org/data/2.5/weather?q=hwange&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 841 of 1433 | mayskiy
    http://api.openweathermap.org/data/2.5/weather?q=mayskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 842 of 1433 | mouila
    http://api.openweathermap.org/data/2.5/weather?q=mouila&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 843 of 1433 | seymchan
    http://api.openweathermap.org/data/2.5/weather?q=seymchan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 844 of 1433 | graciano sanchez
    http://api.openweathermap.org/data/2.5/weather?q=graciano sanchez&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 845 of 1433 | khandyga
    http://api.openweathermap.org/data/2.5/weather?q=khandyga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 846 of 1433 | sivaki
    http://api.openweathermap.org/data/2.5/weather?q=sivaki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 847 of 1433 | denizli
    http://api.openweathermap.org/data/2.5/weather?q=denizli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 848 of 1433 | ericeira
    http://api.openweathermap.org/data/2.5/weather?q=ericeira&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 849 of 1433 | mugur-aksy
    http://api.openweathermap.org/data/2.5/weather?q=mugur-aksy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 850 of 1433 | verkhnevilyuysk
    http://api.openweathermap.org/data/2.5/weather?q=verkhnevilyuysk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 851 of 1433 | upata
    http://api.openweathermap.org/data/2.5/weather?q=upata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 852 of 1433 | lolua
    http://api.openweathermap.org/data/2.5/weather?q=lolua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 853 of 1433 | azar shahr
    http://api.openweathermap.org/data/2.5/weather?q=azar shahr&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 854 of 1433 | marawi
    http://api.openweathermap.org/data/2.5/weather?q=marawi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 855 of 1433 | angoche
    http://api.openweathermap.org/data/2.5/weather?q=angoche&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 856 of 1433 | maun
    http://api.openweathermap.org/data/2.5/weather?q=maun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 857 of 1433 | rundu
    http://api.openweathermap.org/data/2.5/weather?q=rundu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 858 of 1433 | dukat
    http://api.openweathermap.org/data/2.5/weather?q=dukat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 859 of 1433 | bairiki
    http://api.openweathermap.org/data/2.5/weather?q=bairiki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 860 of 1433 | panjakent
    http://api.openweathermap.org/data/2.5/weather?q=panjakent&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 861 of 1433 | adrar
    http://api.openweathermap.org/data/2.5/weather?q=adrar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 862 of 1433 | walla walla
    http://api.openweathermap.org/data/2.5/weather?q=walla walla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 863 of 1433 | oistins
    http://api.openweathermap.org/data/2.5/weather?q=oistins&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 864 of 1433 | mandera
    http://api.openweathermap.org/data/2.5/weather?q=mandera&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 865 of 1433 | totoral
    http://api.openweathermap.org/data/2.5/weather?q=totoral&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 866 of 1433 | pionerskiy
    http://api.openweathermap.org/data/2.5/weather?q=pionerskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 867 of 1433 | arona
    http://api.openweathermap.org/data/2.5/weather?q=arona&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 868 of 1433 | watertown
    http://api.openweathermap.org/data/2.5/weather?q=watertown&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 869 of 1433 | uppsala
    http://api.openweathermap.org/data/2.5/weather?q=uppsala&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 870 of 1433 | mumford
    http://api.openweathermap.org/data/2.5/weather?q=mumford&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 871 of 1433 | cruz
    http://api.openweathermap.org/data/2.5/weather?q=cruz&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 872 of 1433 | galiwinku
    http://api.openweathermap.org/data/2.5/weather?q=galiwinku&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 873 of 1433 | tonantins
    http://api.openweathermap.org/data/2.5/weather?q=tonantins&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 874 of 1433 | longlac
    http://api.openweathermap.org/data/2.5/weather?q=longlac&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 875 of 1433 | ola
    http://api.openweathermap.org/data/2.5/weather?q=ola&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 876 of 1433 | kurya
    http://api.openweathermap.org/data/2.5/weather?q=kurya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 877 of 1433 | cienega
    http://api.openweathermap.org/data/2.5/weather?q=cienega&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 878 of 1433 | talaya
    http://api.openweathermap.org/data/2.5/weather?q=talaya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 879 of 1433 | bajo baudo
    http://api.openweathermap.org/data/2.5/weather?q=bajo baudo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 880 of 1433 | baiyin
    http://api.openweathermap.org/data/2.5/weather?q=baiyin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 881 of 1433 | blackpool
    http://api.openweathermap.org/data/2.5/weather?q=blackpool&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 882 of 1433 | novosokolniki
    http://api.openweathermap.org/data/2.5/weather?q=novosokolniki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 883 of 1433 | kineta
    http://api.openweathermap.org/data/2.5/weather?q=kineta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 884 of 1433 | buchanan
    http://api.openweathermap.org/data/2.5/weather?q=buchanan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 885 of 1433 | barbar
    http://api.openweathermap.org/data/2.5/weather?q=barbar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 886 of 1433 | yurginskoye
    http://api.openweathermap.org/data/2.5/weather?q=yurginskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 887 of 1433 | saint-joseph
    http://api.openweathermap.org/data/2.5/weather?q=saint-joseph&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 888 of 1433 | beyneu
    http://api.openweathermap.org/data/2.5/weather?q=beyneu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 889 of 1433 | jiamusi
    http://api.openweathermap.org/data/2.5/weather?q=jiamusi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 890 of 1433 | omaruru
    http://api.openweathermap.org/data/2.5/weather?q=omaruru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 891 of 1433 | vrangel
    http://api.openweathermap.org/data/2.5/weather?q=vrangel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 892 of 1433 | palimbang
    http://api.openweathermap.org/data/2.5/weather?q=palimbang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 893 of 1433 | roald
    http://api.openweathermap.org/data/2.5/weather?q=roald&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 894 of 1433 | saqqez
    http://api.openweathermap.org/data/2.5/weather?q=saqqez&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 895 of 1433 | kiunga
    http://api.openweathermap.org/data/2.5/weather?q=kiunga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 896 of 1433 | kindia
    http://api.openweathermap.org/data/2.5/weather?q=kindia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 897 of 1433 | tekeli
    http://api.openweathermap.org/data/2.5/weather?q=tekeli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 898 of 1433 | oldebroek
    http://api.openweathermap.org/data/2.5/weather?q=oldebroek&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 899 of 1433 | ngama
    http://api.openweathermap.org/data/2.5/weather?q=ngama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 900 of 1433 | acatzingo
    http://api.openweathermap.org/data/2.5/weather?q=acatzingo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 901 of 1433 | constantine
    http://api.openweathermap.org/data/2.5/weather?q=constantine&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 902 of 1433 | pemba
    http://api.openweathermap.org/data/2.5/weather?q=pemba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 903 of 1433 | jiroft
    http://api.openweathermap.org/data/2.5/weather?q=jiroft&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 904 of 1433 | karwar
    http://api.openweathermap.org/data/2.5/weather?q=karwar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 905 of 1433 | arua
    http://api.openweathermap.org/data/2.5/weather?q=arua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 906 of 1433 | halifax
    http://api.openweathermap.org/data/2.5/weather?q=halifax&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 907 of 1433 | boa vista
    http://api.openweathermap.org/data/2.5/weather?q=boa vista&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 908 of 1433 | les cayes
    http://api.openweathermap.org/data/2.5/weather?q=les cayes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 909 of 1433 | college
    http://api.openweathermap.org/data/2.5/weather?q=college&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 910 of 1433 | loreto
    http://api.openweathermap.org/data/2.5/weather?q=loreto&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 911 of 1433 | gamba
    http://api.openweathermap.org/data/2.5/weather?q=gamba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 912 of 1433 | altotonga
    http://api.openweathermap.org/data/2.5/weather?q=altotonga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 913 of 1433 | valdivia
    http://api.openweathermap.org/data/2.5/weather?q=valdivia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 914 of 1433 | jalpan
    http://api.openweathermap.org/data/2.5/weather?q=jalpan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 915 of 1433 | malakal
    http://api.openweathermap.org/data/2.5/weather?q=malakal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 916 of 1433 | oxford
    http://api.openweathermap.org/data/2.5/weather?q=oxford&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 917 of 1433 | nogent-le-rotrou
    http://api.openweathermap.org/data/2.5/weather?q=nogent-le-rotrou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 918 of 1433 | mallapuram
    http://api.openweathermap.org/data/2.5/weather?q=mallapuram&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 919 of 1433 | kedrovyy
    http://api.openweathermap.org/data/2.5/weather?q=kedrovyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 920 of 1433 | sisimiut
    http://api.openweathermap.org/data/2.5/weather?q=sisimiut&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 921 of 1433 | santa barbara
    http://api.openweathermap.org/data/2.5/weather?q=santa barbara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 922 of 1433 | diffa
    http://api.openweathermap.org/data/2.5/weather?q=diffa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 923 of 1433 | terre haute
    http://api.openweathermap.org/data/2.5/weather?q=terre haute&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 924 of 1433 | verkhniy fiagdon
    http://api.openweathermap.org/data/2.5/weather?q=verkhniy fiagdon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 925 of 1433 | catuday
    http://api.openweathermap.org/data/2.5/weather?q=catuday&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 926 of 1433 | buraydah
    http://api.openweathermap.org/data/2.5/weather?q=buraydah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 927 of 1433 | novaya zaimka
    http://api.openweathermap.org/data/2.5/weather?q=novaya zaimka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 928 of 1433 | husavik
    http://api.openweathermap.org/data/2.5/weather?q=husavik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 929 of 1433 | salamiyah
    http://api.openweathermap.org/data/2.5/weather?q=salamiyah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 930 of 1433 | kailua
    http://api.openweathermap.org/data/2.5/weather?q=kailua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 931 of 1433 | buarcos
    http://api.openweathermap.org/data/2.5/weather?q=buarcos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 932 of 1433 | yaan
    http://api.openweathermap.org/data/2.5/weather?q=yaan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 933 of 1433 | dillon
    http://api.openweathermap.org/data/2.5/weather?q=dillon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 934 of 1433 | puunsi
    http://api.openweathermap.org/data/2.5/weather?q=puunsi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 935 of 1433 | monaco-ville
    http://api.openweathermap.org/data/2.5/weather?q=monaco-ville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 936 of 1433 | pochutla
    http://api.openweathermap.org/data/2.5/weather?q=pochutla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 937 of 1433 | boyolangu
    http://api.openweathermap.org/data/2.5/weather?q=boyolangu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 938 of 1433 | korem
    http://api.openweathermap.org/data/2.5/weather?q=korem&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 939 of 1433 | fasa
    http://api.openweathermap.org/data/2.5/weather?q=fasa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 940 of 1433 | suchedniow
    http://api.openweathermap.org/data/2.5/weather?q=suchedniow&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 941 of 1433 | richard toll
    http://api.openweathermap.org/data/2.5/weather?q=richard toll&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 942 of 1433 | astana
    http://api.openweathermap.org/data/2.5/weather?q=astana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 943 of 1433 | zhangjiakou
    http://api.openweathermap.org/data/2.5/weather?q=zhangjiakou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 944 of 1433 | crotone
    http://api.openweathermap.org/data/2.5/weather?q=crotone&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 945 of 1433 | baykit
    http://api.openweathermap.org/data/2.5/weather?q=baykit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 946 of 1433 | vilanova del cami
    http://api.openweathermap.org/data/2.5/weather?q=vilanova del cami&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 947 of 1433 | chipinge
    http://api.openweathermap.org/data/2.5/weather?q=chipinge&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 948 of 1433 | muros
    http://api.openweathermap.org/data/2.5/weather?q=muros&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 949 of 1433 | glenwood springs
    http://api.openweathermap.org/data/2.5/weather?q=glenwood springs&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 950 of 1433 | prince rupert
    http://api.openweathermap.org/data/2.5/weather?q=prince rupert&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 951 of 1433 | tsnori
    http://api.openweathermap.org/data/2.5/weather?q=tsnori&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 952 of 1433 | ovalle
    http://api.openweathermap.org/data/2.5/weather?q=ovalle&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 953 of 1433 | toowoomba
    http://api.openweathermap.org/data/2.5/weather?q=toowoomba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 954 of 1433 | tucurui
    http://api.openweathermap.org/data/2.5/weather?q=tucurui&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 955 of 1433 | deep river
    http://api.openweathermap.org/data/2.5/weather?q=deep river&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 956 of 1433 | gazanjyk
    http://api.openweathermap.org/data/2.5/weather?q=gazanjyk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 957 of 1433 | puerto escondido
    http://api.openweathermap.org/data/2.5/weather?q=puerto escondido&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 958 of 1433 | mahanje
    http://api.openweathermap.org/data/2.5/weather?q=mahanje&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 959 of 1433 | zilair
    http://api.openweathermap.org/data/2.5/weather?q=zilair&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 960 of 1433 | abashiri
    http://api.openweathermap.org/data/2.5/weather?q=abashiri&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 961 of 1433 | aswan
    http://api.openweathermap.org/data/2.5/weather?q=aswan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 962 of 1433 | stamsund
    http://api.openweathermap.org/data/2.5/weather?q=stamsund&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 963 of 1433 | luanda
    http://api.openweathermap.org/data/2.5/weather?q=luanda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 964 of 1433 | kyzyl
    http://api.openweathermap.org/data/2.5/weather?q=kyzyl&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 965 of 1433 | burnie
    http://api.openweathermap.org/data/2.5/weather?q=burnie&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 966 of 1433 | cristalina
    http://api.openweathermap.org/data/2.5/weather?q=cristalina&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 967 of 1433 | touros
    http://api.openweathermap.org/data/2.5/weather?q=touros&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 968 of 1433 | cabedelo
    http://api.openweathermap.org/data/2.5/weather?q=cabedelo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 969 of 1433 | viligili
    http://api.openweathermap.org/data/2.5/weather?q=viligili&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 970 of 1433 | ixtapa
    http://api.openweathermap.org/data/2.5/weather?q=ixtapa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 971 of 1433 | barawe
    http://api.openweathermap.org/data/2.5/weather?q=barawe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 972 of 1433 | iskilip
    http://api.openweathermap.org/data/2.5/weather?q=iskilip&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 973 of 1433 | grand-lahou
    http://api.openweathermap.org/data/2.5/weather?q=grand-lahou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 974 of 1433 | sept-iles
    http://api.openweathermap.org/data/2.5/weather?q=sept-iles&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 975 of 1433 | la rioja
    http://api.openweathermap.org/data/2.5/weather?q=la rioja&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 976 of 1433 | kletskaya
    http://api.openweathermap.org/data/2.5/weather?q=kletskaya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 977 of 1433 | rorvik
    http://api.openweathermap.org/data/2.5/weather?q=rorvik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 978 of 1433 | smolenka
    http://api.openweathermap.org/data/2.5/weather?q=smolenka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 979 of 1433 | zhanaozen
    http://api.openweathermap.org/data/2.5/weather?q=zhanaozen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 980 of 1433 | mitsamiouli
    http://api.openweathermap.org/data/2.5/weather?q=mitsamiouli&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 981 of 1433 | troitskoye
    http://api.openweathermap.org/data/2.5/weather?q=troitskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 982 of 1433 | uige
    http://api.openweathermap.org/data/2.5/weather?q=uige&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 983 of 1433 | consolacion del sur
    http://api.openweathermap.org/data/2.5/weather?q=consolacion del sur&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 984 of 1433 | macamic
    http://api.openweathermap.org/data/2.5/weather?q=macamic&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 985 of 1433 | honningsvag
    http://api.openweathermap.org/data/2.5/weather?q=honningsvag&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 986 of 1433 | aripuana
    http://api.openweathermap.org/data/2.5/weather?q=aripuana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 987 of 1433 | kamakwie
    http://api.openweathermap.org/data/2.5/weather?q=kamakwie&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 988 of 1433 | wuwei
    http://api.openweathermap.org/data/2.5/weather?q=wuwei&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 989 of 1433 | navirai
    http://api.openweathermap.org/data/2.5/weather?q=navirai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 990 of 1433 | andevoranto
    http://api.openweathermap.org/data/2.5/weather?q=andevoranto&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 991 of 1433 | esmeraldas
    http://api.openweathermap.org/data/2.5/weather?q=esmeraldas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 992 of 1433 | neuquen
    http://api.openweathermap.org/data/2.5/weather?q=neuquen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 993 of 1433 | nouadhibou
    http://api.openweathermap.org/data/2.5/weather?q=nouadhibou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 994 of 1433 | porto san giorgio
    http://api.openweathermap.org/data/2.5/weather?q=porto san giorgio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 995 of 1433 | huarmey
    http://api.openweathermap.org/data/2.5/weather?q=huarmey&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 996 of 1433 | nantucket
    http://api.openweathermap.org/data/2.5/weather?q=nantucket&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 997 of 1433 | sungaipenuh
    http://api.openweathermap.org/data/2.5/weather?q=sungaipenuh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 998 of 1433 | kapit
    http://api.openweathermap.org/data/2.5/weather?q=kapit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 999 of 1433 | mazamari
    http://api.openweathermap.org/data/2.5/weather?q=mazamari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1000 of 1433 | mezen
    http://api.openweathermap.org/data/2.5/weather?q=mezen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1001 of 1433 | moree
    http://api.openweathermap.org/data/2.5/weather?q=moree&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1002 of 1433 | muroto
    http://api.openweathermap.org/data/2.5/weather?q=muroto&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1003 of 1433 | shitanjing
    http://api.openweathermap.org/data/2.5/weather?q=shitanjing&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1004 of 1433 | yeniseysk
    http://api.openweathermap.org/data/2.5/weather?q=yeniseysk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1005 of 1433 | port hedland
    http://api.openweathermap.org/data/2.5/weather?q=port hedland&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1006 of 1433 | hohhot
    http://api.openweathermap.org/data/2.5/weather?q=hohhot&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1007 of 1433 | duvan
    http://api.openweathermap.org/data/2.5/weather?q=duvan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1008 of 1433 | orda
    http://api.openweathermap.org/data/2.5/weather?q=orda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1009 of 1433 | suluq
    http://api.openweathermap.org/data/2.5/weather?q=suluq&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1010 of 1433 | harnosand
    http://api.openweathermap.org/data/2.5/weather?q=harnosand&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1011 of 1433 | chicama
    http://api.openweathermap.org/data/2.5/weather?q=chicama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1012 of 1433 | fengrun
    http://api.openweathermap.org/data/2.5/weather?q=fengrun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1013 of 1433 | jieshi
    http://api.openweathermap.org/data/2.5/weather?q=jieshi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1014 of 1433 | mogadishu
    http://api.openweathermap.org/data/2.5/weather?q=mogadishu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1015 of 1433 | brigham city
    http://api.openweathermap.org/data/2.5/weather?q=brigham city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1016 of 1433 | pafos
    http://api.openweathermap.org/data/2.5/weather?q=pafos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1017 of 1433 | pamplona
    http://api.openweathermap.org/data/2.5/weather?q=pamplona&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1018 of 1433 | mareeba
    http://api.openweathermap.org/data/2.5/weather?q=mareeba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1019 of 1433 | ayr
    http://api.openweathermap.org/data/2.5/weather?q=ayr&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1020 of 1433 | sernur
    http://api.openweathermap.org/data/2.5/weather?q=sernur&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1021 of 1433 | binghamton
    http://api.openweathermap.org/data/2.5/weather?q=binghamton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1022 of 1433 | westlock
    http://api.openweathermap.org/data/2.5/weather?q=westlock&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1023 of 1433 | nahan
    http://api.openweathermap.org/data/2.5/weather?q=nahan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1024 of 1433 | nikel
    http://api.openweathermap.org/data/2.5/weather?q=nikel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1025 of 1433 | vilyuysk
    http://api.openweathermap.org/data/2.5/weather?q=vilyuysk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1026 of 1433 | neiafu
    http://api.openweathermap.org/data/2.5/weather?q=neiafu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1027 of 1433 | doha
    http://api.openweathermap.org/data/2.5/weather?q=doha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1028 of 1433 | lensk
    http://api.openweathermap.org/data/2.5/weather?q=lensk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1029 of 1433 | venado tuerto
    http://api.openweathermap.org/data/2.5/weather?q=venado tuerto&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1030 of 1433 | soe
    http://api.openweathermap.org/data/2.5/weather?q=soe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1031 of 1433 | dandong
    http://api.openweathermap.org/data/2.5/weather?q=dandong&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1032 of 1433 | seddon
    http://api.openweathermap.org/data/2.5/weather?q=seddon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1033 of 1433 | boditi
    http://api.openweathermap.org/data/2.5/weather?q=boditi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1034 of 1433 | buckeye
    http://api.openweathermap.org/data/2.5/weather?q=buckeye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1035 of 1433 | tilichiki
    http://api.openweathermap.org/data/2.5/weather?q=tilichiki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1036 of 1433 | portoferraio
    http://api.openweathermap.org/data/2.5/weather?q=portoferraio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1037 of 1433 | el dorado
    http://api.openweathermap.org/data/2.5/weather?q=el dorado&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1038 of 1433 | jaru
    http://api.openweathermap.org/data/2.5/weather?q=jaru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1039 of 1433 | chernogorsk
    http://api.openweathermap.org/data/2.5/weather?q=chernogorsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1040 of 1433 | miragoane
    http://api.openweathermap.org/data/2.5/weather?q=miragoane&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1041 of 1433 | bur gabo
    http://api.openweathermap.org/data/2.5/weather?q=bur gabo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1042 of 1433 | dingzhou
    http://api.openweathermap.org/data/2.5/weather?q=dingzhou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1043 of 1433 | kaseda
    http://api.openweathermap.org/data/2.5/weather?q=kaseda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1044 of 1433 | whitehorse
    http://api.openweathermap.org/data/2.5/weather?q=whitehorse&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1045 of 1433 | stokmarknes
    http://api.openweathermap.org/data/2.5/weather?q=stokmarknes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1046 of 1433 | mufulira
    http://api.openweathermap.org/data/2.5/weather?q=mufulira&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1047 of 1433 | bandar-e torkaman
    http://api.openweathermap.org/data/2.5/weather?q=bandar-e torkaman&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1048 of 1433 | willmar
    http://api.openweathermap.org/data/2.5/weather?q=willmar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1049 of 1433 | pontivy
    http://api.openweathermap.org/data/2.5/weather?q=pontivy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1050 of 1433 | kathu
    http://api.openweathermap.org/data/2.5/weather?q=kathu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1051 of 1433 | puerto del rosario
    http://api.openweathermap.org/data/2.5/weather?q=puerto del rosario&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1052 of 1433 | ergani
    http://api.openweathermap.org/data/2.5/weather?q=ergani&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1053 of 1433 | khvalynsk
    http://api.openweathermap.org/data/2.5/weather?q=khvalynsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1054 of 1433 | kayerkan
    http://api.openweathermap.org/data/2.5/weather?q=kayerkan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1055 of 1433 | nador
    http://api.openweathermap.org/data/2.5/weather?q=nador&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1056 of 1433 | mullaitivu
    http://api.openweathermap.org/data/2.5/weather?q=mullaitivu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1057 of 1433 | kulhudhuffushi
    http://api.openweathermap.org/data/2.5/weather?q=kulhudhuffushi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1058 of 1433 | savannakhet
    http://api.openweathermap.org/data/2.5/weather?q=savannakhet&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1059 of 1433 | santa rosa
    http://api.openweathermap.org/data/2.5/weather?q=santa rosa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1060 of 1433 | ouegoa
    http://api.openweathermap.org/data/2.5/weather?q=ouegoa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1061 of 1433 | abu dhabi
    http://api.openweathermap.org/data/2.5/weather?q=abu dhabi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1062 of 1433 | mecca
    http://api.openweathermap.org/data/2.5/weather?q=mecca&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1063 of 1433 | haibowan
    http://api.openweathermap.org/data/2.5/weather?q=haibowan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1064 of 1433 | dennis
    http://api.openweathermap.org/data/2.5/weather?q=dennis&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1065 of 1433 | san andres
    http://api.openweathermap.org/data/2.5/weather?q=san andres&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1066 of 1433 | salihorsk
    http://api.openweathermap.org/data/2.5/weather?q=salihorsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1067 of 1433 | porto novo
    http://api.openweathermap.org/data/2.5/weather?q=porto novo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1068 of 1433 | swan river
    http://api.openweathermap.org/data/2.5/weather?q=swan river&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1069 of 1433 | coello
    http://api.openweathermap.org/data/2.5/weather?q=coello&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1070 of 1433 | kampene
    http://api.openweathermap.org/data/2.5/weather?q=kampene&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1071 of 1433 | barra
    http://api.openweathermap.org/data/2.5/weather?q=barra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1072 of 1433 | deputatskiy
    http://api.openweathermap.org/data/2.5/weather?q=deputatskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1073 of 1433 | xining
    http://api.openweathermap.org/data/2.5/weather?q=xining&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1074 of 1433 | libertador general san martin
    http://api.openweathermap.org/data/2.5/weather?q=libertador general san martin&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1075 of 1433 | coolum beach
    http://api.openweathermap.org/data/2.5/weather?q=coolum beach&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1076 of 1433 | nacala
    http://api.openweathermap.org/data/2.5/weather?q=nacala&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1077 of 1433 | ugoofaaru
    http://api.openweathermap.org/data/2.5/weather?q=ugoofaaru&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1078 of 1433 | belleville
    http://api.openweathermap.org/data/2.5/weather?q=belleville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1079 of 1433 | safaga
    http://api.openweathermap.org/data/2.5/weather?q=safaga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1080 of 1433 | new philadelphia
    http://api.openweathermap.org/data/2.5/weather?q=new philadelphia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1081 of 1433 | toppenish
    http://api.openweathermap.org/data/2.5/weather?q=toppenish&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1082 of 1433 | lumberton
    http://api.openweathermap.org/data/2.5/weather?q=lumberton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1083 of 1433 | patacamaya
    http://api.openweathermap.org/data/2.5/weather?q=patacamaya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1084 of 1433 | piquete
    http://api.openweathermap.org/data/2.5/weather?q=piquete&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1085 of 1433 | tawkar
    http://api.openweathermap.org/data/2.5/weather?q=tawkar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1086 of 1433 | atar
    http://api.openweathermap.org/data/2.5/weather?q=atar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1087 of 1433 | kawalu
    http://api.openweathermap.org/data/2.5/weather?q=kawalu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1088 of 1433 | aljezur
    http://api.openweathermap.org/data/2.5/weather?q=aljezur&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1089 of 1433 | kutum
    http://api.openweathermap.org/data/2.5/weather?q=kutum&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1090 of 1433 | dong hoi
    http://api.openweathermap.org/data/2.5/weather?q=dong hoi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1091 of 1433 | shahr-e kord
    http://api.openweathermap.org/data/2.5/weather?q=shahr-e kord&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1092 of 1433 | nchelenge
    http://api.openweathermap.org/data/2.5/weather?q=nchelenge&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1093 of 1433 | patrocinio
    http://api.openweathermap.org/data/2.5/weather?q=patrocinio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1094 of 1433 | hermagor
    http://api.openweathermap.org/data/2.5/weather?q=hermagor&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1095 of 1433 | karpathos
    http://api.openweathermap.org/data/2.5/weather?q=karpathos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1096 of 1433 | puerto lleras
    http://api.openweathermap.org/data/2.5/weather?q=puerto lleras&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1097 of 1433 | turek
    http://api.openweathermap.org/data/2.5/weather?q=turek&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1098 of 1433 | manokwari
    http://api.openweathermap.org/data/2.5/weather?q=manokwari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1099 of 1433 | azimur
    http://api.openweathermap.org/data/2.5/weather?q=azimur&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1100 of 1433 | coari
    http://api.openweathermap.org/data/2.5/weather?q=coari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1101 of 1433 | aasiaat
    http://api.openweathermap.org/data/2.5/weather?q=aasiaat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1102 of 1433 | samarai
    http://api.openweathermap.org/data/2.5/weather?q=samarai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1103 of 1433 | piney green
    http://api.openweathermap.org/data/2.5/weather?q=piney green&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1104 of 1433 | kalianget
    http://api.openweathermap.org/data/2.5/weather?q=kalianget&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1105 of 1433 | butajira
    http://api.openweathermap.org/data/2.5/weather?q=butajira&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1106 of 1433 | sydney
    http://api.openweathermap.org/data/2.5/weather?q=sydney&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1107 of 1433 | hatillo
    http://api.openweathermap.org/data/2.5/weather?q=hatillo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1108 of 1433 | zevenaar
    http://api.openweathermap.org/data/2.5/weather?q=zevenaar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1109 of 1433 | carberry
    http://api.openweathermap.org/data/2.5/weather?q=carberry&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1110 of 1433 | mizan teferi
    http://api.openweathermap.org/data/2.5/weather?q=mizan teferi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1111 of 1433 | budaun
    http://api.openweathermap.org/data/2.5/weather?q=budaun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1112 of 1433 | angra
    http://api.openweathermap.org/data/2.5/weather?q=angra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1113 of 1433 | schroeder
    http://api.openweathermap.org/data/2.5/weather?q=schroeder&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1114 of 1433 | skjervoy
    http://api.openweathermap.org/data/2.5/weather?q=skjervoy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1115 of 1433 | formoso do araguaia
    http://api.openweathermap.org/data/2.5/weather?q=formoso do araguaia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1116 of 1433 | kismayo
    http://api.openweathermap.org/data/2.5/weather?q=kismayo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1117 of 1433 | talara
    http://api.openweathermap.org/data/2.5/weather?q=talara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1118 of 1433 | innisfail
    http://api.openweathermap.org/data/2.5/weather?q=innisfail&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1119 of 1433 | jeremie
    http://api.openweathermap.org/data/2.5/weather?q=jeremie&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1120 of 1433 | meybod
    http://api.openweathermap.org/data/2.5/weather?q=meybod&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1121 of 1433 | amga
    http://api.openweathermap.org/data/2.5/weather?q=amga&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1122 of 1433 | sarangani
    http://api.openweathermap.org/data/2.5/weather?q=sarangani&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1123 of 1433 | soyo
    http://api.openweathermap.org/data/2.5/weather?q=soyo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1124 of 1433 | mergui
    http://api.openweathermap.org/data/2.5/weather?q=mergui&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1125 of 1433 | kaeo
    http://api.openweathermap.org/data/2.5/weather?q=kaeo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1126 of 1433 | bam
    http://api.openweathermap.org/data/2.5/weather?q=bam&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1127 of 1433 | wattegama
    http://api.openweathermap.org/data/2.5/weather?q=wattegama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1128 of 1433 | actopan
    http://api.openweathermap.org/data/2.5/weather?q=actopan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1129 of 1433 | lamu
    http://api.openweathermap.org/data/2.5/weather?q=lamu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1130 of 1433 | benguela
    http://api.openweathermap.org/data/2.5/weather?q=benguela&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1131 of 1433 | muisne
    http://api.openweathermap.org/data/2.5/weather?q=muisne&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1132 of 1433 | dhangadhi
    http://api.openweathermap.org/data/2.5/weather?q=dhangadhi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1133 of 1433 | urumqi
    http://api.openweathermap.org/data/2.5/weather?q=urumqi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1134 of 1433 | mishan
    http://api.openweathermap.org/data/2.5/weather?q=mishan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1135 of 1433 | jingdezhen
    http://api.openweathermap.org/data/2.5/weather?q=jingdezhen&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1136 of 1433 | novoukrainskiy
    http://api.openweathermap.org/data/2.5/weather?q=novoukrainskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1137 of 1433 | karauzyak
    http://api.openweathermap.org/data/2.5/weather?q=karauzyak&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1138 of 1433 | malwan
    http://api.openweathermap.org/data/2.5/weather?q=malwan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1139 of 1433 | ibipeba
    http://api.openweathermap.org/data/2.5/weather?q=ibipeba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1140 of 1433 | lata
    http://api.openweathermap.org/data/2.5/weather?q=lata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1141 of 1433 | bhanpura
    http://api.openweathermap.org/data/2.5/weather?q=bhanpura&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1142 of 1433 | mangrol
    http://api.openweathermap.org/data/2.5/weather?q=mangrol&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1143 of 1433 | zhangye
    http://api.openweathermap.org/data/2.5/weather?q=zhangye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1144 of 1433 | isla vista
    http://api.openweathermap.org/data/2.5/weather?q=isla vista&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1145 of 1433 | vanderhoof
    http://api.openweathermap.org/data/2.5/weather?q=vanderhoof&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1146 of 1433 | beringovskiy
    http://api.openweathermap.org/data/2.5/weather?q=beringovskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1147 of 1433 | shumskiy
    http://api.openweathermap.org/data/2.5/weather?q=shumskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1148 of 1433 | kristiinankaupunki
    http://api.openweathermap.org/data/2.5/weather?q=kristiinankaupunki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1149 of 1433 | sarishabari
    http://api.openweathermap.org/data/2.5/weather?q=sarishabari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1150 of 1433 | paita
    http://api.openweathermap.org/data/2.5/weather?q=paita&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1151 of 1433 | prince george
    http://api.openweathermap.org/data/2.5/weather?q=prince george&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1152 of 1433 | kununurra
    http://api.openweathermap.org/data/2.5/weather?q=kununurra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1153 of 1433 | chifeng
    http://api.openweathermap.org/data/2.5/weather?q=chifeng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1154 of 1433 | villa del rosario
    http://api.openweathermap.org/data/2.5/weather?q=villa del rosario&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1155 of 1433 | concordia
    http://api.openweathermap.org/data/2.5/weather?q=concordia&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1156 of 1433 | port macquarie
    http://api.openweathermap.org/data/2.5/weather?q=port macquarie&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1157 of 1433 | yanan
    http://api.openweathermap.org/data/2.5/weather?q=yanan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1158 of 1433 | san pedro de macoris
    http://api.openweathermap.org/data/2.5/weather?q=san pedro de macoris&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1159 of 1433 | ust-maya
    http://api.openweathermap.org/data/2.5/weather?q=ust-maya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1160 of 1433 | yuki
    http://api.openweathermap.org/data/2.5/weather?q=yuki&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1161 of 1433 | barsi
    http://api.openweathermap.org/data/2.5/weather?q=barsi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1162 of 1433 | lusambo
    http://api.openweathermap.org/data/2.5/weather?q=lusambo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1163 of 1433 | lida
    http://api.openweathermap.org/data/2.5/weather?q=lida&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1164 of 1433 | kondinskoye
    http://api.openweathermap.org/data/2.5/weather?q=kondinskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1165 of 1433 | chunskiy
    http://api.openweathermap.org/data/2.5/weather?q=chunskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1166 of 1433 | salinas
    http://api.openweathermap.org/data/2.5/weather?q=salinas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1167 of 1433 | hun
    http://api.openweathermap.org/data/2.5/weather?q=hun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1168 of 1433 | havelock
    http://api.openweathermap.org/data/2.5/weather?q=havelock&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1169 of 1433 | kargat
    http://api.openweathermap.org/data/2.5/weather?q=kargat&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1170 of 1433 | santa cruz
    http://api.openweathermap.org/data/2.5/weather?q=santa cruz&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1171 of 1433 | samalaeulu
    http://api.openweathermap.org/data/2.5/weather?q=samalaeulu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1172 of 1433 | xingyi
    http://api.openweathermap.org/data/2.5/weather?q=xingyi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1173 of 1433 | maragogi
    http://api.openweathermap.org/data/2.5/weather?q=maragogi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1174 of 1433 | esperanca
    http://api.openweathermap.org/data/2.5/weather?q=esperanca&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1175 of 1433 | chute-aux-outardes
    http://api.openweathermap.org/data/2.5/weather?q=chute-aux-outardes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1176 of 1433 | chalchihuites
    http://api.openweathermap.org/data/2.5/weather?q=chalchihuites&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1177 of 1433 | wilmington island
    http://api.openweathermap.org/data/2.5/weather?q=wilmington island&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1178 of 1433 | acajutla
    http://api.openweathermap.org/data/2.5/weather?q=acajutla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1179 of 1433 | diamantino
    http://api.openweathermap.org/data/2.5/weather?q=diamantino&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1180 of 1433 | camapua
    http://api.openweathermap.org/data/2.5/weather?q=camapua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1181 of 1433 | aldan
    http://api.openweathermap.org/data/2.5/weather?q=aldan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1182 of 1433 | sisophon
    http://api.openweathermap.org/data/2.5/weather?q=sisophon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1183 of 1433 | changji
    http://api.openweathermap.org/data/2.5/weather?q=changji&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1184 of 1433 | estevan
    http://api.openweathermap.org/data/2.5/weather?q=estevan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1185 of 1433 | kijang
    http://api.openweathermap.org/data/2.5/weather?q=kijang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1186 of 1433 | zemio
    http://api.openweathermap.org/data/2.5/weather?q=zemio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1187 of 1433 | filingue
    http://api.openweathermap.org/data/2.5/weather?q=filingue&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1188 of 1433 | sorong
    http://api.openweathermap.org/data/2.5/weather?q=sorong&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1189 of 1433 | hermosillo
    http://api.openweathermap.org/data/2.5/weather?q=hermosillo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1190 of 1433 | auch
    http://api.openweathermap.org/data/2.5/weather?q=auch&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1191 of 1433 | la palma
    http://api.openweathermap.org/data/2.5/weather?q=la palma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1192 of 1433 | kuusamo
    http://api.openweathermap.org/data/2.5/weather?q=kuusamo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1193 of 1433 | camacha
    http://api.openweathermap.org/data/2.5/weather?q=camacha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1194 of 1433 | fethiye
    http://api.openweathermap.org/data/2.5/weather?q=fethiye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1195 of 1433 | kincardine
    http://api.openweathermap.org/data/2.5/weather?q=kincardine&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1196 of 1433 | promyshlennyy
    http://api.openweathermap.org/data/2.5/weather?q=promyshlennyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1197 of 1433 | chimore
    http://api.openweathermap.org/data/2.5/weather?q=chimore&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1198 of 1433 | nome
    http://api.openweathermap.org/data/2.5/weather?q=nome&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1199 of 1433 | jawhar
    http://api.openweathermap.org/data/2.5/weather?q=jawhar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1200 of 1433 | lexington
    http://api.openweathermap.org/data/2.5/weather?q=lexington&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1201 of 1433 | rusape
    http://api.openweathermap.org/data/2.5/weather?q=rusape&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1202 of 1433 | lahij
    http://api.openweathermap.org/data/2.5/weather?q=lahij&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1203 of 1433 | sioux lookout
    http://api.openweathermap.org/data/2.5/weather?q=sioux lookout&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1204 of 1433 | ganzhou
    http://api.openweathermap.org/data/2.5/weather?q=ganzhou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1205 of 1433 | kushima
    http://api.openweathermap.org/data/2.5/weather?q=kushima&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1206 of 1433 | tomatlan
    http://api.openweathermap.org/data/2.5/weather?q=tomatlan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1207 of 1433 | salgueiro
    http://api.openweathermap.org/data/2.5/weather?q=salgueiro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1208 of 1433 | mazagao
    http://api.openweathermap.org/data/2.5/weather?q=mazagao&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1209 of 1433 | koindu
    http://api.openweathermap.org/data/2.5/weather?q=koindu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1210 of 1433 | moerai
    http://api.openweathermap.org/data/2.5/weather?q=moerai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1211 of 1433 | phan rang
    http://api.openweathermap.org/data/2.5/weather?q=phan rang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1212 of 1433 | kochubey
    http://api.openweathermap.org/data/2.5/weather?q=kochubey&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1213 of 1433 | jambi
    http://api.openweathermap.org/data/2.5/weather?q=jambi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1214 of 1433 | rwamagana
    http://api.openweathermap.org/data/2.5/weather?q=rwamagana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1215 of 1433 | uarini
    http://api.openweathermap.org/data/2.5/weather?q=uarini&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1216 of 1433 | gouyave
    http://api.openweathermap.org/data/2.5/weather?q=gouyave&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1217 of 1433 | maltahohe
    http://api.openweathermap.org/data/2.5/weather?q=maltahohe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1218 of 1433 | abnub
    http://api.openweathermap.org/data/2.5/weather?q=abnub&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1219 of 1433 | langxiang
    http://api.openweathermap.org/data/2.5/weather?q=langxiang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1220 of 1433 | alice
    http://api.openweathermap.org/data/2.5/weather?q=alice&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1221 of 1433 | altay
    http://api.openweathermap.org/data/2.5/weather?q=altay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1222 of 1433 | tynda
    http://api.openweathermap.org/data/2.5/weather?q=tynda&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1223 of 1433 | neryungri
    http://api.openweathermap.org/data/2.5/weather?q=neryungri&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1224 of 1433 | kungurtug
    http://api.openweathermap.org/data/2.5/weather?q=kungurtug&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1225 of 1433 | nyurba
    http://api.openweathermap.org/data/2.5/weather?q=nyurba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1226 of 1433 | merke
    http://api.openweathermap.org/data/2.5/weather?q=merke&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1227 of 1433 | shaoyang
    http://api.openweathermap.org/data/2.5/weather?q=shaoyang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1228 of 1433 | toropets
    http://api.openweathermap.org/data/2.5/weather?q=toropets&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1229 of 1433 | mehriz
    http://api.openweathermap.org/data/2.5/weather?q=mehriz&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1230 of 1433 | piacabucu
    http://api.openweathermap.org/data/2.5/weather?q=piacabucu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1231 of 1433 | amahai
    http://api.openweathermap.org/data/2.5/weather?q=amahai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1232 of 1433 | baherden
    http://api.openweathermap.org/data/2.5/weather?q=baherden&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1233 of 1433 | banihal
    http://api.openweathermap.org/data/2.5/weather?q=banihal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1234 of 1433 | chiang rai
    http://api.openweathermap.org/data/2.5/weather?q=chiang rai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1235 of 1433 | vaitape
    http://api.openweathermap.org/data/2.5/weather?q=vaitape&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1236 of 1433 | foumban
    http://api.openweathermap.org/data/2.5/weather?q=foumban&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1237 of 1433 | camana
    http://api.openweathermap.org/data/2.5/weather?q=camana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1238 of 1433 | batagay-alyta
    http://api.openweathermap.org/data/2.5/weather?q=batagay-alyta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1239 of 1433 | korbach
    http://api.openweathermap.org/data/2.5/weather?q=korbach&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1240 of 1433 | manjeshwar
    http://api.openweathermap.org/data/2.5/weather?q=manjeshwar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1241 of 1433 | burns lake
    http://api.openweathermap.org/data/2.5/weather?q=burns lake&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1242 of 1433 | roebourne
    http://api.openweathermap.org/data/2.5/weather?q=roebourne&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1243 of 1433 | athabasca
    http://api.openweathermap.org/data/2.5/weather?q=athabasca&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1244 of 1433 | santo antonio da platina
    http://api.openweathermap.org/data/2.5/weather?q=santo antonio da platina&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1245 of 1433 | chumikan
    http://api.openweathermap.org/data/2.5/weather?q=chumikan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1246 of 1433 | gillette
    http://api.openweathermap.org/data/2.5/weather?q=gillette&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1247 of 1433 | vestmannaeyjar
    http://api.openweathermap.org/data/2.5/weather?q=vestmannaeyjar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1248 of 1433 | elizabeth city
    http://api.openweathermap.org/data/2.5/weather?q=elizabeth city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1249 of 1433 | carros
    http://api.openweathermap.org/data/2.5/weather?q=carros&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1250 of 1433 | pedernales
    http://api.openweathermap.org/data/2.5/weather?q=pedernales&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1251 of 1433 | sao domingos do maranhao
    http://api.openweathermap.org/data/2.5/weather?q=sao domingos do maranhao&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1252 of 1433 | henties bay
    http://api.openweathermap.org/data/2.5/weather?q=henties bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1253 of 1433 | bulawayo
    http://api.openweathermap.org/data/2.5/weather?q=bulawayo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1254 of 1433 | makarov
    http://api.openweathermap.org/data/2.5/weather?q=makarov&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1255 of 1433 | bokoro
    http://api.openweathermap.org/data/2.5/weather?q=bokoro&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1256 of 1433 | celestun
    http://api.openweathermap.org/data/2.5/weather?q=celestun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1257 of 1433 | novonukutskiy
    http://api.openweathermap.org/data/2.5/weather?q=novonukutskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1258 of 1433 | cartagena
    http://api.openweathermap.org/data/2.5/weather?q=cartagena&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1259 of 1433 | kanata
    http://api.openweathermap.org/data/2.5/weather?q=kanata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1260 of 1433 | kattivakkam
    http://api.openweathermap.org/data/2.5/weather?q=kattivakkam&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1261 of 1433 | karkaralinsk
    http://api.openweathermap.org/data/2.5/weather?q=karkaralinsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1262 of 1433 | huangzhou
    http://api.openweathermap.org/data/2.5/weather?q=huangzhou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1263 of 1433 | bubaque
    http://api.openweathermap.org/data/2.5/weather?q=bubaque&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1264 of 1433 | kasamwa
    http://api.openweathermap.org/data/2.5/weather?q=kasamwa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1265 of 1433 | korla
    http://api.openweathermap.org/data/2.5/weather?q=korla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1266 of 1433 | zavetnoye
    http://api.openweathermap.org/data/2.5/weather?q=zavetnoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1267 of 1433 | ikom
    http://api.openweathermap.org/data/2.5/weather?q=ikom&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1268 of 1433 | maceio
    http://api.openweathermap.org/data/2.5/weather?q=maceio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1269 of 1433 | esil
    http://api.openweathermap.org/data/2.5/weather?q=esil&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1270 of 1433 | marystown
    http://api.openweathermap.org/data/2.5/weather?q=marystown&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1271 of 1433 | niihama
    http://api.openweathermap.org/data/2.5/weather?q=niihama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1272 of 1433 | fort saint james
    http://api.openweathermap.org/data/2.5/weather?q=fort saint james&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1273 of 1433 | san clemente
    http://api.openweathermap.org/data/2.5/weather?q=san clemente&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1274 of 1433 | mariinskiy posad
    http://api.openweathermap.org/data/2.5/weather?q=mariinskiy posad&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1275 of 1433 | kirensk
    http://api.openweathermap.org/data/2.5/weather?q=kirensk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1276 of 1433 | sao paulo de olivenca
    http://api.openweathermap.org/data/2.5/weather?q=sao paulo de olivenca&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1277 of 1433 | genhe
    http://api.openweathermap.org/data/2.5/weather?q=genhe&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1278 of 1433 | pitlochry
    http://api.openweathermap.org/data/2.5/weather?q=pitlochry&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1279 of 1433 | okahandja
    http://api.openweathermap.org/data/2.5/weather?q=okahandja&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1280 of 1433 | cururupu
    http://api.openweathermap.org/data/2.5/weather?q=cururupu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1281 of 1433 | jelgava
    http://api.openweathermap.org/data/2.5/weather?q=jelgava&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1282 of 1433 | araouane
    http://api.openweathermap.org/data/2.5/weather?q=araouane&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1283 of 1433 | fuerte olimpo
    http://api.openweathermap.org/data/2.5/weather?q=fuerte olimpo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1284 of 1433 | hualmay
    http://api.openweathermap.org/data/2.5/weather?q=hualmay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1285 of 1433 | linjiang
    http://api.openweathermap.org/data/2.5/weather?q=linjiang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1286 of 1433 | we
    http://api.openweathermap.org/data/2.5/weather?q=we&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1287 of 1433 | toliary
    http://api.openweathermap.org/data/2.5/weather?q=toliary&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1288 of 1433 | menongue
    http://api.openweathermap.org/data/2.5/weather?q=menongue&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1289 of 1433 | poltava
    http://api.openweathermap.org/data/2.5/weather?q=poltava&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1290 of 1433 | bonfim
    http://api.openweathermap.org/data/2.5/weather?q=bonfim&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1291 of 1433 | igarka
    http://api.openweathermap.org/data/2.5/weather?q=igarka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1292 of 1433 | montego bay
    http://api.openweathermap.org/data/2.5/weather?q=montego bay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1293 of 1433 | carlagan
    http://api.openweathermap.org/data/2.5/weather?q=carlagan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1294 of 1433 | mana
    http://api.openweathermap.org/data/2.5/weather?q=mana&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1295 of 1433 | havoysund
    http://api.openweathermap.org/data/2.5/weather?q=havoysund&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1296 of 1433 | bograd
    http://api.openweathermap.org/data/2.5/weather?q=bograd&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1297 of 1433 | umm kaddadah
    http://api.openweathermap.org/data/2.5/weather?q=umm kaddadah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1298 of 1433 | jishou
    http://api.openweathermap.org/data/2.5/weather?q=jishou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1299 of 1433 | miracatu
    http://api.openweathermap.org/data/2.5/weather?q=miracatu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1300 of 1433 | urusha
    http://api.openweathermap.org/data/2.5/weather?q=urusha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1301 of 1433 | bida
    http://api.openweathermap.org/data/2.5/weather?q=bida&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1302 of 1433 | aflu
    http://api.openweathermap.org/data/2.5/weather?q=aflu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1303 of 1433 | beloha
    http://api.openweathermap.org/data/2.5/weather?q=beloha&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1304 of 1433 | hoquiam
    http://api.openweathermap.org/data/2.5/weather?q=hoquiam&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1305 of 1433 | bozeman
    http://api.openweathermap.org/data/2.5/weather?q=bozeman&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1306 of 1433 | belyy yar
    http://api.openweathermap.org/data/2.5/weather?q=belyy yar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1307 of 1433 | guelengdeng
    http://api.openweathermap.org/data/2.5/weather?q=guelengdeng&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1308 of 1433 | taos
    http://api.openweathermap.org/data/2.5/weather?q=taos&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1309 of 1433 | lazo
    http://api.openweathermap.org/data/2.5/weather?q=lazo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1310 of 1433 | tharrawaddy
    http://api.openweathermap.org/data/2.5/weather?q=tharrawaddy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1311 of 1433 | hihifo
    http://api.openweathermap.org/data/2.5/weather?q=hihifo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1312 of 1433 | vytegra
    http://api.openweathermap.org/data/2.5/weather?q=vytegra&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1313 of 1433 | hit
    http://api.openweathermap.org/data/2.5/weather?q=hit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1314 of 1433 | malayal
    http://api.openweathermap.org/data/2.5/weather?q=malayal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1315 of 1433 | pimentel
    http://api.openweathermap.org/data/2.5/weather?q=pimentel&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1316 of 1433 | larsnes
    http://api.openweathermap.org/data/2.5/weather?q=larsnes&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1317 of 1433 | krivodol
    http://api.openweathermap.org/data/2.5/weather?q=krivodol&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1318 of 1433 | sharan
    http://api.openweathermap.org/data/2.5/weather?q=sharan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1319 of 1433 | wanning
    http://api.openweathermap.org/data/2.5/weather?q=wanning&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1320 of 1433 | kisumu
    http://api.openweathermap.org/data/2.5/weather?q=kisumu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1321 of 1433 | blagoyevo
    http://api.openweathermap.org/data/2.5/weather?q=blagoyevo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1322 of 1433 | ginir
    http://api.openweathermap.org/data/2.5/weather?q=ginir&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1323 of 1433 | tsumeb
    http://api.openweathermap.org/data/2.5/weather?q=tsumeb&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1324 of 1433 | sodertalje
    http://api.openweathermap.org/data/2.5/weather?q=sodertalje&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1325 of 1433 | kostarazion
    http://api.openweathermap.org/data/2.5/weather?q=kostarazion&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1326 of 1433 | masterton
    http://api.openweathermap.org/data/2.5/weather?q=masterton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1327 of 1433 | ripiceni
    http://api.openweathermap.org/data/2.5/weather?q=ripiceni&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1328 of 1433 | verkhnyaya inta
    http://api.openweathermap.org/data/2.5/weather?q=verkhnyaya inta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1329 of 1433 | gurun
    http://api.openweathermap.org/data/2.5/weather?q=gurun&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1330 of 1433 | evanston
    http://api.openweathermap.org/data/2.5/weather?q=evanston&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1331 of 1433 | ankola
    http://api.openweathermap.org/data/2.5/weather?q=ankola&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1332 of 1433 | ambon
    http://api.openweathermap.org/data/2.5/weather?q=ambon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1333 of 1433 | francistown
    http://api.openweathermap.org/data/2.5/weather?q=francistown&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1334 of 1433 | juifang
    http://api.openweathermap.org/data/2.5/weather?q=juifang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1335 of 1433 | kapoeta
    http://api.openweathermap.org/data/2.5/weather?q=kapoeta&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1336 of 1433 | acarau
    http://api.openweathermap.org/data/2.5/weather?q=acarau&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1337 of 1433 | marovoay
    http://api.openweathermap.org/data/2.5/weather?q=marovoay&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1338 of 1433 | ormara
    http://api.openweathermap.org/data/2.5/weather?q=ormara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1339 of 1433 | awbari
    http://api.openweathermap.org/data/2.5/weather?q=awbari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1340 of 1433 | jiddah
    http://api.openweathermap.org/data/2.5/weather?q=jiddah&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1341 of 1433 | trairi
    http://api.openweathermap.org/data/2.5/weather?q=trairi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1342 of 1433 | tateyama
    http://api.openweathermap.org/data/2.5/weather?q=tateyama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1343 of 1433 | kristinehamn
    http://api.openweathermap.org/data/2.5/weather?q=kristinehamn&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1344 of 1433 | planeta rica
    http://api.openweathermap.org/data/2.5/weather?q=planeta rica&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1345 of 1433 | bukama
    http://api.openweathermap.org/data/2.5/weather?q=bukama&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1346 of 1433 | tocopilla
    http://api.openweathermap.org/data/2.5/weather?q=tocopilla&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1347 of 1433 | alipur duar
    http://api.openweathermap.org/data/2.5/weather?q=alipur duar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1348 of 1433 | marang
    http://api.openweathermap.org/data/2.5/weather?q=marang&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1349 of 1433 | fort dodge
    http://api.openweathermap.org/data/2.5/weather?q=fort dodge&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1350 of 1433 | ruwi
    http://api.openweathermap.org/data/2.5/weather?q=ruwi&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1351 of 1433 | gladstone
    http://api.openweathermap.org/data/2.5/weather?q=gladstone&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1352 of 1433 | inhambane
    http://api.openweathermap.org/data/2.5/weather?q=inhambane&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1353 of 1433 | pachino
    http://api.openweathermap.org/data/2.5/weather?q=pachino&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1354 of 1433 | bay-khaak
    http://api.openweathermap.org/data/2.5/weather?q=bay-khaak&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1355 of 1433 | manicore
    http://api.openweathermap.org/data/2.5/weather?q=manicore&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1356 of 1433 | bell ville
    http://api.openweathermap.org/data/2.5/weather?q=bell ville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1357 of 1433 | shalya
    http://api.openweathermap.org/data/2.5/weather?q=shalya&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1358 of 1433 | rodrigues alves
    http://api.openweathermap.org/data/2.5/weather?q=rodrigues alves&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1359 of 1433 | tyrma
    http://api.openweathermap.org/data/2.5/weather?q=tyrma&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1360 of 1433 | wolverhampton
    http://api.openweathermap.org/data/2.5/weather?q=wolverhampton&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1361 of 1433 | marathon
    http://api.openweathermap.org/data/2.5/weather?q=marathon&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1362 of 1433 | aquiraz
    http://api.openweathermap.org/data/2.5/weather?q=aquiraz&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1363 of 1433 | douglas
    http://api.openweathermap.org/data/2.5/weather?q=douglas&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1364 of 1433 | pueblo
    http://api.openweathermap.org/data/2.5/weather?q=pueblo&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1365 of 1433 | tsentralnyy
    http://api.openweathermap.org/data/2.5/weather?q=tsentralnyy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1366 of 1433 | steinkjer
    http://api.openweathermap.org/data/2.5/weather?q=steinkjer&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1367 of 1433 | royal palm beach
    http://api.openweathermap.org/data/2.5/weather?q=royal palm beach&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1368 of 1433 | fuling
    http://api.openweathermap.org/data/2.5/weather?q=fuling&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1369 of 1433 | kuopio
    http://api.openweathermap.org/data/2.5/weather?q=kuopio&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1370 of 1433 | hay river
    http://api.openweathermap.org/data/2.5/weather?q=hay river&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1371 of 1433 | papetoai
    http://api.openweathermap.org/data/2.5/weather?q=papetoai&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1372 of 1433 | bandar-e lengeh
    http://api.openweathermap.org/data/2.5/weather?q=bandar-e lengeh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1373 of 1433 | ruatoria
    http://api.openweathermap.org/data/2.5/weather?q=ruatoria&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1374 of 1433 | rawlins
    http://api.openweathermap.org/data/2.5/weather?q=rawlins&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1375 of 1433 | norrtalje
    http://api.openweathermap.org/data/2.5/weather?q=norrtalje&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1376 of 1433 | challapata
    http://api.openweathermap.org/data/2.5/weather?q=challapata&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1377 of 1433 | botou
    http://api.openweathermap.org/data/2.5/weather?q=botou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1378 of 1433 | wulanhaote
    http://api.openweathermap.org/data/2.5/weather?q=wulanhaote&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1379 of 1433 | bagn
    http://api.openweathermap.org/data/2.5/weather?q=bagn&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1380 of 1433 | alexandria
    http://api.openweathermap.org/data/2.5/weather?q=alexandria&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1381 of 1433 | almenara
    http://api.openweathermap.org/data/2.5/weather?q=almenara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1382 of 1433 | allahganj
    http://api.openweathermap.org/data/2.5/weather?q=allahganj&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1383 of 1433 | arkhangelskoye
    http://api.openweathermap.org/data/2.5/weather?q=arkhangelskoye&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1384 of 1433 | bitung
    http://api.openweathermap.org/data/2.5/weather?q=bitung&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1385 of 1433 | bonnyville
    http://api.openweathermap.org/data/2.5/weather?q=bonnyville&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1386 of 1433 | michelstadt
    http://api.openweathermap.org/data/2.5/weather?q=michelstadt&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1387 of 1433 | matamoros
    http://api.openweathermap.org/data/2.5/weather?q=matamoros&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1388 of 1433 | owerri
    http://api.openweathermap.org/data/2.5/weather?q=owerri&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1389 of 1433 | murgab
    http://api.openweathermap.org/data/2.5/weather?q=murgab&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1390 of 1433 | dalvik
    http://api.openweathermap.org/data/2.5/weather?q=dalvik&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1391 of 1433 | vavozh
    http://api.openweathermap.org/data/2.5/weather?q=vavozh&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1392 of 1433 | lujan
    http://api.openweathermap.org/data/2.5/weather?q=lujan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1393 of 1433 | asyut
    http://api.openweathermap.org/data/2.5/weather?q=asyut&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1394 of 1433 | alekseyevsk
    http://api.openweathermap.org/data/2.5/weather?q=alekseyevsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1395 of 1433 | gaziantep
    http://api.openweathermap.org/data/2.5/weather?q=gaziantep&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1396 of 1433 | spas-demensk
    http://api.openweathermap.org/data/2.5/weather?q=spas-demensk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1397 of 1433 | benjamin constant
    http://api.openweathermap.org/data/2.5/weather?q=benjamin constant&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1398 of 1433 | denpasar
    http://api.openweathermap.org/data/2.5/weather?q=denpasar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1399 of 1433 | mikhaylovka
    http://api.openweathermap.org/data/2.5/weather?q=mikhaylovka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1400 of 1433 | binzhou
    http://api.openweathermap.org/data/2.5/weather?q=binzhou&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1401 of 1433 | belle glade
    http://api.openweathermap.org/data/2.5/weather?q=belle glade&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1402 of 1433 | rio branco
    http://api.openweathermap.org/data/2.5/weather?q=rio branco&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1403 of 1433 | wanaka
    http://api.openweathermap.org/data/2.5/weather?q=wanaka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1404 of 1433 | panaba
    http://api.openweathermap.org/data/2.5/weather?q=panaba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1405 of 1433 | kidal
    http://api.openweathermap.org/data/2.5/weather?q=kidal&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1406 of 1433 | tangier
    http://api.openweathermap.org/data/2.5/weather?q=tangier&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1407 of 1433 | novosheshminsk
    http://api.openweathermap.org/data/2.5/weather?q=novosheshminsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1408 of 1433 | gotsu
    http://api.openweathermap.org/data/2.5/weather?q=gotsu&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1409 of 1433 | panzhihua
    http://api.openweathermap.org/data/2.5/weather?q=panzhihua&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1410 of 1433 | oranjemund
    http://api.openweathermap.org/data/2.5/weather?q=oranjemund&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1411 of 1433 | petropavl
    http://api.openweathermap.org/data/2.5/weather?q=petropavl&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1412 of 1433 | bakchar
    http://api.openweathermap.org/data/2.5/weather?q=bakchar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1413 of 1433 | amsterdam
    http://api.openweathermap.org/data/2.5/weather?q=amsterdam&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1414 of 1433 | rio brilhante
    http://api.openweathermap.org/data/2.5/weather?q=rio brilhante&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1415 of 1433 | duliby
    http://api.openweathermap.org/data/2.5/weather?q=duliby&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1416 of 1433 | gurgan
    http://api.openweathermap.org/data/2.5/weather?q=gurgan&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1417 of 1433 | guarapari
    http://api.openweathermap.org/data/2.5/weather?q=guarapari&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1418 of 1433 | bacuit
    http://api.openweathermap.org/data/2.5/weather?q=bacuit&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1419 of 1433 | hirara
    http://api.openweathermap.org/data/2.5/weather?q=hirara&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1420 of 1433 | makakilo city
    http://api.openweathermap.org/data/2.5/weather?q=makakilo city&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1421 of 1433 | linao
    http://api.openweathermap.org/data/2.5/weather?q=linao&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1422 of 1433 | garissa
    http://api.openweathermap.org/data/2.5/weather?q=garissa&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1423 of 1433 | port hueneme
    http://api.openweathermap.org/data/2.5/weather?q=port hueneme&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1424 of 1433 | takaka
    http://api.openweathermap.org/data/2.5/weather?q=takaka&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1425 of 1433 | snezhnogorsk
    http://api.openweathermap.org/data/2.5/weather?q=snezhnogorsk&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1426 of 1433 | beira
    http://api.openweathermap.org/data/2.5/weather?q=beira&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1427 of 1433 | ascension
    http://api.openweathermap.org/data/2.5/weather?q=ascension&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1428 of 1433 | pomabamba
    http://api.openweathermap.org/data/2.5/weather?q=pomabamba&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1429 of 1433 | gorom-gorom
    http://api.openweathermap.org/data/2.5/weather?q=gorom-gorom&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1430 of 1433 | kamenskiy
    http://api.openweathermap.org/data/2.5/weather?q=kamenskiy&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1431 of 1433 | miramar
    http://api.openweathermap.org/data/2.5/weather?q=miramar&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    Processing Record 1432 of 1433 | yining
    http://api.openweathermap.org/data/2.5/weather?q=yining&APPID=26ee17b7b6bca81b3e075392644a5aec&units=imperial
    

# Create a dataframe


```python
city_df = pd.DataFrame({
    "City" : names,
    "Cloudiness" : clouds,
    "Country" : countries,
    "Date" : dates,
    "Humidity" : hums,
    "Lat" : lats,
    "Lng" : lngs,
    "Max Temp" : max_temps,
    "Wind Speed" : wind_speeds
})

city_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>Cloudiness</th>
      <th>Country</th>
      <th>Date</th>
      <th>Humidity</th>
      <th>Lat</th>
      <th>Lng</th>
      <th>Max Temp</th>
      <th>Wind Speed</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Chokurdakh</td>
      <td>48</td>
      <td>RU</td>
      <td>1519795901</td>
      <td>80</td>
      <td>70.62</td>
      <td>147.90</td>
      <td>-18.21</td>
      <td>3.49</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Hobart</td>
      <td>75</td>
      <td>AU</td>
      <td>1519794000</td>
      <td>68</td>
      <td>-42.88</td>
      <td>147.33</td>
      <td>69.80</td>
      <td>9.17</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Jambi</td>
      <td>64</td>
      <td>ID</td>
      <td>1519796080</td>
      <td>85</td>
      <td>-1.60</td>
      <td>103.62</td>
      <td>83.31</td>
      <td>4.16</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Nurota</td>
      <td>68</td>
      <td>UZ</td>
      <td>1519794000</td>
      <td>71</td>
      <td>40.56</td>
      <td>65.69</td>
      <td>57.20</td>
      <td>14.99</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Dikson</td>
      <td>80</td>
      <td>RU</td>
      <td>1519796081</td>
      <td>100</td>
      <td>73.51</td>
      <td>80.55</td>
      <td>22.25</td>
      <td>22.84</td>
    </tr>
  </tbody>
</table>
</div>



# Temperature (F) vs. Latitude Scatter Plot


```python
plt.scatter( lats, max_temps)
plt.ylabel("Max Temperature (F)")
plt.xlabel("Latitude")
plt.title("Max Temperature vs. City Latitude")
plt.grid(True)
plt.show()
plt.savefig('Temperature (F) vs. Latitude Scatter Plot.png')
```


![png](Homework_6_files/Homework_6_9_0.png)


# Humidity (%) vs. Latitude


```python
plt.scatter( lats, hums)
plt.ylabel("Humidity")
plt.xlabel("Latitude")
plt.title("Humidity % vs. City Latitude")
plt.grid(True)
plt.show()
plt.savefig('Humidity (%) vs. Latitude.png')
```


![png](Homework_6_files/Homework_6_11_0.png)


# Cloudiness (%) vs. Latitude


```python
plt.scatter(lats ,clouds)
plt.ylabel("Cloudiness")
plt.xlabel("Latitude")
plt.title("Cloudiness (%) vs. City Latitude")
plt.grid(True)
plt.show()
plt.savefig('Cloudiness (%) vs. Latitude.png')
```


![png](Homework_6_files/Homework_6_13_0.png)


# Wind Speed (mph) vs. Latitude


```python
plt.scatter(lats ,wind_speeds)
plt.ylabel("Wind Speed (mph)")
plt.xlabel("Latitude")
plt.title("Wind Speeds vs. City Latitude")
plt.grid(True)
plt.show()
plt.savefig('Wind Speed (mph) vs. Latitude.png')
```


![png](Homework_6_files/Homework_6_15_0.png)



```python
city_df.to_csv(path_or_buf="./Cities Data.csv", sep=',')
```
