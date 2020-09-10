# fluent-plugin-k8s[![Gem Version](https://badge.fury.io/rb/fluent-plugin-k8s.svg)](https://rubygems.org/gems/fluent-plugin-k8s)

Fluent plugin for get simple metadata of k8s


## Installation


Install it yourself as:

    $ gem install fluent-plugin-k8s

## Configuration

```xml
<filter **>
  @type k8s
</filter>
```

## Usage

```xml
<source>
  @type file
  path /car/log/containers/*.log
  tag raw.kubernetes.**
</source>

<filter raw.kubernetes.**>
  @type k8s
</filter>

<match **>
  @type stdout
</match>
```

The k8S you can get include POD name, namespace, Container name, and dockerId.

```json
{
"pod_name": "influxdb-1",
"namespace_name": "monitoring",
"container_name": "influxdb"
}
```
