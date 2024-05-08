# A puppet manifest to replace a line in a file on a server
# The file to edit is /var/www/html/wp-settings.php
# The line to replace is the one containing "phpp" with "php"

$file_to_edit = '/var/www/html/wp-settings.php'

#replace line containing "phpp" with "php"

exec { 'replace_line':
  command => "sed -i 's/phpp/php/g' ${file_to_edit}",
  path    => ['/bin','/usr/bin']
}
