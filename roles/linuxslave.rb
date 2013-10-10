name "linuxslave"
description "Jenkins Linux slave"
run_list(
  "role[linuxbase]",
  "recipe[java]",
  "recipe[jenkins::node_ssh]",
  "recipe[git]",
  "recipe[rvm::user]",
  "recipe[mysql::server]",
  "recipe[mysql::client]",
  "recipe[memcached]",
  "recipe[slave]"
)

override_attributes(
  'jenkins' => {
    'server' => {
      'host' => 'cimaster.local',
      'url' => 'http://cimaster.local:8080',
    },
    'node' => {
      'labels' => 'linux'
    }
  },
  'mysql' => {
    'server_root_password' => ''
  }
)
