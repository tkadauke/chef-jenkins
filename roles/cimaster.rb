name "cimaster"
description "Jenkins master"
run_list(
  "role[linuxbase]",
  "recipe[jenkins::default]"
)

override_attributes(
  'jenkins' => {
    'server' => {
      'plugins' => ['credentials', 'ssh', 'ssh-slaves', 'ssh-credentials', 'ssh-agent', 'git', 'ruby-runtime', 'rvm']
    }
  },
  'set_fqdn' => 'cimaster.local'
)
