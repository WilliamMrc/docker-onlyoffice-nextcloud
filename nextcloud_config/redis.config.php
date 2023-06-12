<?php
$CONFIG = array (
'filelocking.enabled' => true,
'memcache.distributed' => '\OC\Memcache\Redis',
'memcache.local' => '\OC\Memcache\Redis',
'memcache.locking' => '\OC\Memcache\Redis',
/**
 * Connection details for redis to use for memory caching in a single server configuration.
 *
 * For enhanced security it is recommended to configure Redis
 * to require a password. See http://redis.io/topics/security
 * for more information.
 *
 */
'redis' => [
	'host' => getenv('REDIS_HOST'),
	'port' => getenv('REDIS_HOST_PORT')
],
);