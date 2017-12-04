<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit5824ebd42bb314a17cf23f4cdcca4019
{
    public static $prefixLengthsPsr4 = array (
        'K' => 
        array (
            'Klein\\' => 6,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Klein\\' => 
        array (
            0 => __DIR__ . '/..' . '/klein/klein/src/Klein',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit5824ebd42bb314a17cf23f4cdcca4019::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit5824ebd42bb314a17cf23f4cdcca4019::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
