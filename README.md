# Fluent::Plugin::Json::Serializer

## 概要

* TD-agent v0.12以降で動作する、filterプラグインです
* fluentdに来たrecordを、1つのキーに収納します

## plugin詳細

```
{
  "action":"login",
  "user":2
}
```

こういった形のtd-agentデータを

```
{
  "message" : {
     "action":"login",
     "user":2
  }
}
```
こういう形に変換します。(field_nameに「message」を指定したとき)


## Installation
td-agent 0.12.0 以上

```
$ cd /usr/local/src
$ git clone ssh://git@stash.gu3.jp:7999/error-handling/fluent-plugin-json-serializer.git
$ cd ./fluent-plugin-json-serializer
$ /usr/lib64/fluent/ruby/bin/rake build
$ /opt/td-agent/embedded/bin/fluent-gem install pkg/fluent-plugin-json-serializer
```


## Usage

```
<filter **>
  type serializer
  field_name message
</filter>

<match **>
  type stdout
</match>
```

## ToDo

* READMEを充実

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fluent-plugin-json-serializer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
