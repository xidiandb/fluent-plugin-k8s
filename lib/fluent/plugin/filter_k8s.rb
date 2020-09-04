require 'fluent/plugin/filter'

module Fluent::Plugin
  class K8sFilter < Filter
    Fluent::Plugin.register_filter('k8s', self)
    config_param :tag_regexp,
                 :string,
                 :default => 'var\.log\.containers\.(?<pod_name>[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)_(?<namespace>[^_]+)_(?<container_name>.+)-(?<docker_id>[a-z0-9]{64})\.log$'
    def configure(conf)
      super
      @tag_compiled = Regexp.compile(@tag_regexp)
    end

    def filter(tag, time, record)
      tag_match_data = tag.match(@tag_compiled)
      if !!tag_match_data
        record['namespace_name']=tag_match_data['namespace']
        record['pod_name']=tag_match_data['pod_name']
        record['container_name']=tag_match_data['container_name']
      end
      record
    end
  end
end
