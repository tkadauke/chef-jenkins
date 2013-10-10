name "linuxbase"
description "Linux base"
run_list(
  "recipe[hostname]",
  "recipe[autoetchosts]",
  "recipe[apt]",
  "recipe[avahi-daemon::enable]",
  "recipe[sudo]"
)

override_attributes(
  'authorization' => {
    'sudo' => {
      'groups' => ["admin"],
      'users' => ['ubuntu'],
      'passwordless' => true
    }
  }
)
