# fluent-plugin-k8s[![Gem Version](https://badge.fury.io/rb/fluent-plugin-k8s.svg)](https://rubygems.org/gems/fluent-plugin-k8s)

Fluent plugin for get simple metadata of k8s


## Installation


Install it yourself as:

    $ gem install fluent-plugin-k8s

## Configuration

```
<filter **>
  @type k8s
</filter>
```

## Usage

```
<source>
  @type file
  ...
  tag raw.kubernetes.**
</source>

<filter raw.kubernetes.**>
  @type k8s
</filter>

<match **>
  @type stdout
</match>
```


