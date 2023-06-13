<?php
$CONFIG = array (
  'mail_smtpmode' => 'smtp',
  'mail_domain' => 'lattemaurice.fr',
  "mail_smtphost"     => getenv('SMTP_HOST'),
  "mail_smtpport"     => getenv('SMTP_PORT'),
  "mail_smtpsecure"   => getenv('SMTP_SECURE'),
  "mail_smtpauth"     => true,
  "mail_smtpname"     => getenv('SMTP_NAME'),
  "mail_smtppassword" => getenv('SMTP_PASSWORD'),
  'mail_from_address' => getenv('MAIL_FROM_ADDRESS'),
  'mail_domain'       => getenv('MAIL_DOMAIN'),
);