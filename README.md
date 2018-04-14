# Registeruz

[![Build Status](https://travis-ci.org/redrick/registeruz.svg?branch=master)](https://travis-ci.org/redrick/registeruz)

Gem build as SVK alternation of [CZ Ares gem](https://github.com/ucetnictvi-on-line/ares.rb)

Allows you to get company/person information based on their ICO (we purely use
it this way, but could be bent to use it otherwise :) )

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'registeruz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install registeruz

## Usage

This gem has no setup, all data it accesses is free online, just enjoy them :)

Purely based on documentation found [here on
http://www.registeruz.sk/](http://www.registeruz.sk/cruz-public/home/api)

You can find many many details there, I will present you with use case I did
this for, if you are missing something, do not hesitate to contact me, will try
to have a look shortly...

### Registeruz::Subject

You are provided with class `Registeruz::Subject` which allows you to search
through companies by attributes listed in official docs, I will go through ICO
lookup only here:

You can choose if you are searching and expect more items returned to use `where` (similar to rails activerecord method):

```ruby
> Registeruz::Subject.where(ico: 50826042)

=> [#<Registeruz::Models::Subject:0x00007f8b79871098
  @body=
   {"skNace"=>"69200",
    "konsolidovana"=>false,
    "datumPoslednejUpravy"=>"2017-11-03",
    "zdrojDat"=>"SUSR",
    "nazovUJ"=>"UOL SK s.r.o.",
    "ico"=>"50826042",
    "mesto"=>"Bratislava - mestská časť Rača",
    "ulica"=>"Karpatské námestie 10A",
    "psc"=>"83106",
    "datumZalozenia"=>"2017-04-12",
    "pravnaForma"=>"112",
    "velkostOrganizacie"=>"00",
    "druhVlastnictva"=>"7",
    "kraj"=>"1",
    "okres"=>"103",
    "sidlo"=>"529354",
    "id"=>1689373},
  @city="Bratislava - mestská časť Rača",
  @consolidated=false,
  @data_origin="SUSR",
  @dic=nil,
  @district_id="103",
  @founded_at=2017-04-12 00:00:00 +0200,
  @ico="50826042",
  @id=1689373,
  @legal_form_id="112",
  @name="UOL SK s.r.o.",
  @organization_size_id="00",
  @ownership_type_id="7",
  @postal_code="83106",
  @region_id="1",
  @residence_id="529354",
  @sk_nace_code_id="69200",
  @street="Karpatské námestie 10A",
  @updated_at=2017-11-03 00:00:00 +0100>]
```

if you get whole array of results, you can perform array operations on it...
that's a plus...

Otherwise searching by ICO seems to make more sense with usage of `find_by`
where object of `Registeruz::Subject` is being returned like this:

```ruby
> Registeruz::Subject.find_by(ico: 50826042)

=> #<Registeruz::Models::Subject:0x00007f8b7b0e8518
 @body=
  {"druhVlastnictva"=>"7",
   "kraj"=>"1",
   "okres"=>"103",
   "sidlo"=>"529354",
   "zdrojDat"=>"SUSR",
   "nazovUJ"=>"UOL SK s.r.o.",
   "mesto"=>"Bratislava - mestská časť Rača",
   "ulica"=>"Karpatské námestie 10A",
   "psc"=>"83106",
   "datumPoslednejUpravy"=>"2017-11-03",
   "datumZalozenia"=>"2017-04-12",
   "ico"=>"50826042",
   "pravnaForma"=>"112",
   "velkostOrganizacie"=>"00",
   "skNace"=>"69200",
   "konsolidovana"=>false,
   "id"=>1689373},
 @city="Bratislava - mestská časť Rača",
 @consolidated=false,
 @data_origin="SUSR",
 @dic=nil,
 @district_id="103",
 @founded_at=2017-04-12 00:00:00 +0200,
 @ico="50826042",
 @id=1689373,
 @legal_form_id="112",
 @name="UOL SK s.r.o.",
 @organization_size_id="00",
 @ownership_type_id="7",
 @postal_code="83106",
 @region_id="1",
 @residence_id="529354",
 @sk_nace_code_id="69200",
 @street="Karpatské námestie 10A",
 @updated_at=2017-11-03 00:00:00 +0100>
```

You can see all the codebook values returned with `..._id` params, which does
not do any extra queries for codebook values, but still you have their
alternatives without ending `_id` available for use like so (they return
codebook values):

```ruby
#<Registeruz::Models::Subject:0x00007fdc7aa124b8
  @city="Bratislava - mestská časť Rača",
  @consolidated=false,
  @data_origin="SUSR",
  @dic=nil,
  @district="Bratislava III",
  @founded_at=2017-04-12 00:00:00 +0200,
  @ico="50826042",
  @id=1689373,
  @legal_form="Spol. s r. o.",
  @name="UOL SK s.r.o.",
  @organization_size="nezistený",
  @ownership_type="Zahraničné",
  @postal_code="83106",
  @region="Bratislavský kraj",
  @residence="Bratislava-Rača",
  @sk_nace_code="Účtovnícke činnosti",
  @street="Karpatské námestie 10A",
  @updated_at=2017-11-03 00:00:00 +0100>
```

if you want to purely search by id you have ActiveRecord-like method `find` available:

```ruby
> Registeruz::Subject.find(1689373)

=> #<Registeruz::Models::Subject:0x00007fc6860e8950
 @body=
  {"druhVlastnictva"=>"7",
   "kraj"=>"1",
   "okres"=>"103",
   "sidlo"=>"529354",
   "zdrojDat"=>"SUSR",
   "nazovUJ"=>"UOL SK s.r.o.",
   "mesto"=>"Bratislava - mestská časť Rača",
   "ulica"=>"Karpatské námestie 10A",
   "psc"=>"83106",
   "datumPoslednejUpravy"=>"2017-11-03",
   "datumZalozenia"=>"2017-04-12",
   "ico"=>"50826042",
   "pravnaForma"=>"112",
   "velkostOrganizacie"=>"00",
   "skNace"=>"69200",
   "konsolidovana"=>false,
   "id"=>1689373},
 @city="Bratislava - mestská časť Rača",
 @consolidated=false,
 @data_origin="SUSR",
 @dic=nil,
 @district_id="103",
 @founded_at=2017-04-12 00:00:00 +0200,
 @ico="50826042",
 @id=1689373,
 @legal_form_id="112",
 @name="UOL SK s.r.o.",
 @organization_size_id="00",
 @ownership_type_id="7",
 @postal_code="83106",
 @region_id="1",
 @residence_id="529354",
 @sk_nace_code_id="69200",
 @street="Karpatské námestie 10A",
 @updated_at=2017-11-03 00:00:00 +0100>
```

The `Registeruz::Subject` that is returned has method with english names, but
here you have SVK equivalents from official docs:

- `id` - identifikátor účtovnej jednotky, maximálne desaťciferné celé číslo
- `ico` - IČO účtovnej jednotky, osemznakový textový reťazec
- `dic` - DIČ účtovnej jednotky, desaťznakový textový reťazec
- `name` - názov účtovnej jednotky, textový reťazec s maximálnou dĺžkou 500 znakov
- `city` - adresa účtovnej jednotky, mesto, textový reťazec s maximálnou dĺžkou 200 znakov
- `street` - adresa účtovnej jednotky, ulica s číslom, textový reťazec s maximálnou dĺžkou 200 znakov
- `postal_code` - adresa účtovnej jednotky, PSČ, textový reťazec s maximálnou dĺžkou 10 znakov
- `founded_at` - dátum založenia účtovnej jednotky, formát RRRR-MM-DD
- `closed_at` - dátum zrušenia účtovnej jednotky, formát RRRR-MM-DD
- `legal_form` - kód právnej formy (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `sk_nace_code` - kód SK NACE klasifikácie (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `organization_size` - kód kategórie veľkosti organizácie (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `ownership_type` - kód druhu vlastníctva (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `region` - sídlo účtovnej jednotky, kód kraja (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `district` - sídlo účtovnej jednotky, kód okresu (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `residence` - sídlo účtovnej jednotky, kód obce alebo mesta (viď Číselníky), textový reťazec s maximálnou dĺžkou 100 znakov
- `consolidated` - boolean príznak - true, ak jednotka obsahuje aspoň jednu konsolidovanú účtovnú závierku
- `data_origin` - kód zdroja, z ktorého pochádzajú dáta (viď Zdroje dát), textový reťazec s maximálnou dĺžkou 30 znakov
- `updated_at` - dátum poslednej úpravy, formát RRRR-MM-DD

When there is `Číselník` mentioned it means you will not get ID representation
of the data but gem looks it up and gives you slovak word equivalent of the
ID....


### Registeruz::FinancialStatement

You are provided with class `Registeruz::FinancialStatement` which allows you get financial statements...
Unlike above `Registeruz::Subject` this can only use these params for search:

- `pokracovat-za-id` - continue after given id
- `max-zaznamov` - max number of records returned

to search e.x. for two records starting with id 3 (returns array of objects as
ussual...):

```ruby
> Registeruz::FinancialStatement.where('pokracovat-za-id': 3, 'max-zaznamov': 2)

=> [#<Registeruz::Models::FinancialStatement:0x00007fc68613a318
  @accounting_report_ids=[7, 8],
  @assembled_for_date=2009-12-31 00:00:00 +0100,
  @body=
   {"ico"=>"00165581",
    "dic"=>"2020830152",
    "nazovUJ"=>"Najvyšší súd Slovenskej republiky",
    "datumPoslednejUpravy"=>"2013-08-18",
    "zdrojDat"=>"JUS",
    "obdobieOd"=>"2009-01",
    "obdobieDo"=>"2009-12",
    "typ"=>"Riadna",
    "konsolidovana"=>true,
    "datumZostaveniaK"=>"2009-12-31",
    "idUJ"=>31355,
    "idUctovnychVykazov"=>[7, 8],
    "id"=>4},
  @comprehensiver_finstat_of_public_admin=nil,
  @consolidated=true,
  @consolidated_check_of_central_gov=nil,
  @data_origin="JUS",
  @dic="2020830152",
```

Then if you are looking for one in particular, you can do so by using its ID:

```ruby
> Registeruz::FinancialStatement.find(1)

=> #<Registeruz::Models::FinancialStatement:0x00007fc68610ba40
 @accounting_report_ids=[1, 2],
 @assembled_for_date=2009-12-31 00:00:00 +0100,
 @body=
  {"ico"=>"30845572",
   "nazovUJ"=>"Ministerstvo obrany Slovenskej republiky",
   "datumPoslednejUpravy"=>"2013-08-18",
   "zdrojDat"=>"JUS",
   "obdobieOd"=>"2009-01",
   "obdobieDo"=>"2009-12",
   "typ"=>"Riadna",
   "konsolidovana"=>true,
   "datumZostaveniaK"=>"2009-12-31",
   "idUJ"=>442175,
   "idUctovnychVykazov"=>[1, 2],
   "id"=>1},
 @comprehensiver_finstat_of_public_admin=nil,
 @consolidated=true,
 @consolidated_check_of_central_gov=nil,
 @data_origin="JUS",
 @dic=nil,
 @fond_name=nil,
 @ico="30845572",
 @id=1,
 @lei_code=nil,
 @period_from=2009-01-01 00:00:00 +0100,
 @period_to=2009-12-01 00:00:00 +0100,
 @subject_id=442175,
 @subject_name="Ministerstvo obrany Slovenskej republiky",
 @type="Riadna",
 @updated_at=2013-08-18 00:00:00 +0200>
```

Subject is part of the response, referenced by id there (`subject_id`) and you
can get its value by calling method without `_id` like so:

```ruby
> finstat = Registeruz::FinancialStatement.find(1)
> finstat.subject

=> #<Registeruz::Models::Subject:0x00007fc6829ce898
 @body=
  {"datumPoslednejUpravy"=>"2017-11-30",
   "zdrojDat"=>"SUSR",
   "nazovUJ"=>"Ministerstvo obrany Slovenskej republiky",
   "ico"=>"30845572",
   "mesto"=>"Bratislava - mestská časť Nové Mesto",
   "ulica"=>"Kutuzovova 8",
   "psc"=>"83247",
   "datumZalozenia"=>"1993-01-01",
   "pravnaForma"=>"321",
   "velkostOrganizacie"=>"36",
   "druhVlastnictva"=>"4",
   "kraj"=>"1",
   "okres"=>"103",
   "sidlo"=>"529346",
   "idVyrocnychSprav"=>[2208382, 2619266, 3020165, 3411566],
   "idUctovnychZavierok"=>[1, 613, 557005, 558698, 698433, 697701, 1784783, 1742215, 2082509, 2208380, 2450565, 2619265, 2884031, 3019938, 3279774, 3276049, 3411565],
   "skNace"=>"84220",
   "konsolidovana"=>true,
   "id"=>442175},
 @city="Bratislava - mestská časť Nové Mesto",
 @consolidated=true,
 @data_origin="SUSR",
 @dic=nil,
 @district_id="103",
 @founded_at=1993-01-01 00:00:00 +0100,
 @ico="30845572",
 @id=442175,
 @legal_form_id="321",
 @name="Ministerstvo obrany Slovenskej republiky",
 @organization_size_id="36",
 @ownership_type_id="4",
 @postal_code="83247",
 @region_id="1",
 @residence_id="529346",
 @sk_nace_code_id="84220",
 @street="Kutuzovova 8",
 @updated_at=2017-11-30 00:00:00 +0100>
```

`Registeruz::FinancialStatement` object as is represented by enlish attributes
is meant to represent these:

- `id` - identifikátor účtovnej závierky, maximálne desaťciferné celé číslo
- `period_from` - účtovná závierka za obdobie - od, formát RRRR-MM
- `period_to` - účtovná závierka za obdobie - do, formát RRRR-MM
- `submitted_at` - dátum podania účtovnej závierky (napr. evidencia na FRSR), formát RRRR-MM-DD
- `assembled_at` - dátum, kedy bola závierka zostavená, formát RRRR-MM-DD
- `approved_at` - dátum, kedy bola závierka schválená, formát RRRR-MM-DD
- `assembled_for_date` - dátum, ku ktorému bola závierka zostavená, formát RRRR-MM-DD
- `auditor_report_added_at` - dátum priloženia správy audítora, formát RRRR-MM-DD
- `subject_name` - názov účtovnej jednotky v čase podania závierky, textový reťazec s maximálnou dĺžkou 500 znakov
- `ico` - IČO účtovnej jednotky v čase podania závierky, osemznakový textový reťazec
- `dic` - DIČ účtovnej jednotky v čase podania závierky, desaťznakový textový reťazec
- `fond_name` - názov fondu, za ktorý bola závierka predložená (v prípade že sa jedná o účtovnú závierku fondu), textový reťazec s maximálnou dĺžkou 500 znakov
- `lei_code` - LEI kód, pod ktorým bola závierka predložená, textový reťazec s dĺžkou 20 znakov
- `subject_id` - identifikátor účtovnej jednotky, maximálne desaťciferné celé číslo
- `consolidated` - boolean príznak - true, ak ide o konsolidovanú závierku
- `consolidated_check_of_central_gov` - boolean príznak - true, ak ide o konsolidovanú závierku ústrednej štátnej správy
- `comprehensiver_finstat_of_public_admin` - boolean príznak - true, ak ide o súhrnnú účtovnú závierku verejnej správy
- `type` - "Riadna", "Mimoriadna", "Priebežná" alebo "Kombinovaná" (riadna aj mimoriadna)
- `accounting_report_ids` - zoznam identifikátorov všetkých súvisiacich účtovných výkazov, identifikátor je maximálne desaťciferné celé číslo
- `data_origin` - kód zdroja, z ktorého pochádzajú dáta (viď Zdroje dát), textový reťazec s maximálnou dĺžkou 30 znakov
- `updated_at` - dátum poslednej úpravy, formát RRRR-MM-DD


### Registeruz::Api::Codebook

Otherwise you can search yourself through codebooks like this:

```ruby
Registeruz::Api::Codebook.find('sidla', '510262')

=> "Liptovský Mikuláš"
```

First param is name of the codebook, you can use one of these:

- `pravne-formy`
- `sk-nace`
- `druhy-vlastnictva`
- `velkosti-organizacie`
- `kraje`
- `okresy`
- `sidla`

if you do not pass second param, it will return the whole collection hash and
you can search for whatever you were looking for this way:

```ruby
Registeruz::Api::Codebook.find('druhy-vlastnictva')

=> [{"nazov"=>{"sk"=>"Zatiaľ nezistené", "en"=>"Not ascertained yet"},"kod"=>"0"},
 {"nazov"=>{"sk"=>"Medzinárodné - verejné", "en"=>"Internatonial-public"},"kod"=>"1"},
 {"nazov"=>{"sk"=>"Súkromné tuzemské", "en"=>"Private inland"}, "kod"=>"2"},
 {"nazov"=>{"sk"=>"Družstevné", "en"=>"Cooperative-owned"}, "kod"=>"3"},
 {"nazov"=>{"sk"=>"Štátne", "en"=>"State-owned"}, "kod"=>"4"},
 {"nazov"=>{"sk"=>"Vlast.územnej samosprávy", "en"=>"Municipality-owned"},"kod"=>"5"},
 {"nazov"=>{"sk"=>"Združ.,p.strany,cirkvi", "en"=>"Ownership of associat."}, "kod"=>"6"},
 {"nazov"=>{"sk"=>"Zahraničné", "en"=>"Foreign"}, "kod"=>"7"},
 {"nazov"=>{"sk"=>"Medzinárodné - súkromné", "en"=>"International-private"}, "kod"=>"8"},
 {"nazov"=>{"sk"=>"Zmiešané", "en"=>"Mixed"}, "kod"=>"9"}]
```

Enjoy!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/registeruz. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GemTemplate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/registeruz/blob/master/CODE_OF_CONDUCT.md).
