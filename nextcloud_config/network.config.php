<?php
$host = getenv('SERVICE_HOST');
$CONFIG = array (
'trusted_domains' =>
  array (
    0 => $host,
  ),
  'overwrite.cli.url' => 'http://' . $host,
  'trusted_proxies' => ['nginx-server'],
);