<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CustomerTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    protected static $name = [
        'Maria', 'Luis', 'Alessandro',
        'Franco', 'Victor', 'Lucia',
        'Silvia', 'Lionel', 'Jorge',
        'Diana', 'Yahira', 'Jose',
    ];

    protected static $surname = [
        'Quispe', 'Perez', 'Lopez',
        'Benitez', 'Garcia', 'Restepo',
        'Colchado', 'Estupinan', 'Quinones',
        'Santos', 'Messi', 'Tragliafico',
    ];

    protected static $domain = [
        'gmail', 'hotmail', 'estudio',
        'rapid', 'outlook', 'microsoft',
        'amazon', 'gob', 'dev',
        'nasa', 'laravel', 'eloquent',
    ];

    protected static $prefijo = [
        'Calle', 'Avenida', 'Jiron',
        'Prolongacion', 'Parque', 'Pasaje',
        'Mercado', 'Circuito', 'Urbanización',
        'Plaza', 'Independencia', 'Asentamiento Humano',
    ];

    protected static $lugar = [
        'Mirasol', 'Los Jasmines', 'Revolucion',
        '28 de Julio', 'Los Olvidados de Dios', 'Galaxia',
        'Batalla', 'Fresnos', 'Huascar',
        'Las Fresas', 'Independencia', 'Arica',
    ];

    protected static $district = [
        'Miraflores', 'Surco', 'Lima',
        'San Miguel', 'Magdalena', 'Jesus Maria',
        'Pueblo Libre', 'Callao', 'La Perla',
    ];

    public function run(): void
    {
        DB::table('customers')->delete();
        for( $i = 0; $i < 100; $i++ )  {
            $name = self::$name[rand(0,11)];
            $surname = self::$surname[rand(0,11)];
            $surname2 = self::$surname[rand(0,11)];
            DB::table('customers')->insert([
                'name' =>   $name . " " . $surname . " " . $surname2,
                'identification' => rand(0,9) . 
                    rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) .
                    rand(0,9) . rand(0,9) . rand(0,9),
                'email' => strtolower( $name[0] . $surname . "@" . self::$domain[rand(0,11)] . ".com"),
                'address' => self::$prefijo[rand(0,11)] . " " . 
                             self::$lugar[rand(0,11)] . " " . 
                             rand(1,9) . rand(0,9) . rand(0,9) . rand(0,9),
                'phone' => '9' . rand(7,9) . rand(7,9) . rand(0,9) . 
                            rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9) . rand(0,9),
                'district' => self::$district[rand(0,8)],
                'birthday' => rand(1976,2003) . "-" . rand(10,28) . "-0". rand(1,9)                 
            ]);
        }
    }
}
