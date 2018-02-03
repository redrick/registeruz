# Registeruz

[![Build Status](https://travis-ci.org/redrick/registeruz.svg?branch=master)](https://travis-ci.org/redrick/registeruz)

Gem build as SVK alternation of [CZK Ares gem](https://github.com/ucetnictvi-on-line/ares.rb)

Allows you to get company/person information based on their ICO (we purely use
it this way, but could be bent to use it otherwise :) )

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gem_template'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem_template

## Usage

This gem has no setup, all data it accesses is free online, just enjoy them :)

Purely based on documentation found [here on
http://www.registeruz.sk/](http://www.registeruz.sk/cruz-public/home/api)

You can find many many details there, I will present you with use case I did
this for, if you are missing something, do not hesitate to contact me, will try
to have a look shortly...

You are provided with class `Registeruz::Subject` which allows you to search
through companies by attributes listed in official docs, I will go through ICO
lookup only here:

You can choose if you are searching and expect more items returned to use `where` (similar to rails activerecord method):

```ruby
Registeruz::Subject.where(ico: 50826042)

[#<Registeruz::Models::Subject:0x00007fdc7a1a57a8
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
  @updated_at=2017-11-03 00:00:00 +0100>]
```

if you get whole array of results, you can perform array operations on it...
that's a plus...

Otherwise searching by ICO seems to make more sense with usage of `find_by`
where object of `Registeruz::Subject` is being returned like this:

```ruby
Registeruz::Subject.find_by(ico: 50826042)

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

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gem_template. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GemTemplate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/gem_template/blob/master/CODE_OF_CONDUCT.md).
