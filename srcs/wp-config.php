<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'username' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'er5l#R&W+:;exC{>SC0eeGZnI<u>hy>k$$?SbRF|$|.E*el{hWxJ>.-b<6/0@NkC' );
define( 'SECURE_AUTH_KEY',  'Bi0l+>NSvM+[|TEDz#W|TG7IJkg F?;b;^dXx>D}H]{&v8!;|h*8@pDL2[8w#iBU' );
define( 'LOGGED_IN_KEY',    'lm}Tb/qSgymfh0p-@Ek+`)#[L|F5Sa9Oh+>Z|]w8``7sN_qM<K84M#kn%,;i7%@e' );
define( 'NONCE_KEY',        '^Zs0=A|E$EF]%08Qab!8ETWnnSbv3UmL4h!Ato_*.j`mEzPHFfGWcSxP9%HzT{_*' );
define( 'AUTH_SALT',        'shS+.Ww`IjRjh!Y{SUz5eYceHDn}@vC~XovOo!/_S&H5-c><M-xg%smIv57C%zCD' );
define( 'SECURE_AUTH_SALT', 'A*gYp{?0{&UrpbD.#*,UrCd8nT_!?O7R6*~MmHtR4`#=9rvA16@U%yjNEAL866`p' );
define( 'LOGGED_IN_SALT',   'N9>ymEHT5wEWEu||kV3V 8R,eLh^z[O0{700TCT#u3.WoJ|`D/T]HW{m9e=3 2w`' );
define( 'NONCE_SALT',       '#.#!r[|Jy/)`@J+R0EMz-VL)-/emevogm+Hy}LjE-JUDb{NtM*&w+J4@h>/8;=bp' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

